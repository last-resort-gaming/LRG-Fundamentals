params ["_object", "_selection", "_rendertarget", "_data"];

private ["_targetOffSet", "_camOffSet"];
private _host = objNull;
private _isMan = false;

call cTab_fnc_updateLists;

{
	if (_data isEqualTo (str _x)) exitWith {_host = _x;};
} forEach cTabHcamlist;

if (isNull _host) then {
	{
		if (_data isEqualTo (str _x)) exitWith {_host = _x;};
	} forEach LRG_CC_vehicleCamList;
} else {
	_isMan = true;
};

call {

	if (_isMan) exitWith {
		// should unit not be in a vehicle
		if (vehicle _host isKindOf "CAManBase") exitWith {
			_camOffSet = [0.12,0,0.15];
			_targetOffSet = [0,8,1];
		};
		_host = vehicle _host;
		_camOffSet = [0,-8,4];
		_targetOffSet = [0,8,2];
	};

	// Might want to calculate offsets based on the actual vehicle dimensions in the future
	_camOffSet = [0,-8,4];
	_targetOffSet = [0,8,2];
};

if (isNull _host) exitWith {
	// systemChat "Could not find camera host.";
};

private _cam = objNull;
private _exit = false;

[_object, _selection] call LR_fnc_deleteCamera;

private _target = "Sign_Sphere10cm_F" createVehicleLocal (position player);
hideObject _target;
_target attachTo [_host, _targetOffSet];

_cam = "camera" camCreate (getPosATL _host);
_cam camPrepareFov 0.7;
_cam camPrepareTarget _target;
_cam camCommitPrepared 0;

if (vehicle _host == _host) then {
	_cam attachTo [_host, _camOffSet, "Head"];
} else {
	_cam attachTo [_host, _camOffSet];
};

_cam cameraEffect ["INTERNAL", "BACK", _renderTarget];

_object setObjectTexture [_selection, format ["#(argb,512,512,1)r2t(%1,1.3096153846)", _renderTarget]];

_object setVariable [format ["LRG_CC_screen_%1_Cam", _selection], [_cam, _target, _host]];