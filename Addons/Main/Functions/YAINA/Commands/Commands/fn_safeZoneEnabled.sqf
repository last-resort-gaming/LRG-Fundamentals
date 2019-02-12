/*
Function: YAINA_CMD_fnc_safeZoneEnabled

Description:
	Enabled or disabled the safezone around base.

Arguments:
	_caller - The player that called this command
    _owner - The owner of the player object that called this command
    _argStr - True to enable the safezone, False to disable

Return Values:
	Compiled message for internal handling

Examples:
    Nothing to see here

Author:
	Mokka
*/

params ["_owner", "_caller", "_argStr"];

_enabled = (toLower _argStr) isEqualTo "true";

SafeZoneEnabled = _enabled;

private _msg = "";

if (_enabled) then {
	_msg = "SafeZone has been enabled";
} else {
	_msg = "SafeZone has been disabled";
};
_msg remoteExecCall ["systemChat", _owner];
_msg