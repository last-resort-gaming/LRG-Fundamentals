/*
Function: LR_fnc_SpawnCivilians

Description:
    Used to populate an area with a certain type of civilians. Spawns pedestrian
	patrols, garrisoned peds, vehicle patrols and parked vehicles.

Arguments:
	_grpPrefix - The prefix for the group IDs <STRING>
    _center - The center position of the area we want to populate <POSITION 3D>
    _radius - The radius of the area we want to populate <SCALAR>
    _faction - The faction which we want to use for populating the AO <STRING>
	_side - The side of the civilians <SIDE>
    _garrisons - Garrison Parameters <ARRAY OF [Min Amount of Units, Random Upper Bound of Units]>
    _ped - Pedestrian Parameters <ARRAY OF [Min Amount of Units, Random Upper Bound of Units]>
    _vehpatrol - Vehicle Patrol Parameters <ARRAY OF [Min Amount of Vehicles, Random Upper Bound of Vehicles]>
    _vehparked - Parked Vehicles Parameters <ARRAY OF [Min Amount of Vehicles, Random Upper Bound of Vehicles]>

Example:
	(begin example)
	    [
            "Kavala",
	        [2955.43,6010.11,0],
	        500,
	        "CIV_Default",
			civilian,
	        [5, 10],
	        [13, 25],
			[2,4],
			[1,3]
	        ] call LR_fnc_SpawnCivilians;
	(end)

Author:
    Mokka
*/

// SLACK provides us with some additional spawning positions later on, just to be safe...
#define SLACK 2

// MAX_SEARCH_ITS provides an upper bound for radius extensions when polling road positions,
// so we don't have to search the entire map
#define MAX_SEARCH_ITS 20

// If we don't find enough road positions in the radius, extend radius step-wise by this amount
#define EXT_RADIUS 100

if (!isserver) exitwith {};

params [
	"_grpPrefix", "_center", "_radius",
	["_faction", "CIV_Default"],
	["_side", civilian],
	["_garrisons", [0, 0]],
	["_ped", [0, 0]],
	["_vehpatrol", [0, 0]],
	["_vehparked", [0, 0]]
];

private _AIReporting = LRG_AI_Reporting;

_typeNameCenter = typeName _center;

call {
	if (_typeNameCenter isEqualTo "OBJECT") exitwith { _center = getPos _center;};
	if (_typeNameCenter isEqualTo "STRING") exitwith { _center = getMarkerPos _center;};
	if (_typeNameCenter isEqualTo [0, 0, 0]) exitwith {systemchat "CivSpawns - Position is invalid";};
};

_center set [2, 0];
if (_center isEqualTo [0, 0]) exitWith {systemChat "Center for SpawnCivilians may not be [0, 0]!"};

_garrisons params ["_garrisonsMin", "_garrisonsMax"];
_ped params ["_pedMin", "_pedMax"];
_vehpatrol params ["_vehpatrolMin", "_vehpatrolMax"];
_vehparked params ["_vehparkedMin", "_vehparkedMax"];

_GetFactionArrays = compileFinal format ["call LR_fnc_%1", _faction];
_FactionArrays = call _GetFactionArrays;
_FactionArrays params ["_pedPool", "_motPool"];

// Populate road positions for waypoints etc...
// Obtain as many positions as we need
_minPositions = _garrisonsMax + _pedMax + _vehpatrolMax + _vehparkedMax + SLACK;

// Get list of roads around the center
_roadList = [];
_roadList = _center nearRoads _radius;

// Now increase the search radius until we have found enough positions
if (count _roadList < _minPositions) then {
	_i = 0;
	_radExtension = 0;
	// If we exceed our max in iterations, abort and use random positions instead...
	while {(count _roadList < _minPositions) && (_i < MAX_SEARCH_ITS)} do {
		_radExtension = _radExtension + EXT_RADIUS;
		_roadList = _center nearRoads (_radius + _radExtension);
		_i = _i + 1;
	};
};

// If we still don't have enough positions, fill the remaining spots up with random positions
if (count _roadList < _minPositions) then {
	while {count _roadList < _minPositions} do {
		_rpos = [[[_center, _radius],[]],["water"]] call LR_fnc_SafePos;
		_roadList append [_rpos];
	};
};

// Shuffle the road array to have random spawn locations
_roadList = _roadList call BIS_fnc_arrayShuffle;

// Now let's get to spawning civilians...
private _units = [];
private _vehicles = [];

///////////////////////////////////////////////////////////
// GARRISONS
///////////////////////////////////////////////////////////
if !(_pedPool isEqualTo []) then {
    if (_garrisonsMax > 0) then {
       private _GarDif = _garrisonsMax - _garrisonsMin;
        if (_GarDif <0) then {_GarDif = 0};

        private _garrisonsExact = _garrisonsMin + floor (random _GarDif);
        private _garrisonedUnits = [
            _center,
            [0, _radius],
            _faction, _side,
			_pedPool, _garrisonsExact
        ] call LR_fnc_CivilianGarrison;

        _units append _garrisonedUnits;

        private _grps = [];
        { _grps pushBackUnique (group _x); nil } count _units;

        // tag groups
        { _x setGroupIdGlobal [format["%1_gar%2", _grpPrefix, _forEachIndex]]; } forEach _grps;
    };
} else {
    if (_AIReporting && { _garrisonsMax > 0 }) exitwith {systemchat format ["LRG Fundamentals: INFO: %1 no Civilian peds to select from. Step skipped.",_faction]};
};

