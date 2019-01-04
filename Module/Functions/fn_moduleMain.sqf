params [
    ["_logic",objNull,[objNull]],
    ["_groups",[],[[]]],
    "_localGroups",
    "_logic",
    ["_VehicleCrewListEnable", true],
	["_MapIconsEnable", true],
	["_ViewDistanceMaxDistance", 12000],
	["_ViewDistanceMaxObjectDistance", 12000],
	["_ViewDistanceNoGrass", false],
	["_ArsenalSaveLoad", false],
	["_DynamicWeatherEnable", false],
	["_DynamicWeatherStart", "Clear"],
	["_TFARTransmitRange", 2.5],
	["_TFARTerrainInterference", 1.0],
	["_SideChatEnable", true],
	["_SideChatDuration", 60]
];

//if (hasInterface && !isServer) exitWith {};

//_localGroups = _groups select { local _x };

//if (_localGroups isEqualTo []) exitWith {};

_VehicleCrewListEnable = _logic getVariable ["VehicleCrewListEnable", true];
_MapIconsEnable = _logic getVariable ["MapIconsEnable", true];
CHVD_maxView = _logic getVariable ["ViewDistanceMaxDistance", 12000];
CHVD_maxObj = _logic getVariable ["ViewDistanceMaxObjectDistance", 12000];
CHVD_allowNoGrass = _logic getVariable ["ViewDistanceNoGrass", False];
_ArsenalSaveLoad = _logic getVariable ["ArsenalSaveLoad", False];
_DynamicWeatherEnable = _logic getVariable ["DynamicWeatherEnable", False];
_DynamicWeatherStart = _logic getVariable ["DynamicWeatherStart", "Clear"];
_TFARTransmitRange = _logic getVariable ["TFARTransmitRange", 2.5];
_TFARTerrainInterference = _logic getVariable ["TFARTerrainInterference", 1.0];
_SideChatEnable = _logic getVariable ["SideChatEnable", True];
_SideChatDuration = _logic getVariable ["SideChatDuration", 60];

enableSaving [false, false];

// Client Actions
if (hasInterface) then {
	[
		_VehicleCrewListEnable,
		_MapIconsEnable,
		_ArsenalSaveLoad,
		_TFARTransmitRange,
		_TFARTerrainInterference
	] call LR_fnc_InitPlayerLocal;
};

// Server Actions
if (isserver) then {call LR_fnc_InitServer;};
if (_SideChatEnable) then {[_SideChatDuration] call LR_fnc_SideChat;};

// Global Actions
if (_DynamicWeatherEnable) then {[_DynamicWeatherStart] call LR_fnc_RealWeather;};