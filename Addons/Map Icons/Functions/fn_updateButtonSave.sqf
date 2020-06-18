#include "..\ui\defines.inc"
// event handler

params ["_display"];

if (isNil "_display") then {
    _display = findDisplay IDD_SAVEMARKERS;
};

private _editText = ctrlText (_display displayCtrl IDC_EDITNAME);
private _enabled = (count _editText > 0) && {count LR_MI_selectedMarkers > 0};

[IDC_BUTTONSAVE,_enabled] call LR_MI_fnc_setButtonEnabled;
