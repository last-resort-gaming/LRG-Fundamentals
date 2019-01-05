
params [
    ["_logic",objNull,[objNull]],
    ["_groups",[],[[]]],
    "_localGroups",
    "_logic"
];

if (hasInterface && !isServer) exitWith {};

//_localGroups = _groups select { local _x };

//if (_localGroups isEqualTo []) exitWith {};

VehicleCrewListEnable = _logic getVariable ["VehicleCrewListEnable", true];
MapIconsEnable = _logic getVariable ["MapIconsEnable", true];
PilotCheck = _logic getVariable ["PilotCheck", true];

CHVD_Enabled = _logic getVariable ["ViewDistanceEnable", true];
CHVD_maxView = _logic getVariable ["ViewDistanceMaxDistance", 12000];
CHVD_maxObj = _logic getVariable ["ViewDistanceMaxObjectDistance", 12000];
CHVD_allowNoGrass = _logic getVariable ["ViewDistanceNoGrass", False];

ArsenalSaveLoad = _logic getVariable ["ArsenalSaveLoad", False];

DynamicWeatherEnable = _logic getVariable ["DynamicWeatherEnable", False];
DynamicWeatherStart = _logic getVariable ["DynamicWeatherStart", "Clear"];

TFARTransmitRange = _logic getVariable ["TFARTransmitRange", 2.5];
TFARTerrainInterference = _logic getVariable ["TFARTerrainInterference", 1.0];

CueCardsEnable = _logic getVariable ["CueCardsEnable", true];
CreatorActionsEnable = _logic getVariable ["CreatorActionsEnable", true];
DiaryEnable = _logic getVariable ["DiaryEnable", true];
FatigueVanilla = _logic getVariable ["FatigueVanilla", true];
FPSCounterEnable = _logic getVariable ["FPSCounterEnable", true];