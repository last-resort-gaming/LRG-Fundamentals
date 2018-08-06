/*
Function: YAINA_CMD_fnc_help

Description:
	Displays the list of currently available commands for the caller.

Parameters:
	_caller - The player that called this command
    _owner - The owner of the player object that called this command
    _argStr - Not used

Return Values:
	Compiled message for internal handling

Examples:
    Nothing to see here

Author:
	Martin
*/

params ["_owner", "_caller", "_argStr"];

// Simply just lists available commands on their system
private _avail = [];

// Grab list of their commands
_idx = (YAINA_commands select 0) find _owner;
if (_idx isEqualTo -1) exitWith {
    diag_log format['FAILED TO FIND COMMANDS FOR %1', name _caller];
};

_avail = ((YAINA_commands select 1) select _idx) + [];

// Some of the commands, aren't really real (such as admin-nofifications and ALL)
// so we remove those from the list
private _n = (count _avail) - 1;
for "_i" from _n to 0 step -1 do {
    private _tst = _avail select _i;
    private _cmd = missionNamespace getVariable format["YAINA_CMD_fnc_%1", _tst];
    if (isNil "_cmd") then {
        _avail deleteAt _i;
    };
};

// Sort the list and output it
_avail sort true;

_msg = format["Available Commands: %1", _avail joinString ", "];

_msg remoteExec ["systemChat", _caller];

_msg