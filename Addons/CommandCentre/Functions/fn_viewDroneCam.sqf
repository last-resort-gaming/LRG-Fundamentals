params ["_seat"]; //0 - pilot, 1 - gunner

private _object = LRG_CC_currentScreenObject;
private _selection = LRG_CC_currentScreenSelection;

if ((_object isEqualTo objNull)) exitWith {systemChat "Couldn't init Drone Cam: object."};
if ((_selection < 0)) exitWith {systemChat "Couldn't init Drone Cam: selection."};

private _idx = lbCurSel 2101;
private _name = lbText [2101, _idx];
private _data = lbData [2101, _idx];

// set the mode
_object setVariable [format ["LRG_CC_screen_%1_mode", _selection], "DCAM", true];
_object setVariable [format ["LRG_CC_screen_%1_target", _selection], _name, true];

// obtain render target
private _screen_id = _object getVariable [format ["LRG_CC_screen_%1_ID", _selection], -1];
private _renderTarget = format["screenrt%1", _screen_id];

private _screen_JIP_ID = format ["LRG_CC_screen%1_JIP", _object getVariable [format ["LRG_CC_screen_%1_ID", _selection], -1]];

[_object, _selection, _rendertarget, _data, _seat] remoteExec ["LR_fnc_viewDCamGlobal", 0, _screen_JIP_ID];

LRG_CC_currentScreenObject = nil;
LRG_CC_currentScreenSelection = nil;

_object setVariable [format ["LRG_CC_screen_%1_on", _selection], true, true];

closeDialog 1;