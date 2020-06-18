#include "..\ui\defines.inc"
/*
Function: LR_MI_fnc_setButtonEnabled

Description:
    Enables or disables the supplied button.

Arguments:
    _idc - IDC of the button
	_enabled - True to enable, false to disable

Return Value:
    None

Example:
    Nothing to see here

Author:
	Gruppe Adler, modified by Mokka
*/

params ["_idc","_enabled"];

private _display = findDisplay IDD_SAVEMARKERS;
private _ctrlButton = _display displayCtrl _idc;

_ctrlButton ctrlEnable _enabled;
