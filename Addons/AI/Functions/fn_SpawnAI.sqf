/*
Function: LR_fnc_SpawnAI

Description:
    Used to populate an area with a predefined enemy faction. This function has a large list of parameters
    to adjust the number of enemies spawned. It's advised to use the numbers in this function sparingly.
    It's easy to spawn in huge numbers which could cause a temporary drop in frames.
    This function works best when executed prior to mission start but can be executed during the mission
    in the Debug Console for on the fly objectives.

Parameters:
	_grpPrefix - The prefix for the group IDs <STRING>
    _center - The center position of the area we want to populate <POSITION 3D>
    _radius - The radius of the area we want to populate <SCALAR>
    _faction - The faction which we want to use for populating the AO <STRING>
    _garrisons - Garrison Parameters <ARRAY OF [Group Count, Min Radius, Max Radius, Skill Level of Garrisoned Units, Max Fill in Buildling, Exclusion List]>
    _inf - Infantry Parameters <ARRAY OF [Min Amount of Groups, Random Upper Bound of Groups]>
    _infaa - AA Parameters <ARRAY OF [Min Amount of Groups, Random Upper Bound of Groups]>
    _infat - AT Parameters <ARRAY OF [Min Amount of Groups, Random Upper Bound of Groups]>
    _sniper - Sniper Parameters <ARRAY OF [Min Amount of Groups, Random Upper Bound of Groups]>
    _vehaa - Vehicle-based AA Parameters <ARRAY OF [Min Amount of Groups, Random Upper Bound of Groups]>
    _vehmrap - MRAP Parameters <ARRAY OF [Min Amount of Groups, Random Upper Bound of Groups]>
    _vehran - Random Vehicles Parameters <ARRAY OF [Min Amount of Groups, Random Upper Bound of Groups]>
    _vehlight - Light Vehicles Parameters <ARRAY OF [Min Amount of Groups, Random Upper Bound of Groups]>
    _vehheavy - Heavy/Armoured Vehicle Parameters <ARRAY OF [Min Amount of Groups, Random Upper Bound of Groups]>

Example:
	--- Code
	    [
            "Objective 1",
	        [2955.43,6010.11,0],
	        500,
	        "Sahrani Liberation Army",
	        [5, 100, 200],
	        [3, 5]
	        ] call LR_fnc_SpawnAI;
	        Example 2:
	        ["Kavala",
	        [2955.43,6010.11,0],
	        500,
	        "Chernarussian Red Star",
	        [5, 200, 400],
	        [5, 10],
	        [2, 3],
	        [3, 4],
	        [2, 3],
	        [4, 5],
	        [2, 3],
	        [2, 3],
	        [5, 6]
        ] call LR_fnc_SpawnAI;
	---
*/
if (!isserver) exitwith {};

params [
	"_grpPrefix", "_center", "_radius",
	["_faction", "CSAT"],
	["_garrisons", [1,0,60, "LRG Default", 4, []]],
	["_inf", [3,3]],
	["_infaa", [0,0]],
	["_infat", [0,0]],
	["_sniper", [0,0]],
	["_vehaa", [0,0]],
	["_vehmrap", [0,0]],
	["_vehrand", [0,0]],
	["_vehlight", [0,0]],
	["_vehheavy", [0,0]]
];

_typeNameCenter = typeName _center;

call {
	if (_typeNameCenter isEqualTo "OBJECT") exitwith { _center = getPos _center;};
	if (_typeNameCenter isEqualTo "STRING") exitwith { _center = getMarkerPos _center;};
	if (_typeNameCenter isEqualTo [0, 0, 0]) exitwith {systemchat "AISpawns - Position is invalid";};
};

_center set [2, 0];

_garrisons params ["_garrisonGroupCount", ["_garrisonMinRad", 0], ["_garrisonMaxRad", 60], ["_garrisonSkill", 2], ["_garrisonFill", 4], ["_garrisonExcludes", []]];
_inf params ["_infMin", ["_infRand", 0], ["_infSkill", "LRG Default"]];
_infaa params ["_infaaMin", ["_infaaRand",0], ["_infaaSkill", "LRG Default"]];
_infat params ["_infatMin", ["_infatRand",0], ["_infatSkill", "LRG Default"]];
_sniper params ["_sniperMin", ["_sniperRand",0], ["_sniperSkill", "LRG Default"]];
_vehaa params ["_vehaaMin", ["_vehaaRand",0], ["_vehaaSkill", "LRG Default"]];
_vehmrap params ["_vehmrapMin", ["_vehmrapRand",0], ["_vehmrapSkill", "LRG Default"]];
_vehrand params ["_vehrandMin", ["_vehrandRand",0], ["_vehrandSkill", "LRG Default"]];
_vehlight params ["_vehlightMin", ["_vehlightRand",0], ["_vehlightSkill", "LRG Default"]];
_vehheavy params ["_vehheavyMin", ["_vehheavyRand",0], ["_vehheavySkill", "LRG Default"]];

