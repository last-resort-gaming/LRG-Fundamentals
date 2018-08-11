/*
Function: YAINA_CMD_fnc_TFAR_distanceMultiplier

Description:
	Sets the sending distance multiplier for TFAR.

Parameters:
	_caller - The player that called this command
    _owner - The owner of the player object that called this command
    _argStr - The distance multiplier

Return Values:
	Compiled message for internal handling

Examples:
    Nothing to see here

Author:
	Mokka
*/

params ["_owner", "_caller", "_argStr"];

_multiplier = parseNumber _argStr;

_caller setVariable ["tf_sendingDistanceMultiplicator", _multiplier, true];

_msg = format ["TFAR Sending Distance Multiplier has been set to %1", _multiplier];
_msg remoteExecCall ["systemChat", _owner];
_msg