/*
Function: YAINA_CMD_fnc_postInitServer

Description:
	Handled server-side initialization of the commands system.
    This setup is mainly concerned with initializing the necessary
    variables and adding the required event handlers.

Parameters:
	None

Return Values:
	None

Examples:
    Nothing to see here

Author:
	Martin
*/

if (not isServer) exitWith {};

// Mapping of commands to individual owners
YAINA_commands = [[], []];
YAINA_allCommands = [
    "logfps",
    "safeZoneArea",
    "safeZoneEnabled",
    "safeZonePosition",
    "sideChatDuration",
    "TFAR_distanceMultiplier",
    "TFAR_interceptionCoefficient"
];

// We dump the commands into the ownerIDs when folks log so to refersh their
// Commands list they just need to re-log
addMissionEventHandler["PlayerConnected", {

    params ["_id", "_uid", "_name", "_jip", "_owner"];

    _hasAccess = (_uid in [
        "_SP_PLAYER_",          // Player in SinglePlayer, for testing locally
        "76561198192369291",    // MitchJC
        "76561197966788811",    // Mimmi
        "76561198120665981"     // Mokka, only for dev
    ]) || (player getUnitTrait "Mission Maker");

    private _cmds = [];

    if (_hasAccess) then {
        _cmds = +YAINA_allCommands;
    };

    // We always add 'help'
    { _cmds pushBackUnique _x, nil; } count ['help'];

    _idx  = (YAINA_commands select 0) find _owner;
    if (_idx isEqualTo -1) then {
        (YAINA_commands select 0) pushBack _owner;
        (YAINA_commands select 1) pushBack _cmds;
    } else {
        (YAINA_commands select 1) set [_idx, _cmds];
    };

}];

addMissionEventHandler["PlayerDisconnected", {

    params ["_id", "_uid", "_name", "_jip", "_owner"];

    _idx  = (YAINA_commands select 0) find _owner;
    if (_idx isEqualTo -1) then {
        (YAINA_commands select 0) deleteAt _idx;
        (YAINA_commands select 1) deleteAt _idx;
    };

}];
