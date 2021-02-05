params ["_object", "_selection", "_turnOn", "_args"];

if (_turnOn) then {
	[_object, _selection, _args] call LR_fnc_configureScreen;
} else {
	_object setVariable [format ["LRG_CC_screen_%1_on", _selection], false, true];
	_object setObjectTextureGlobal [_selection, "z\LRG Fundamentals\Addons\Media\images\cc_screen_standby.paa"];

	[_object, _selection] remoteExec ["LR_fnc_deleteCamera", 0];
};