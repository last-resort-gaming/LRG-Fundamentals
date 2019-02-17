// not documented: module called
if !(isserver) exitwith {};

_logic = param [0,objNull,[objNull]];

_ObjName = _logic getVariable ["ObjName", "Objective 1"];
_Faction = _logic getVariable ["EnemyType", "CSAT"];
_Radius = _logic getVariable ["Radius", 500];
_GarrisonedGroups = _logic getVariable ["GarrisonedGroups", 0];
_EIPatrolsMin = _logic getVariable ["EIPatrolsMin", 0];
_EIPatrolsMax = _logic getVariable ["EIPatrolsMax", 0];
_EIAAMin = _logic getVariable ["EIAAMin", 0];
_EIAAMax = _logic getVariable ["EIAAMax", 0];
_EIATMin = _logic getVariable ["EIATMin", 0];
_EIATMax = _logic getVariable ["EIATMax", 0];
_SniperMin = _logic getVariable ["SniperMin", 0];
_SniperMax = _logic getVariable ["SniperMax", 0];
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
    _Faction,
    [_GarrisonedGroups],
    [_EIPatrolsMin, _EIPatrolsMax],
    [_EIAAMin, _EIAAMax],
    [_EIATMin, _EIATMax],
    [_SniperMin, _SniperMax],
    [_VehAAMin, _VehAAMax],
    [_VehMRAPMin, _VehMRAPMax],
    [_VehLightMin, _VehLightMax],
    [_VehHeavyMin, _VehHeavyMax],
    [_VehRandomMin, _VehRandomMax]
] call LR_fnc_SpawnAI;