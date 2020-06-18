#include "..\ui\defines.inc"
// event handler

params ["_ctrlButtonDelete"];

private _display = ctrlParent _ctrlButtonDelete;
private _ctrlSavesList = _display displayCtrl IDC_SAVESLIST;
private _ctrlEditName = _display displayCtrl IDC_EDITNAME;

private _saveID = _ctrlSavesList lnbValue [lnbCurSelRow _ctrlSavesList,0];

private _saveMarkersData = profileNamespace getVariable ["LR_MI_saveData",[]];
_saveMarkersData deleteAt _saveID;
saveProfileNamespace;

[_display] call LR_MI_fnc_updateSavesList;
_ctrlSavesList lnbSetCurSelRow -1;
_ctrlEditName ctrlSetText "";
