/*
Function: YAINA_CMD_fnc_sideChatDuration

Description:
	Sets the duration for how long the sidechat is active.

Arguments:
	_caller - The player that called this command
    _owner - The owner of the player object that called this command
    _argStr - The duration for how long the sidechat is active

Return Values:
	Compiled message for internal handling

Examples:
    Nothing to see here

Author:
	Mokka
*/

params ["_owner", "_caller", "_argStr"];

_duration = parseNumber _argStr;

if (_duration < 0 || _duration > 120) then {_duration = 0};

SideChatDuration = _duration;

_msg = format ["Duration of SideChat has been set to %1", _duration];
_msg remoteExecCall ["systemChat", _owner];
_msg