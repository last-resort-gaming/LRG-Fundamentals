/*
Function: LR_MI_fnc_openDialog

Description:
    Wrapper for the display loading, potentially to filter out who can use the command.
    Currently just passes the call on.

Arguments:
    None

Return Value:
    None

Example:
    Nothing to see here

Author:
	Gruppe Adler, modified by Mokka
*/

/*
private _canOpen = switch (true) do {
    case (IS_ADMIN): {true};
    case (GVAR(setting_canBeOpened) == 2): {true};
    case (GVAR(setting_canBeOpened) == 1 && {(missionNamespace getVariable ["CBA_missionTime",0]) < 600}): {true};
    default {false};
};

if (!_canOpen) exitWith {
    playSound "3DEN_notificationWarning";
    systemChat "GRAD saveMarkers is currently disabled by the mission. Log in as admin to use.";
};
*/

[] call LR_MI_fnc_loadDisplay;
