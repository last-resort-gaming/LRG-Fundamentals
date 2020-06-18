#include "..\ui\defines.inc"
/*
Function: LR_MI_fnc_findSaveInList

Description:
    Attempts to find a certain save by name and world in the tree of all saves.

Arguments:
    _editText - The name of the save
    _worldName - The world for which to load the saves for

Return Value:
    Selection ID of the save in the tree, -1 if not found

Example:
    Nothing to see here

Author:
	Gruppe Adler, modified by Mokka
*/

params ["_editText","_worldName"];

private _display = findDisplay IDD_SAVEMARKERS;
private _ctrlSavesList  = _display displayCtrl IDC_SAVESLIST;

private _return = -1;

for "_i" from 0 to ((lnbSize _ctrlSavesList) select 0)-1 do {
    if ((_ctrlSavesList lnbText [_i,0]) == _editText && {(_ctrlSavesList lnbText [_i,1]) == _worldName}) exitWith {
        _return = _i
    };
};

_return
