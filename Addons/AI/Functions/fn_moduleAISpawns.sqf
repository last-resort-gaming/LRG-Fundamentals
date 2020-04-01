// not documented: module called
if !(isserver) exitwith {};

_logic = param [0,objNull,[objNull]];

_ObjName = _logic getVariable ["ObjName", "Objective 1"];
_Faction = _logic getVariable ["EnemyType", "OPF_F"];
_GarrRadius = _logic getVariable ["GarrRadius", 100];
_GarrisonedGroupsMin = _logic getVariable ["GarrisonedGroupsMin", 0];
_GarrisonedGroupsMax = _logic getVariable ["GarrisonedGroupsMax", 0];
_PatrolMethod = _logic getVariable ["PatrolMethod", "RANDOM"];
_Radius = _logic getVariable ["Radius", 500];
_EIPatrolsMin = _logic getVariable ["EIPatrolsMin", 0];
_EIPatrolsMax = _logic getVariable ["EIPatrolsMax", 0];
_EIAAMin = _logic getVariable ["EIAAMin", 0];
_EIAAMax = _logic getVariable ["EIAAMax", 0];
_EIATMin = _logic getVariable ["EIATMin", 0];
_EIATMax = _logic getVariable ["EIATMax", 0];
_EISniperMin = _logic getVariable ["EISniperMin", 0];
_EISniperMax = _logic getVariable ["EISniperMax", 0];
_VehAAMin = _logic getVariable ["VehAAMin", 0];
_VehAAMax = _logic getVariable ["VehAAMax", 0];
_VehLightMin = _logic getVariable ["VehLightMin", 0];
_VehLightMax = _logic getVariable ["VehLightMax", 0];
_VehMRAPMin = _logic getVariable ["VehMRAPMin", 0];
_VehMRAPMax = _logic getVariable ["VehMRAPMax", 0];
_VehHeavyMin  = _logic getVariable ["VehHeavyMin", 0];
_VehHeavyMax = _logic getVariable ["VehHeavyMax", 0];
_VehRandomMin = _logic getVariable ["VehRandomMin", 0];
_VehRandomMax = _logic getVariable ["VehRandomMax", 0];


_SpawnLocation = (getPos _logic);

[
    _SpawnLocation,
    _ObjName,
    _Faction,
    _GarrRadius,
    [_GarrisonedGroupsMin, _GarrisonedGroupsMax],
    _PatrolMethod,
    _Radius,
    [_EIPatrolsMin, _EIPatrolsMax],
    [_EIAAMin, _EIAAMax],
    [_EIATMin, _EIATMax],
    [_EISniperMin, _EISniperMax],
    [_VehAAMin, _VehAAMax],
    [_VehLightMin, _VehLightMax],    
    [_VehMRAPMin, _VehMRAPMax],
    [_VehHeavyMin, _VehHeavyMax],
    [_VehRandomMin, _VehRandomMax]
] call LR_fnc_SpawnAI;