///////////////////////////////////////////////////////////
// UNIT TYPES
///////////////////////////////////////////////////////////

private ["_infList", "_confBase", "_infaaList", "_infatList", "_sniperList", "_vehAAList", "_vehMrapList", "_vehRandList", "_vehLightList", "_vehHeavyList"];

// TODO: UAVs ?

// Set the Default Faction if all else fails
private _side = East;
private _FactionSide = "East";
private _InfantryType = "Infantry";
private _InfantryGroup = "OIA_InfTeam";
private _vehRandList = [];

// Check for Side from _faction
private _SideNumber = getnumber (configfile >> "CfgFactionClasses" >> _faction >> "side");

call {
 	if (_sidenumber IsEqualTo 0) exitwith {
		 _side = East;
		 _FactionSide = "East";
	};
 	if (_sidenumber IsEqualTo 1) exitwith {
		 _side = West;
		 _FactionSide = "West";
	};
 	if (_sidenumber IsEqualTo 2) exitwith {
		 _side = Resistance;
		 _FactionSide = "Indep";
	};
};
if (isnil "_Faction") exitwith {systemchat format ["Faction missing from %1 at %2",_grpPrefix, _center]};

_GetFactionArrays = compileFinal format ["call LR_fnc_%1", _faction];
_FactionArrays = call _GetFactionArrays;
_FactionArrays params ["_InfantryType", "_infaaList", "_infatList", "_sniperList", "_vehAAList", "_vehMrapList", "_vehLightList", "_vehHeavyList"];

private ["_x","_g","_pos","_flatPos","_rpos","_v"];

// Simple protection for broken requests
if (_center isEqualTo [0,0]) exitWith {};

_confBase = configfile >> "CfgGroups" >> _FactionSide >> _faction >> _InfantryType;
if (isnil "_infList") then {_infList = ("true" configClasses _confBase) apply { configName _x };};

// Prep return values
private _units = [];
private _vehicles = [];

///////////////////////////////////////////////////////////
// GARRISONS
///////////////////////////////////////////////////////////

if (_garrisonGroupCount > 0) then {

    private _garrisonedUnits = (
        [
            _center,
            [_garrisonMinRad, _garrisonMaxRad],
            _side, _FactionSide,
            _faction, _InfantryType,
            _infList, _garrisonGroupCount,
            nil, _garrisonSkill,
            _garrisonFill, _garrisonExcludes
        ] call LR_fnc_infantryGarrison
    );
    _units append _garrisonedUnits;

    private _grps = [];
    { _grps pushBackUnique (group _x); nil } count _units;

    // tag groups
    { _x setGroupIdGlobal [format["%1_gar%2", _grpPrefix, _forEachIndex]]; } forEach _grps;
};

///////////////////////////////////////////////////////////
// STANDARD INFANTRY
///////////////////////////////////////////////////////////
if !(_infList isEqualTo []) then {
    for "_x" from 1 to (_infMin + floor(random (_infRand+1))) do {
        _rpos = [[[_center, _radius],[]],["water"]] call BIS_fnc_randomPos;
        _g = [_rpos, _side, _confBase >> (selectRandom _infList)] call BIS_fnc_spawnGroup;
        _g setGroupIdGlobal [format["%1_inf%2", _grpPrefix, _x]];
        [_g, _center, _radius/1.5, 3 + round (random 2), ["SAD", "MOVE"] select (random 1 > 0.33), ["AWARE", "SAFE"] select (random 1 > 0.5), ["red", "white"] select (random 1 > 0.2), ["limited", "normal"] select (random 1 > 0.5)] call CBA_fnc_taskPatrol;
        [_g, _infSkill] call LR_fnc_SetUnitSkill;
        _units append (units _g);
    };
};

///////////////////////////////////////////////////////////
// AA INFANTRY
///////////////////////////////////////////////////////////

