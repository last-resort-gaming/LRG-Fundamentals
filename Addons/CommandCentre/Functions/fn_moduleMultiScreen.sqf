// not documented: module called

params [
    ["_logic",objNull,[objNull]],
    ["_groups",[],[[]]],
    "_localGroups",
    "_logic"
];

private _allowCam = _logic getVariable ["MultiScreenCam", true];
private _allowDrone = _logic getVariable ["MultiScreenDrone", true];
private _allowSat = _logic getVariable ["MultiScreenSat", true];
private _allowMap = _logic getVariable ["MultiScreenMap", true];
private _screenCount = _logic getVariable ["MultiScreenCount", 3];

private _objects = synchronizedObjects _logic;
{
    [_x, _allowCam, _allowDrone, _allowSat, _allowMap, _screenCount] call LR_fnc_initScreen;
} foreach _objects;