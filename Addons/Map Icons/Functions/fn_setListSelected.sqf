#include "..\ui\defines.inc"
/*
Function: LR_MI_fnc_setListSelected

Description:
    Select the element at the supplied selID.

Arguments:
    _display - Display for which to select the list entry
    _selID - ID of the entry to select

Return Value:
    None

Example:
    Nothing to see here

Author:
	Gruppe Adler, modified by Mokka
*/


params ["_display",["_selID",-1]];

if (isNil "_display") then {
    _display = findDisplay IDD_SAVEMARKERS;
};

private _ctrlSavesList = _display displayCtrl IDC_SAVESLIST;
if (isNil "_ctrlSavesList" || {isNull _ctrlSavesList}) exitWith {};

_ctrlSavesList lnbSetCurSelRow _selID;
