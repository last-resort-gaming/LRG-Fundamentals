params ["_seat"]; //0 - pilot, 1 - gunner

private _object = missionNamespace getVariable ["LRG_CC_currentScreenObject", objNull];
private _selection = missionNamespace getVariable ["LRG_CC_currentScreenSelection", -1];

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
private _renderTarget1 = format["screenrt%1a", _screen_id];
private _renderTarget2 = format["screenrt%1b", _screen_id];

private _renderTarget = [_renderTarget1, _renderTarget2] select _seat;

_object setObjectTextureGlobal [_selection, format ["#(argb,512,512,1)r2t(%1,1.3096153846)", _renderTarget]];

[_data, [[0, _renderTarget1], [1, _renderTarget2]]] spawn cTab_fnc_createUavCam;

closeDialog 1;