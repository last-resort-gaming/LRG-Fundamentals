// not documented: called by module
if !(isserver) exitwith {};

params [
    ["_logic",objNull,[objNull]],
    ["_groups",[],[[]]],
    "_localGroups",
    "_logic"
];

private _objects = synchronizedObjects _logic;

private _detTime = _logic getVariable ["DetTime", 120];
private _proxRadius = _logic getVariable ["ProxRadius", 20];
private _secondaries = _logic getVariable ["Secondaries", true];
private _announce = _logic getVariable ["Announce", false];
private _annInterval = _logic getVariable ["AnnInterval", 30];
private _reqDefKit = _logic getVariable ["ReqDefKit", true];

{
	[
		_x,
		_detTime,
		_proxRadius,
		_secondaries,
		_announce,
		_annInterval,
		_reqDefKit
	] call LR_fnc_makeIED;
} forEach _objects;