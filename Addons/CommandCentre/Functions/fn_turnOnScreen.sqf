params ["_object", "_selection", "_turnOn"];

if (_turnOn) then {
	_object setVariable [format ["LRG_CC_screen_%1_on", _selection], true, true];
	[_object, _selection] call LR_fnc_configureScreen;
} else {
	_object setVariable [format ["LRG_CC_screen_%1_on", _selection], false, true];
	_object setObjectTextureGlobal [_selection, "z\LRG Fundamentals\Addons\Media\images\cc_screen_standby.paa"];
};