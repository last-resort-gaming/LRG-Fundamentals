#include "..\ui\defines.inc"
// event handler

params ["_ctrlButtonSave"];

if (count LR_MI_selectedMarkers == 0) exitWith {};

private _display = ctrlParent _ctrlButtonSave;
private _ctrlEdit = _display displayCtrl IDC_EDITNAME;

private _saveAs = ctrlText _ctrlEdit;

[_saveAs,worldName,LR_MI_selectedMarkers] call LR_MI_fnc_saveMarkers;
[_display] call LR_MI_fnc_updateSavesList;
[_display,-1] call LR_MI_fnc_setListSelected;
