params ["_object", "_selection", "_rendertarget", "_data", "_seat"];

private _uav = objNull;

call cTab_fnc_updateLists;

{
	if (_data == str _x) exitWith {_uav = _x;};
} forEach cTabUAVlist;

// exit if requested UAV could not be found
if (isNull _uav) exitWith {false};

// exit if requested UAV is not alive
if (!alive _uav) exitWith {false};

[_object, _selection] call LR_fnc_deleteCamera;

private _cam = objNull;
private _camPosMemPt = "";
private _camDirMemPt = "";

private _seatName = call {
	if (_seat == 0) exitWith {"Driver"};
	if (_seat == 1) exitWith {"Gunner"};
	""
};

if (_seatName != "") then {
	_camPosMemPt = getText (configFile >> "CfgVehicles" >> typeOf _uav >> "uavCamera" + _seatName + "Pos");
	_camDirMemPt = getText (configFile >> "CfgVehicles" >> typeOf _uav >> "uavCamera" + _seatName + "Dir");
};

if ((_camPosMemPt != "") && (_camDirMemPt != "")) then {
	_cam = "camera" camCreate [0,0,0];
	_cam attachTo [_uav,[0,0,0],_camPosMemPt];
	// set up cam on render target
	_cam cameraEffect ["INTERNAL","BACK",_renderTarget];
	_object setObjectTexture [_selection, format ["#(argb,512,512,1)r2t(%1,1.3096153846)", _renderTarget]];
	call {
		if (_seat == 1) exitWith {
			_cam camSetFov 0.1; // set zoom
		};
		_cam camSetFov 0.5; // set default zoom
	};
	// set up cam updating
	[_uav,_renderTarget,_cam,_camPosMemPt,_camDirMemPt] spawn {
		private _uav = _this select 0;
		private _cam = _this select 2;

		while {(not isNull _uav) && (not isNull _cam)} do {
			if (alive _uav) then {
				_dir = (_uav selectionPosition (_this select 3)) vectorFromTo (_uav selectionPosition (_this select 4));
				_cam setVectorDirAndUp [_dir,_dir vectorCrossProduct [-(_dir select 1), _dir select 0, 0]];
			} else {
				_cam cameraEffect ["TERMINATE", "BACK"];
				camDestroy _cam;
			};
			sleep 0.1;
		};
	};
	_object setVariable [format ["LRG_CC_screen_%1_Cam", _selection], [_cam, objNull, _uav]];
};