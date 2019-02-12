/*
Function: YAINA_CMD_fnc_log

Description:
	General purpose function for logging command useage.
	In essence just a nice formatter.

Arguments:
	_caller - The player that called the command
	_command  - The command that was executed
	_permitted - If executing the command was permitted
	_str - Additional logging/tracing information or log message

Return Values:
	None

Examples:
    Nothing to see here

Author:
	Martin
*/

params ["_caller", "_command", "_permitted", "_str"];

if (isNil "_str") then { _str = ""; };

[
	format [
		"action=%1, command=%2, uid=%3, player=%4, msg=%5",
		["REJECT", "PERMIT"] select _permitted,
		_command,
		getplayerUID _caller,
		name _caller,
		_str
	], "CommandsLog"
] call YAINA_fnc_log;