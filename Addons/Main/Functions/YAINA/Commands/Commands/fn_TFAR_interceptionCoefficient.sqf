/*
Function: YAINA_CMD_fnc_TFAR_interceptionCoefficient

Description:
	Sets the terrain interception coefficient for TFAR.

Arguments:
	_caller - The player that called this command
    _owner - The owner of the player object that called this command
    _argStr - The terrain interception coefficient

Return Values:
	Compiled message for internal handling

Examples:
    Nothing to see here

Author:
	Mokka
*/

params ["_owner", "_caller", "_argStr"];

_coefficient = parseNumber _argStr;

_caller setVariable ["TF_terrain_interception_coefficient", _coefficient, true];

_msg = format ["TFAR Terrain Interception Coefficient Multiplier has been set to %1", _coefficient];
_msg remoteExecCall ["systemChat", _owner];
_msg