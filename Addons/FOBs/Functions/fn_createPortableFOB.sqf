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
#define CAMP_FOBS ["Camp_1", "Camp_2", "Camp_3", "Camp_CamoNet_1", "Camp_CamoNet_2", "Camp_CamoNet_3", "Camp_CamoNet_4"]
#define SMALL_FOBS ["Small_AA_Pos", "Small_AT_Pos", "Small_Bunker_1", "Small_Bunker_2", "Small_Bunker_3", "Small_Bunker_4", "Small_Bunker_5", "Small_Bunker_Net_1", "Small_Bunker_Net_2", "Small_Bunker_Net_3", "Small_Bunker_Urban_1", "Small_Bunker_Wire_1", "Small_Bunker_Wire_2", "Small_Bunker_Wire_3", "Small_LZ_1", "Small_LZ_2", "Small_LZ_3", "Small_RoadCheckpoint", "Small_Tank_Pos"]
#define MEDIUM_FOBS ["Bunker_Test"]
#define LARGE_FOBS ["Bunker_Test"]


if (!isServer) exitWith {};
params [
	["_object", objNull, [objNull]],
	["_type", "ANY"]
];

private _size = -1;

switch (_type) do {
	case "ANY": {
		_size = floor (random 4);
		_type = selectRandom ([CAMP_FOBS, SMALL_FOBS, MEDIUM_FOBS, LARGE_FOBS] select _size);
	};
	case "ANY_CAMP": {
		_size = 0;
		_type = selectRandom SMALL_FOBS;
	};
	case "ANY_SMALL": {
		_size = 1;
		_type = selectRandom SMALL_FOBS;
	};
	case "ANY_MEDIUM": {
		_size = 2;
		_type = selectRandom MEDIUM_FOBS;
	};
	case "ANY_LARGE": {
		_size = 3;
		_type = selectRandom LARGE_FOBS;
	};
	default {
		_size = _type call {
			if (_this in CAMP_FOBS) exitWith {0};
			if (_this in SMALL_FOBS) exitWith {1};
			if (_this in MEDIUM_FOBS) exitWith {2};
			if (_this in LARGE_FOBS) exitWith {3};
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
	"Deploy FOB",
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
	"Pack Up FOB",
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