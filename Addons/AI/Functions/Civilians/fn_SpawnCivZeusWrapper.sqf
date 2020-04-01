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

#define CIV_FACTIONS ["Default Civilians (Altis)", "@CFP - Civilians (Afghanistan)", "@CFP - Civilians (African Christian)", "@CFP - Civilians (African Islamic)", "@CFP - Civilians (Asian)", "@CUP - Civilians (Chernarus)", "@CUP - Civilians (Middle Eastern)", "@CUP - Civilians (Russian)", "@CUP - Civilians (Takistan)"]
#define CIV_FACTIONS_LOOKUP ["CIV_Default", "CFP_C_AFG", "CFP_C_AFRCHRISTIAN", "CFP_C_AFRISLAMIC", "CFP_C_ASIA", "CUP_C_C", "CUP_C_ME", "CUP_C_R", "CUP_C_TK"]

params [["_pos", [0, 0, 0]]];

if (_pos isEqualTo [0, 0, 0]) exitWith {
	["Couldn't process wrapper call", "ErrorLog"] call YAINA_F_fnc_log;
};

// Holds the array of factions that are available for selection, based on side
_prettyNames = CIV_FACTIONS;

// Is used to match the selected faction with the the internal name, by index
_lookup = CIV_FACTIONS_LOOKUP;

private _dialogResult = [
	"Spawn AI - Civilian",
	[
		["EDIT", "Objective Name", ["Objective Alpha"]],
		["COMBO", "Faction", [_lookup, _prettyNames, 0]],
		["COMBO", "Side", [[civilian/*, west, east, independent*/], ["Civilian"/*, "Blufor", "Opfor", "Independent"*/], 0]], // TODO: fix this someday
		["EDIT", "Garrison Radius", ["100"]],
		["EDIT", "Min. Garrisoned Units", ["0"]],
		["EDIT", "Max. Garrisoned Units", ["0"]],
		["EDIT", "Spawn Radius", ["500"]],
		["EDIT", "Min. Pedestrian Patrols", ["0"]],
		["EDIT", "Max. Pedestrian Patrols", ["0"]],
		["EDIT", "Min. Vehicle Patrols", ["0"]],
		["EDIT", "Max. Vehicle Patrols", ["0"]],
		["EDIT", "Min. Parked Vehicles", ["0"]],
		["EDIT", "Max. Parked Vehicles", ["0"]]
	],
	{
		params ["_results", "_args"];

		_args params ["_pos"];

		_procResults = [];

		{
			_value = _x;

			// Process number inputs and make sure they're integers
			if (_forEachIndex > 2) then {
				_value = round (parseNumber _x);
			};

			_procResults pushBack _value;
		} forEach _results;

		_procResults params [
			"_grpPrefix",
			"_faction",
			"_side",
			"_garrRadius",
			"_garrisonsMin", "_garrisonsMax",
			"_radius",
			"_pedMin", "_pedMax",
			"_vehPatrolsMin", "_vehPatrolsMax",
			"_vehParkedMin", "_vehParkedMax"
		];

		// Actually call SpawnCivilians, do it remotely so the server has the units and takes care of them c:
		[
			_pos,
			_grpPrefix,
			_faction,
			_side,
			_GarrRadius,
			[_garrisonsMin, _garrisonsMax],
			_radius,
			[_pedMin, _pedMax],
			[_vehPatrolsMin, _vehPatrolsMax],
			[_vehParkedMin, _vehParkedMax]
		] remoteExec ["LR_fnc_SpawnCivilians", 2];
	},
	{},
	[_pos]
] call zen_dialog_fnc_create;

if !(_dialogResult) exitWith {
	["Failed to create zen dialog!", "ErrorLog"] call YAINA_F_fnc_log;
};