/*
Function: YAINA_CMD_fnc_logfps

Description:
	Log the player's current FPS to the server log.

Arguments:
	_owner - The owner of the player object that called this command
    _caller - Not used
    _argStr - Not used

Return Values:
	Compiled message for internal handling

Examples:
    Nothing to see here

Author:
	Martin
*/

params ["_owner", "_caller", "_argStr"];


{
    [[], {
        format["fps: %1: %2", profileName, diag_fps] remoteExec ["diag_log", 2];
    }] remoteExec ["call", _x];
    nil;
} count allPlayers;

_msg = "you will find players FPS on the server's rpt file";
_msg remoteExecCall ["systemChat", _owner];

_msg