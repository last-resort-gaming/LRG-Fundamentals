/*
Function: YAINA_CMD_fnc_exec

Description:
	Execute the given command with (optional) supplied arguments.
	Runs some checks on whether command execution is actually allowed.

Parameters:
	_command - The command we want to have executed
	_argument - Arguments for the command

Return Values:
	None

Examples:
    Nothing to see here

Author:
	Martin
*/

params ["_command", "_argument"];

if !(isServer) exitWith {};
if (remoteExecutedOwner isEqualTo 0) exitWith {};

private _tmp = (allPlayers select { owner _x isEqualTo remoteExecutedOwner } );
if (_tmp isEqualTo []) exitWith {};

private _caller = _tmp select 0;

// Find the commands for the given user
private _idx = YAINA_commands select 0 find remoteExecutedOwner;
if (_idx isEqualTo -1) exitWith {
    [_caller, _command, false, "PLAYER NOT IN COMMANDS LIST"] call YAINA_CMD_fnc_log;
};

// Ensure the command exists
private _cmd = missionNamespace getVariable format["YAINA_CMD_fnc_%1", _command];
if (isNil "_cmd") exitWith {
    [_caller, _command, false, "UNDEFINED"] call YAINA_CMD_fnc_log;
};

private _cmds = +((YAINA_commands select 1) select _idx);

{
	_cmds set [_forEachIndex, toLower _x];
} forEach _cmds;

// Command allowed ?
if !((toLower _command) in _cmds || { 'ALL' in _cmds  }) exitWith {
    [_caller, _command, false, "NOT PERMITTED"] call YAINA_CMD_fnc_log;
};


// Remove duplicate spaces. and execute the command, returning the log line
_argument = _argument splitString " " joinString " ";
private _msg = [remoteExecutedOwner, _caller, _argument] call _cmd;
[_caller, _command, true, _msg] call YAINA_CMD_fnc_log;