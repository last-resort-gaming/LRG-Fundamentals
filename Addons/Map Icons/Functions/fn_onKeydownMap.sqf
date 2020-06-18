// event handler

params ["_display","_key","","_ctrl","_alt"];

// user is currently typing in editName box
if (_display getVariable ["LR_MI_editNameFocused",false]) exitWith {};

// H key
if (_key == 35) exitWith {
    [] call LR_MI_fnc_toggleHelp;
};

// Ctrl+A key
if (_ctrl && {_key == 30}) exitWith {
    LR_MI_selectedMarkers = [_alt] call LR_MI_fnc_allMarkers;
    [] call LR_MI_fnc_updateButtonSave;
};

// close with map key
if (_key in actionKeys "hideMap") exitWith {
    _display closeDisplay 2;
};