///////////////////////////////////////////////////////////
// STANDARD INFANTRY
///////////////////////////////////////////////////////////
if !(_pedPool isEqualTo []) then {
   private _pedDif = _pedMax - _pedMin;
    if (_pedDif <0) then {_pedDif = 0};

    for "_x" from 1 to (_pedMin + floor(random _pedDif)) do {
        private _rpos = selectRandom _roadList;
		private _g = createGroup [_side, true];
		private _u = _g createUnit [selectRandom _pedPool, _rpos, [], 0, "NONE"];

        _g setGroupIdGlobal [format["%1_inf%2", _grpPrefix, _x]];

		// Setup patrol task
		[_g, _roadList] call LR_fnc_CivilianPatrol;
        _units append (units _g);
    };
} else {
    if (_AIReporting && { _pedMax > 0 }) exitwith {systemchat format ["LRG Fundamentals: INFO: %1 no Civilian peds to select from. Step skipped.",_faction]};
};


///////////////////////////////////////////////////////////
// VEHICLES (PATROL)
///////////////////////////////////////////////////////////
if !((_motPool isEqualTo []) || (_pedPool isEqualTo [])) then {
   private _vehpatrolDif = _vehpatrolMax - _vehpatrolMin;
    if (_vehpatrolDif <0) then {_vehpatrolDif = 0};

    for "_x" from 1 to (_vehpatrolMin + floor(random _vehpatrolDif)) do {
        private _rpos = selectRandom _roadList;
		private _dir = round (random 360);

		// Obtain direction stuff, bit of a pain...
		if ((typeName _rpos) isEqualTo "OBJECT") then {
			_adjRoad = (roadsConnectedTo _rpos) select 0;
			_dir = [_rpos, _adjRoad] call BIS_fnc_dirTo;
		};

		private _g = createGroup [_side, true];
		private _u = _g createUnit [selectRandom _pedPool, _rpos, [], 0, "CAN_COLLIDE"];
		[_u] joinSilent _g;

        _g setGroupIdGlobal [format["%1_vehPatrol%2", _grpPrefix, _x]];

		private _v = createVehicle [(selectRandom _motPool), _rpos];
		_v setDir _dir;

		_u assignAsDriver _v;
		_u moveInDriver _v;

		// Setup patrol task
		[_g, _roadList] call LR_fnc_CivilianPatrol;
        _units append (units _g);
		_vehicles append [_v];
    };
} else {
    if (_AIReporting && { _vehpatrolMax > 0 }) exitwith {systemchat format ["LRG Fundamentals: INFO: %1 no Civilian peds or vehicles to select from. Step skipped.",_faction]};
};

///////////////////////////////////////////////////////////
// VEHICLES (PARKED)
///////////////////////////////////////////////////////////
if !(_motPool isEqualTo []) then {
   private _vehparkedDif = _vehparkedMax - _vehparkedMin;
    if (_vehparkedDif <0) then {_vehparkedDif = 0};

    for "_x" from 1 to (_vehparkedMin + floor(random _vehparkedDif)) do {
        private _rpos = selectRandom _roadList;
		private _dir = round (random 360);

		// Obtain direction stuff, bit of a pain...
		if ((typeName _rpos) isEqualTo "OBJECT") then {
			private _connectedRoads = roadsConnectedTo _rpos;
			if ((count _connectedRoads) > 0) then {
				_adjRoad = _connectedRoads select 0;
				_dir = [_rpos, _adjRoad] call BIS_fnc_dirTo;
			};
		};

		private _v = createVehicle [(selectRandom _motPool), _rpos];
		_v setDir _dir;
		_v setPos [((getPos _v) select 0) - 6, (getPos _v) select 1, (getPos _v) select 2];

        _vehicles append [_v];
    };
} else {
    if (_AIReporting && { _vehparkedMax > 0 }) exitwith {systemchat format ["LRG Fundamentals: INFO: %1 no Civilian vehicles to select from. Step skipped.",_faction]};
};

// Set up dynamic sim and curator stuff

{
	if !(dynamicSimulationEnabled (group _x)) then {
		(group _x) enableDynamicSimulation true;
	};
	_x 	disableAI "AUTOCOMBAT";
} forEach _units;

{
	if !(dynamicSimulationEnabled (group _x)) then {
		(group _x) enableDynamicSimulation true;
	};
} forEach _vehicles;

{
	_x addCuratorEditableObjects [_units, false];
	_x addCuratorEditableObjects [_vehicles, true];
} forEach allCurators;

[_units, _vehicles]
