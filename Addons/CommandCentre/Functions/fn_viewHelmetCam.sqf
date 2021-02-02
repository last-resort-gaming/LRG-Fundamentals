private _object = missionNamespace getVariable ["LRG_CC_currentScreenObject", objNull];
private _selection = missionNamespace getVariable ["LRG_CC_currentScreenSelection", -1];

if ((_object isEqualTo objNull)) exitWith {systemChat "Couldn't init Helmet Cam: object."};
if ((_selection < 0)) exitWith {systemChat "Couldn't init Helmet Cam: selection."};

private _idx = lbCurSel 2100;
private _name = lbText [2100, _idx];
private _data = lbData [2100, _idx];

// set the mode
_object setVariable [format ["LRG_CC_screen_%1_mode", _selection], "HCAM", true];
_object setVariable [format ["LRG_CC_screen_%1_target", _selection], _name, true];

// obtain render target
private _screen_id = _object getVariable [format ["LRG_CC_screen_%1_ID", _selection], -1];
private _renderTarget = format["screenrt%1", _screen_id];

_object setObjectTextureGlobal [_selection, format ["#(argb,512,512,1)r2t(%1,1.3096153846)", _renderTarget]];

[_renderTarget,_data] spawn cTab_fnc_createHelmetCam;

closeDialog 1;