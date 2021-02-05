// called by the radio addAction
disableSerialization;

params ["_object", "_player", "_radio"];

if !(createDialog "RadioConfigDialog") exitWith {systemChat "Couldn't create dialog!"};

// set up uiNamespace
uiNamespace setVariable ["LRG_CC_currentRadioObject", _radio];

// get all the elements that we care about
private _dialog = findDisplay 21821;

private _buttonOK = _dialog displayCtrl 1100;
private _buttonCancel = _dialog displayCtrl 1101;

// fill in the current settings
private _radio_settings = _radio call TFAR_fnc_getLrSettings;

private _ch1_cur = (_radio_settings select 2) select 0;
private _ch2_cur = (_radio_settings select 2) select 1;
private _vol_cur = _radio_settings select 1;

ctrlSetText [1400, _ch1_cur];
ctrlSetText [1401, _ch2_cur];
ctrlSetText [1402, str (_vol_cur + 1)];

// set up event handlers
_buttonOK ctrlSetEventHandler ["ButtonClick", format["[] call LR_fnc_handleRadioConfig"]];
_buttonCancel ctrlSetEventHandler ["ButtonClick", "closeDialog 2;"];