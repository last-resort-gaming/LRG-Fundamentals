// not documented: module called

params [
    ["_logic",objNull,[objNull]],
    ["_groups",[],[[]]],
    "_localGroups",
    "_logic"
];

//if (hasInterface && !isServer) exitWith {};

//_localGroups = _groups select { local _x };

//if (_localGroups isEqualTo []) exitWith {};

_SafeZoneEnable = _logic getVariable ["SafeZoneEnable", "0"];
_SafeZoneSize = _logic getVariable ["SafeZoneSize", "150"];
_SafeZoneDuration = _logic getVariable ["SafeZoneDuration", "-1"];
_SafeZoneLocation = (getPos _logic);

If !(_SafeZoneEnable) exitwith {};

[_SafeZoneSize, _SafeZoneDuration, _SafeZoneLocation] remoteExecCall ["LR_fnc_SafeZone", 0, true];
