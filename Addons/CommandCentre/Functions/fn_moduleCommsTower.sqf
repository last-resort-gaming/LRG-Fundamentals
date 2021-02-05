// not documented: module called

params [
    ["_logic",objNull,[objNull]],
    ["_groups",[],[[]]],
    "_localGroups",
    "_logic"
];

if !(isServer) exitWith {};
if !(isClass (configFile >> "CfgPatches" >> "task_force_radio")) exitWith {};

private _objects = synchronizedObjects _logic;
{
    [_x, 50000] call TFAR_antennas_fnc_initRadioTower;
} foreach _objects;