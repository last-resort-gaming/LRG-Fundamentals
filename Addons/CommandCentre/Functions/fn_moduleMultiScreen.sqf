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
private _screenSelections = _logic getVariable ["MultiScreenSelections", "1,2,3"];

private _sel = [];

{
    _sel pushBackUnique (parseNumber _x);
} forEach (_screenSelections splitString ',');

private _objects = synchronizedObjects _logic;
{
    private _obj = _x;
    {
        [_obj, format ["Screen #%1", _forEachIndex + 1], _allowCam, _allowDrone, _allowSat, _allowMap, _x] call LR_fnc_initScreen;
    } forEach _sel;
} foreach _objects;