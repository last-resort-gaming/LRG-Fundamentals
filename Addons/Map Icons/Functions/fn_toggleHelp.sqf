#include "..\ui\defines.inc"
/*
Function: LR_MI_fnc_toggleHelp

Description:
    Toggles the help box in the save/load display

Arguments:
    None

Return Value:
    None

Example:
    Nothing to see here

Author:
	Gruppe Adler, modified by Mokka
*/

LR_MI_helpEnabled = !(missionNamespace getVariable ["LR_MI_helpEnabled",false]);

private _display = findDisplay IDD_SAVEMARKERS;
private _ctrlHelp = _display displayCtrl IDC_HELP;

private _ctrlHelpPos = ctrlPosition _ctrlHelp;
_ctrlHelpPos set [3,[1 * Y_FACTOR,22.2 * Y_FACTOR] select LR_MI_helpEnabled];
_ctrlHelp ctrlSetPosition _ctrlHelpPos;
_ctrlHelp ctrlCommit 0.5;
