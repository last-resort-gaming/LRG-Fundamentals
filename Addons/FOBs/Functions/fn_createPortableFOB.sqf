/*
Function: LR_fnc_createPortableFOB

Description:
	Turns the given object into a portable FOB of the selected type.

Arguments:
	_object - Object to turn into a portable FOB
	_type - Type of the FOB to create

Return Values:
	Nothing.

Examples:
    Nothing to see here

Author:
	Mokka
*/


#include "compositions.inc"

if (!isServer) exitWith {};
params [
	["_object", objNull, [objNull]],
	["_type", "ANY"]
];

private _size = -1;
private _name = "";

switch (_type) do {
	case "ANY": {
		_size = floor (random 4);
		_type = selectRandom ([LR_FOBS_CAMPS, LR_FOBS_SMALL, LR_FOBS_MEDIUM, LR_FOBS_LARGE] select _size);
		_name = _type select 1;
		_type = _type select 0;
	};
	case "ANY_CAMP": {
		_size = 0;
		_type = selectRandom LR_FOBS_CAMPS;
		_name = _type select 1;
		_type = _type select 0;
	};
	case "ANY_SMALL": {
		_size = 1;
		_type = selectRandom LR_FOBS_SMALL;
		_name = _type select 1;
		_type = _type select 0;
	};
	case "ANY_MEDIUM": {
		_size = 2;
		_type = selectRandom LR_FOBS_MEDIUM;
		_name = _type select 1;
		_type = _type select 0;
	};
	case "ANY_LARGE": {
		_size = 3;
		_type = selectRandom LR_FOBS_LARGE;
		_name = _type select 1;
		_type = _type select 0;
	};
	default {
		_size = _type call {
			if (isNil {_name = [_this, LR_FOBS_CAMPS] call LR_fnc_findInArrayMap;}) exitWith {0};
			if (isNil {_name = [_this, LR_FOBS_SMALL] call LR_fnc_findInArrayMap;}) exitWith {1};
			if (isNil {_name = [_this, LR_FOBS_MEDIUM] call LR_fnc_findInArrayMap;}) exitWith {2};
			if (isNil {_name = [_this, LR_FOBS_LARGE] call LR_fnc_findInArrayMap;}) exitWith {3};
			-1
		};
	};
};

if (_size < 0) exitWith {
	systemChat format ["Invalid FOB type: %1", _type];
};

// addHoldAction stuff
_object setVariable ["LR_PortableFOB_Type", _type, true];
_object setVariable ["LR_PortableFOB_Size", _size, true];
_object setVariable ["LR_PortableFOB_Deployed", false, true];
_object setVariable ["LR_PortableFOB_Pos", [0, 0, 0], true];

[
	_object,
	format ["DeployFOB_%1", _object],
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
	format ["PackUpFOB_%1", _object],
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