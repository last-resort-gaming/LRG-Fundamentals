// not documented: module called

params [
    ["_logic",objNull,[objNull]],
    ["_groups",[],[[]]],
    "_localGroups",
    "_logic"
];

private _allowCam = _logic getVariable ["SingleScreenCam", true];
private _allowDrone = _logic getVariable ["SingleScreenDrone", true];
private _allowSat = _logic getVariable ["SingleScreenSat", true];
private _allowMap = _logic getVariable ["SingleScreenMap", true];
private _screenSelection = _logic getVariable ["SingleScreenSelection", 0];

private _objects = synchronizedObjects _logic;
{
    [_x, "Screen", _allowCam, _allowDrone, _allowSat, _allowMap, _screenSelection] call LR_fnc_initScreen;
} foreach _objects;