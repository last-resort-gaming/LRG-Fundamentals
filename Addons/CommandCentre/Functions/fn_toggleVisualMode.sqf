params ["_object", "_selection"];

private _screen_id = _object getVariable [format ["LRG_CC_screen_%1_ID", _selection], -1];
private _renderTarget = format["screenrt%1", _screen_id];

private _screenMode = _object getVariable [format ["LRG_CC_screen_%1_mode", _selection], ""];

private _currentVM = _object getVariable [format ["LRG_CC_screen_%1_visionMode", _selection], 0];
private _nextVM = _currentVM + 1;

if (_nextVM > 1) then {
	if (_screenMode isEqualTo "DCAM") then {
		if (_nextVM > 2) then {
			_nextVM = 0;
		};
	} else {
		_nextVM = 0;
	};
};

[_renderTarget, [_nextVM]] remoteExec ["setPiPEffect", 0];
_object setVariable [format ["LRG_CC_screen_%1_visionMode", _selection], _nextVM, true];