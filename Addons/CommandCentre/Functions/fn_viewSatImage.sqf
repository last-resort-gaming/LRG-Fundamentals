if (not hasInterface) exitWith {};

private _object = LRG_CC_currentScreenObject;
private _selection = LRG_CC_currentScreenSelection;

if ((_object isEqualTo objNull)) exitWith {systemChat "Couldn't init Sat View: object."};
if ((_selection < 0)) exitWith {systemChat "Couldn't init Sat View: selection."};

private _idx = lbCurSel 2102;
private _name = lbText [2102, _idx];
private _data = lbData [2102, _idx];

// set the mode
_object setVariable [format ["LRG_CC_screen_%1_mode", _selection], "SAT", true];
_object setVariable [format ["LRG_CC_screen_%1_target", _selection], _name, true];

// obtain render target
private _screen_id = _object getVariable [format ["LRG_CC_screen_%1_ID", _selection], -1];
private _renderTarget = format["screenrt%1", _screen_id];

private _screen_JIP_ID = format ["LRG_CC_screen%1_JIP", _object getVariable [format ["LRG_CC_screen_%1_ID", _selection], -1]];

//rExec the actual cam creation
[_object, _selection, _renderTarget, _data] remoteExec ["LR_fnc_viewSatGlobal", 0, _screen_JIP_id];

LRG_CC_currentScreenObject = nil;
LRG_CC_currentScreenSelection = nil;

_object setVariable [format ["LRG_CC_screen_%1_on", _selection], true, true];
_object setVariable [format ["LRG_CC_screen_%1_visionMode", _selection], 0, true];

closeDialog 1;