// not documented: module called
if !(isserver) exitwith {};

_logic = param [0,objNull,[objNull]];

_SpawnLocation = (getPos _logic);
_ObjName = _logic getVariable ["ObjName", "Objective 1"];
_Faction = _logic getVariable ["Type", "CIV_F"];
_Side = _logic getVariable ["Side", "civilian"];
_GarrRadius = _logic getVariable ["GarrRadius", 200];
_GarrisonedUnitsMin = _logic getVariable ["GarrisonedUnitsMin", 0];
_GarrisonedUnitsMax = _logic getVariable ["GarrisonedUnitsMax", 0];
_Radius = _logic getVariable ["Radius", 500];
_civPedPatrolsMin = _logic getVariable ["CivPedPatrolsMin", 0];
_civPedPatrolsMax = _logic getVariable ["CivPedPatrolsMax", 0];
_civVehPatrolsMin = _logic getVariable ["CivVehPatrolsMin", 0];
_civVehPatrolsMax = _logic getVariable ["CivVehPatrolsMax", 0];
_civVehParkedMin = _logic getVariable ["CivVehParkedMin", 0];
_civVehParkedMax = _logic getVariable ["CivVehParkedMax", 0];

// Figure out the side stuff
_Side = toLower _Side;

switch (_Side) do {
	case "west": {_Side = west;};
	case "east": {_Side = east;};
	case "independent": {_Side = independent;};
	case "civilian": {_Side = civilian;};
	default {_Side = civilian;};
};

[
    _SpawnLocation,
    _ObjName,
    _Faction,
    _Side,
    _GarrRadius,    
    [_GarrisonedUnitsMin, _GarrisonedUnitsMax],
    _Radius,    
    [_civPedPatrolsMin, _civPedPatrolsMax],
    [_civVehPatrolsMin, _civVehPatrolsMax],
    [_civVehParkedMin, _civVehParkedMax]
] call LR_fnc_SpawnCivilians;