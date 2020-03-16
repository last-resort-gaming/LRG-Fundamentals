#include "compositions.inc"
/*
Function: LR_fnc_createPortableFOB

Description:
	Turns the given object into a portable FOB of the selected type.

Arguments:
	_object - Object to turn into a portable FOB
	_type - Type of the FOB to create
	_size - The size of the FOB

Return Values:
	Nothing.

Examples:
    Nothing to see here

Author:
	Mokka
*/

if (!isServer) exitWith {};

params [
	"_object",
	"_type",
	"_size"
];

if !((_object getVariable ["LR_PortableFOB_Type", "FOB_null"]) isEqualTo "FOB_null") exitWith {
	systemChat format "You can only add one portable FOB to an object!";
};

private _name = "";

switch (_type) do {
	case "ANY_CAMP": {
		_type = selectRandom _LR_FOBS_CAMPS;
		_name = _type select 1;
		_type = _type select 0;
	};
	case "ANY_SMALL": {
		_type = selectRandom _LR_FOBS_SMALL;
		_name = _type select 1;
		_type = _type select 0;
	};
	case "ANY_MEDIUM": {
		_type = selectRandom _LR_FOBS_MEDIUM;
		_name = _type select 1;
		_type = _type select 0;
	};
	case "ANY_LARGE": {
		_type = selectRandom _LR_FOBS_LARGE;
		_name = _type select 1;
		_type = _type select 0;
	};
	default {
		switch (_size) do {
			case 0: {
				_name = [_LR_FOBS_CAMPS, _type, "Camp"] call LR_fnc_findInArrayMap;
			};
			case 1: {
				_name = [_LR_FOBS_SMALL, _type, "Small FOB"] call LR_fnc_findInArrayMap;
			};
			case 2: {
				_name = [_LR_FOBS_MEDIUM, _type, "Medium FOB"] call LR_fnc_findInArrayMap;
			};
			case 3: {
				_name = [_LR_FOBS_LARGE, _type, "Large FOB"] call LR_fnc_findInArrayMap;
			};
			default {};
		};
	};
};

// addHoldAction stuff
_object setVariable ["LR_PortableFOB_Type", _type, true];
_object setVariable ["LR_PortableFOB_Size", _size, true];
_object setVariable ["LR_PortableFOB_Deployed", false, true];
_object setVariable ["LR_PortableFOB_Pos", [0, 0, 0], true];

[
	_object,
	format ["DeployFOB_%1_%2", _type, _object],
	format ["Deploy %1", _name],
	"",
	"[_target] call LR_fnc_checkFOBDeploy",
	"true",
	{hint "Deploying FOB!";},
	{},
	{hint "FOB deployed!"; [(_this select 0)] call LR_fnc_deployFOB;},
	{hint "Couldn't deploy FOB!";},
	[],
	5,
	false,
	"Deploying FOB...",
	true
] call LR_fnc_AddHoldAction;

[
	_object,
	format ["PackUpFOB_%1_%2", _type, _object],
	format ["Pack Up %1", _name],
	"",
	"[_target] call LR_fnc_checkFOBPackUp",
	"true",
	{hint "Packing up FOB!";},
	{},
	{hint "FOB packed up!"; [(_this select 0)] call LR_fnc_packUpFOB;},
	{hint "Couldn't pack up FOB!";},
	[],
	5,
	false,
	"Packing up FOB...",
	true
] call LR_fnc_AddHoldAction;