if !(_infaaList isEqualTo []) then {
    for "_x" from 1 to (_infaaMin + floor(random (_infaaRand+1))) do {
        _rpos = [[[_center, _radius],[]],["water"]] call BIS_fnc_randomPos;
        _g = [_rpos, _side, _confBase >> (selectRandom _infaaList)] call BIS_fnc_spawnGroup;
        _g setGroupIdGlobal [format["%1_infaa%2", _grpPrefix, _x]];
        [_g, _center, _radius/1.5, 3 + round (random 2), "SAD", ["AWARE", "SAFE"] select (random 1 > 0.5), ["red", "white"] select (random 1 > 0.2), ["limited", "normal"] select (random 1 > 0.5)] call CBA_fnc_taskPatrol;
        [_g, _infaaSkill] call LR_fnc_SetUnitSkill;
        _units append (units _g);
    };
};

///////////////////////////////////////////////////////////
// AT INFANTRY
///////////////////////////////////////////////////////////

if !(_infatList isEqualTo []) then {
    for "_x" from 1 to (_infatMin + floor(random (_infatRand+1))) do {
        _rpos = [[[_center, _radius],[]],["water"]] call BIS_fnc_randomPos;
        _g = [_rpos, _side, _confBase >> (selectRandom _infatList)] call BIS_fnc_spawnGroup;
        _g setGroupIdGlobal [format["%1_infat%2", _grpPrefix, _x]];
        [_g, _center, _radius/1.5, 3 + round (random 2), "SAD", ["AWARE", "SAFE"] select (random 1 > 0.5), ["red", "white"] select (random 1 > 0.2), ["limited", "normal"] select (random 1 > 0.5)] call CBA_fnc_taskPatrol;
        [_g, _infatSkill] call LR_fnc_SetUnitSkill;
        _units append (units _g);
    };
};

///////////////////////////////////////////////////////////
// SNIPER TEAMS
///////////////////////////////////////////////////////////
if !(_sniperList isEqualTo []) then {
    for "_x" from 1 to (_sniperMin + floor(random (_sniperRand+1))) do {
        _rpos = [_center, _radius, 100, 20] call BIS_fnc_findOverwatch;
        _g = [_rpos, _side, _confBase >> (selectRandom _sniperList)] call BIS_fnc_spawnGroup;
        _g setGroupIdGlobal [format["%1_sniper%2", _grpPrefix, _x]];
        _g setBehaviour "COMBAT";
        _g setCombatMode "RED";
        [_g, _sniperSkill] call LR_fnc_SetUnitSkill;
        _units append (units _g);
    };
};

///////////////////////////////////////////////////////////
// AA
///////////////////////////////////////////////////////////

if !(_vehAAList isEqualTo []) then {
    for "_x" from 1 to (_vehaaMin + floor(random (_vehaaRand+1))) do {

        _g = createGroup _side;
        _g setGroupIdGlobal [format ["%1_VehAA%2", _grpPrefix, _x]];

        _rpos = [[[_center, _radius], []], ["water"], { !(_this isFlatEmpty [2,-1,0.5,1,0,false,objNull] isEqualTo []) }] call BIS_fnc_randomPos;

        if !(_rpos isEqualTo [0,0]) then {
            _v = (selectRandom _vehAAList) createVehicle _rpos ;
            _v lock 2;

            [_v, _g] call BIS_fnc_spawnCrew;
            [_g, _center, _radius / 2, 3 + round (random 2), "MOVE", ["AWARE", "SAFE"] select (random 1 > 0.5), ["red", "white"] select (random 1 > 0.2), ["limited", "normal"] select (random 1 > 0.5)] call CBA_fnc_taskPatrol;
            [_g, _vehaaSkill] call LR_fnc_SetUnitSkill;
            if (random 1 >= 0.5) then { _v allowCrewInImmobile true; };

            _units append (units _g);
            _vehicles pushBack _v;
        };
    };
};

///////////////////////////////////////////////////////////
// MRAP
///////////////////////////////////////////////////////////

if !(_vehmrapList isEqualTo []) then {
    for "_x" from 1 to (_vehmrapMin + floor(random (_vehmrapRand+1))) do {

        _g = createGroup _side;
        _g setGroupIdGlobal [format ["%1_vehmrap%2", _grpPrefix, _x]];

        _rpos = [[[_center, _radius], []], ["water"], { !(_this isFlatEmpty [2,-1,0.5,1,0,false,objNull] isEqualTo []) }] call BIS_fnc_randomPos;

        if !(_rpos isEqualTo [0,0]) then {
            _v = (selectRandom _vehmrapList) createVehicle _rpos ;
            _v lock 3;

            [_v, _g] call BIS_fnc_spawnCrew;
            [_g, _center, _radius / 2, 3 + round (random 2), "MOVE", ["AWARE", "SAFE"] select (random 1 > 0.5), ["red", "white"] select (random 1 > 0.2), ["limited", "normal"] select (random 1 > 0.5)] call CBA_fnc_taskPatrol;
            [_g, _vehmrapSkill] call LR_fnc_SetUnitSkill;
            if (random 1 >= 0.5) then { _v allowCrewInImmobile true; };

            _units append (units _g);
            _vehicles pushBack _v;
        };
    };
};

