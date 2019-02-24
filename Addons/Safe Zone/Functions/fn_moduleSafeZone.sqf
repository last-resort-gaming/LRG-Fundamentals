// not documented: module called

_logic = param [0,objNull,[objNull]];

//if (hasInterface && !isServer) exitWith {};

//_localGroups = _groups select { local _x };

//if (_localGroups isEqualTo []) exitWith {};

private _SafeZoneEnable = _logic getVariable ["SafeZoneEnable", "0"];
private _SafeZoneSize = _logic getVariable ["SafeZoneSize", "150"];
private _SafeZoneDuration = _logic getVariable ["SafeZoneDuration", "-1"];
private _SafeZoneLocation = (getPos _logic);

If !(_SafeZoneEnable) exitwith {};

[_SafeZoneSize, _SafeZoneDuration, _SafeZoneLocation] remoteExecCall ["LR_fnc_SafeZone", 0, true];
