/*
Function: LR_fnc_SpawnCivZeusWrapper

Description:
	Wraps calls to LR_fnc_SpawnCivilians for use with the Zeus Modules.

Arguments:
	_pos - Position of the module <ARRAY/POS3D>

Return Values:
	None

Examples:
    Nothing to see here

Author:
	Mokka
*/

#define CIV_FACTIONS ["Default Civilians (Altis)"]
#define CIV_FACTIONS_LOOKUP ["CIV_Default"]

params [["_pos", [0, 0, 0]]];

if (_pos isEqualTo [0, 0, 0]) exitWith {
	["Couldn't process wrapper call", "ErrorLog"] call YAINA_fnc_log;
};

// Holds the array of factions that are available for selection, based on side
_availableFactions = CIV_FACTIONS;

// Is used to match the selected faction with the the internal name, by index
_lookup = CIV_FACTIONS_LOOKUP;

private _dialogResult = [
	"Spawn AI - Civilian",
	[
		["Objective Name", "", "Objective Alpha"],
		["Faction", _availableFactions],
		["Side", ["Civilian"/*, "Blufor", "Opfor", "Independent"*/], "Civilian"], // TODO: fix this someday
		["Spawn Radius", "", "500"],
		["Min. Garrisoned Units", "", "0"],
		["Max. Garrisoned Units", "", "0"],
		["Min. Pedestrian Patrols", "", "0"],
		["Max. Pedestrian Patrols", "", "0"],
		["Min. Vehicle Patrols", "", "0"],
		["Max. Vehicle Patrols", "", "0"],
		["Min. Parked Vehicles", "", "0"],
		["Max. Parked Vehicles", "", "0"]
	]
] call Ares_fnc_showChooseDialog;

if (_dialogResult isEqualTo []) exitWith {
	["fn_ShowChooseDialog didn't return good results", "ErrorLog"] call YAINA_fnc_log;
};

_procDiagResults = [];

{
	_value = _x;

	// Look up the proper faction name in the lookup table
	if (_forEachIndex == 1) then {
		_value = _lookup select _x;
	};

	// Look up side
	if (_forEachIndex == 2) then {
		_value = [civilian, west, east, independent] select _x;
	};

	// Process number inputs and make sure they're integers
	if (_forEachIndex > 2) then {
		_value = round (parseNumber _x);
	};

	_procDiagResults pushBack _value;
} forEach _dialogResult;

_procDiagResults params [
	"_grpPrefix", "_faction", "_side", "_radius",
	"_garrisonsMin", "_garrisonsMax",
	"_pedMin", "_pedMax",
	"_vehPatrolsMin", "_vehPatrolsMax",
	"_vehParkedMin", "_vehParkedMax"
];

// Actually call SpawnCivilians, do it remotely so the server has the units and takes care of them c:
[
	_grpPrefix, _pos, _radius, _faction, _side,
	[_garrisonsMin, _garrisonsMax],
	[_pedMin, _pedMin],
	[_vehPatrolsMin, _vehPatrolsMax],
	[_vehParkedMin, _vehParkedMax]
] remoteExec ["LR_fnc_SpawnCivilians", 2];