///////////////////////////////////////////////////////////
// RANDOM VEHS
///////////////////////////////////////////////////////////

if (_vehRandList isEqualTo []) then {
	{_vehRandList append _x} foreach [_vehAAList, _vehMrapList, _vehLightList, _vehHeavyList];

    for "_x" from 1 to (_vehrandMin + floor(random (_vehrandRand+1))) do {

        _g = createGroup _side;
        _g setGroupIdGlobal [format ["%1_vehrand%2", _grpPrefix, _x]];

        _rpos = [[[_center, _radius], []], ["water"], { !(_this isFlatEmpty [2,-1,0.5,1,0,false,objNull] isEqualTo []) }] call BIS_fnc_randomPos;

        if !(_rpos isEqualTo [0,0]) then {
            _v = (selectRandom _vehRandList) createVehicle _rpos ;
            _v lock 3;

            [_v, _g] call BIS_fnc_spawnCrew;
            [_g, _center, _radius / 2, 3 + round (random 2), "MOVE", ["AWARE", "SAFE"] select (random 1 > 0.5), ["red", "white"] select (random 1 > 0.2), ["limited", "normal"] select (random 1 > 0.5)] call CBA_fnc_taskPatrol;
            [_g, _vehrandSkill] call LR_fnc_SetUnitSkill;
            if (random 1 >= 0.5) then { _v allowCrewInImmobile true; };

            _units append (units _g);
            _vehicles pushBack _v;
        };
    };
};

///////////////////////////////////////////////////////////
// LIGHT VEHS
///////////////////////////////////////////////////////////

if (_vehLightList isEqualTo []) then {
    for "_x" from 1 to (_vehLightMin + floor(random (_vehLightRand+1))) do {

        _g = createGroup _side;
        _g setGroupIdGlobal [format ["%1_vehLight%2", _grpPrefix, _x]];

        _rpos = [[[_center, _radius], []], ["water"], { !(_this isFlatEmpty [2,-1,0.5,1,0,false,objNull] isEqualTo []) }] call BIS_fnc_randomPos;

        if !(_rpos isEqualTo [0,0]) then {
            _v = (selectRandom _vehLightList) createVehicle _rpos ;
            _v lock 3;

            [_v, _g] call BIS_fnc_spawnCrew;
            [_g, _center, _radius / 2, 3 + round (random 2), "MOVE", ["AWARE", "SAFE"] select (random 1 > 0.5), ["red", "white"] select (random 1 > 0.2), ["limited", "normal"] select (random 1 > 0.5)] call CBA_fnc_taskPatrol;
            [_g, _vehLightSkill] call LR_fnc_SetUnitSkill;
            if (random 1 >= 0.5) then { _v allowCrewInImmobile true; };

            _units append (units _g);
            _vehicles pushBack _v;
        };
    };
};

///////////////////////////////////////////////////////////
// RANDOM VEHS
///////////////////////////////////////////////////////////

if (_vehHeavyList isEqualTo []) then {
    for "_x" from 1 to (_vehHeavyMin + floor(random (_vehHeavyRand+1))) do {

        _g = createGroup _side;
        _g setGroupIdGlobal [format ["%1_vehHeavy%2", _grpPrefix, _x]];

        _rpos = [[[_center, _radius], []], ["water"], { !(_this isFlatEmpty [2,-1,0.5,1,0,false,objNull] isEqualTo []) }] call BIS_fnc_randomPos;

        if !(_rpos isEqualTo [0,0]) then {
            _v = (selectRandom _vehHeavyList) createVehicle _rpos ;
            _v lock 3;

            [_v, _g] call BIS_fnc_spawnCrew;
            [_g, _center, _radius / 2, 3 + round (random 2), "MOVE", ["AWARE", "SAFE"] select (random 1 > 0.5), ["red", "white"] select (random 1 > 0.2), ["limited", "normal"] select (random 1 > 0.5)] call CBA_fnc_taskPatrol;
            [_g, _vehHeavySkill] call LR_fnc_SetUnitSkill;
            if (random 1 >= 0.5) then { _v allowCrewInImmobile true; };

            _units append (units _g);
            _vehicles pushBack _v;
        };
    };
};

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
