// not documented: module called

params [
    ["_logic",objNull,[objNull]],
    ["_groups",[],[[]]],
    "_localGroups",
    "_logic"
];

private _radioClass = _logic getVariable ["StationaryRadioClass", "TFAR_anarc210"];
private _radioOn = _logic getVariable ["StationaryRadioOn", true];
private _radioCh1 = _logic getVariable ["StationaryRadioCh1", 30];
private _radioCh2 = _logic getVariable ["StationaryRadioCh2", 40];
private _radioVol = _logic getVariable ["StationaryRadioVol", 7];
private _radioCode = _logic getVariable ["StationaryRadioCode", "_bluefor"];

private _objects = synchronizedObjects _logic;
{
    [_x, _radioClass, _radioOn, _radioCh1, _radioCh2, _radioVol, _radioCode] call LR_fnc_initRadio;
} foreach _objects;