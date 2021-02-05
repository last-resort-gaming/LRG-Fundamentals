disableSerialization;

params ["_object", "_selection", "_args"];
_args params ["_allowCam", "_allowDrone", "_allowSat", "_allowMap"];

LRG_CC_currentScreenObject = _object;
LRG_CC_currentScreenSelection = _selection;

if !(createDialog "ScreenConfigDialog") exitWith {systemChat "Couldn't create dialog!"};

private _display = findDisplay 21822;

// set up button event handlers
(_display displayCtrl 2400) ctrlSetEventHandler ["ButtonClick", "[] call LR_fnc_viewHelmetCam"];
(_display displayCtrl 2401) ctrlSetEventHandler ["ButtonClick", "[0] call LR_fnc_viewDroneCam"];
(_display displayCtrl 2402) ctrlSetEventHandler ["ButtonClick", "[] call LR_fnc_viewSatImage"];
(_display displayCtrl 2403) ctrlSetEventHandler ["ButtonClick", "[1] call LR_fnc_viewDroneCam"];
(_display displayCtrl 1101) ctrlSetEventHandler ["ButtonClick", "closeDialog 2;"];

// set up allowed actions
// hcams
ctrlEnable [2400, _allowCam];
ctrlEnable [2100, _allowCam];

//dcams
ctrlEnable [2401, _allowDrone];
ctrlEnable [2402, _allowDrone];
ctrlEnable [2101, _allowDrone];

// sat
ctrlEnable [2403, _allowSat];
ctrlEnable [2102, _allowSat];

// set title
private _screenMode = _object getVariable [format ["LRG_CC_screen_%1_mode", _selection], ""];
private _screenTarget = _object getVariable [format ["LRG_CC_screen_%1_target", _selection], ""];
private "_modeName";

if ((!(_screenMode isEqualTo "")) && (!(_screenTarget isEqualTo ""))) then {
	switch (_screenMode) do {
		case "HCAM": { _modeName = "Viewing Helmet Cam"; };
		case "DCAM": { _modeName = "Viewing Drone Cam"; };
		case "SAT": { _modeName = "Viewing Satellite Footage"; };
		default { _modeName = "Error, invalid mode!"; };
	};

	ctrlSetText [1000, format["Configure Screen - %1: %2", _modeName, _screenTarget]];
};

// populate the list boxes
// helmet cams
call cTab_fnc_updateLists;

_hCamList = _display displayCtrl 2100;

lbClear _hCamList;
_hCamList lbSetCurSel -1;
{
	private _name = "";
	private _section = _x getVariable "LRG_Section";

	if (isNil "_section") then {
		_name = format ["%1:%2 (%3)", groupId group _x,[_x] call CBA_fnc_getGroupIndex,name _x];
	} else {
		_name = format ["%1:%2 (%3)", _section, [_x] call CBA_fnc_getGroupIndex, name _x];
	};

	_index = _hCamList lbAdd _name;
	_hCamList lbSetData [_index, str _x];
} forEach cTabHcamlist;

{
	private _name = format ["Vehicle: %1", getText (configfile >> "cfgVehicles" >> typeOf _x >> "displayname")];

	_index = _hCamList lbAdd _name;
	_hCamList lbSetData [_index, str _x];
} forEach LRG_CC_vehicleCamList;

lbSort [_hCamList, "ASC"];
_hCamList lbSetCurSel 0;

// drone cams
_dCamList = _display displayCtrl 2101;

lbClear _dCamList;
_dCamList lbSetCurSel -1;
{
	_index = _dCamList lbAdd format ["%1:%2 (%3)", groupId group _x,[_x] call CBA_fnc_getGroupIndex,getText (configfile >> "cfgVehicles" >> typeOf _x >> "displayname")];
	_dCamList lbSetData [_index, str _x];
} forEach cTabUAVList;
lbSort [_dCamList, "ASC"];
_dCamList lbSetCurSel 0;

// sat view
_satList = _display displayCtrl 2102;

lbClear _satList;
_satList lbSetCurSel -1;
{
	private _name = "";
	private _section = _x getVariable "LRG_Section";

	if (isNil "_section") then {
		_name = format ["%1:%2 (%3)", groupId group _x,[_x] call CBA_fnc_getGroupIndex,name _x];
	} else {
		_name = format ["%1:%2 (%3)", _section, [_x] call CBA_fnc_getGroupIndex, name _x];
	};

	_index = _satList lbAdd _name;
	_satList lbSetData [_index, str _x];
} forEach cTabHcamlist;

{
	private _name = format ["Vehicle: %1", getText (configfile >> "cfgVehicles" >> typeOf _x >> "displayname")];

	_index = _satList lbAdd _name;
	_satList lbSetData [_index, str _x];
} forEach LRG_CC_vehicleCamList;

lbSort [_satList, "ASC"];
_satList lbSetCurSel 0;