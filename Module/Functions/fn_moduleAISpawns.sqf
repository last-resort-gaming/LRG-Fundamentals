if !(isserver) exitwith {};

params [
    ["_logic",objNull,[objNull]],
    ["_groups",[],[[]]],
    "_localGroups",
    "_logic",
    ["_ObjName", "Objective 1"],
	["_EnemyType", "CSAT"],
	["_Radius", 500],
	["_GarrisonedGroups", 0],
	["_GarrisonedGroupsMin", 0],
	["_GarrisonedGroupsMax", 0],
	["_EIPatrolsMin", 0],
	["_EIPatrolsMax", 0],
	["_EIAAMin", 0],
	["_EIAAMax", 0],
	["_EIATMin", 0],
	["_EIATMax", 0],
	["_VehAAMin", 0],
	["_VehAAMax", 0],
	["_VehMRAPMin", 0],
	["_VehMRAPMax", 0],
	["_VehLightMin", 0],
	["_VehLightMax", 0],
	["_VehHeavyMin", 0],
	["_VehHeavyMax", 0],
	["_VehRandomMin", 0],
	["_VehRandomMax", 0]
];

_ObjName = _logic getVariable ["ObjName", "Objective 1"];
_EnemyType = _logic getVariable ["EnemyType", "CSAT"];
_Radius = _logic getVariable ["Radius", 500];
_GarrisonedGroups = _logic getVariable ["GarrisonedGroups", 0];
_GarrisonedGroupsMin = _logic getVariable ["GarrisonedGroupsMin", 0];
_GarrisonedGroupsMax = _logic getVariable ["GarrisonedGroupsMax", 0];
_EIPatrolsMin = _logic getVariable ["EIPatrolsMin", 0];
_EIPatrolsMax = _logic getVariable ["EIPatrolsMax", 0];
_EIAAMin = _logic getVariable ["EIAAMin", 0];
_EIAAMax = _logic getVariable ["EIAAMax", 0];
_EIATMin = _logic getVariable ["EIATMin", 0];
_EIATMax = _logic getVariable ["EIATMax", 0];
_VehAAMin = _logic getVariable ["VehAAMin", 0];
_VehAAMax = _logic getVariable ["VehAAMax", 0];
_VehMRAPMin = _logic getVariable ["VehMRAPMin", 0];
_VehMRAPMax = _logic getVariable ["VehMRAPMax", 0];
_VehLightMin = _logic getVariable ["VehLightMin", 0];
_VehLightMax = _logic getVariable ["VehLightMax", 0];
_VehHeavyMin  = _logic getVariable ["VehHeavyMin", 0];
_VehHeavyMax = _logic getVariable ["VehHeavyMax", 0];
_VehRandomMin = _logic getVariable ["VehRandomMin", 0];
_VehRandomMax = _logic getVariable ["VehRandomMax", 0];

_SpawnLocation = (getPos _logic);

[
    _ObjName,
    _SpawnLocation,
    _Radius,
    _EnemyType,
    [_GarrisonedGroups, _GarrisonedGroupsMin, _GarrisonedGroupsMax],
    [_EIPatrolsMin, _EIPatrolsMax],
    [_EIAAMin, _EIAAMax],
    [_EIATMin, _EIATMax],
    [_VehAAMin, _VehAAMax],
    [_VehMRAPMin, _VehMRAPMax],
    [_VehLightMin, _VehLightMax],
    [_VehHeavyMin, _VehHeavyMax],
    [_VehRandomMin, _VehRandomMax]
] call LR_fnc_SpawnAI;