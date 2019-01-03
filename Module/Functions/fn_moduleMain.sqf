params [
    ["_logic",objNull,[objNull]],
    ["_groups",[],[[]]],
    "_localGroups",
    "_logic",
    ["_VehicleCrewListEnable", true],
	["_ViewDistanceMaxDistance", 12000],
	["_ViewDistanceMaxObjectDistance", 12000],
	["_ViewDistanceNoGrass", false],
	["_ArsenalSaveLoad", false],
	["_DynamicWeatherEnable", true],
	["_DynamicWeatherStart", "Clear"],
	["_TFARTransmitRange", 2.5],
	["_TFARTerrainInterference", 1.0],
	["_SideChatEnable", true],
	["_SideChatDuration", 60]
];

//if (hasInterface && !isServer) exitWith {};

//_localGroups = _groups select { local _x };

//if (_localGroups isEqualTo []) exitWith {};

_VehicleCrewListEnable = _logic getVariable ["VehicleCrewListEnable", "0"];
_MapIconsEnable = _logic getVariable ["MapIconsEnable", "0"];
_TFARTransmitRange = _logic getVariable ["TFARTransmitRange", "1"];
_TFARTerrainInterference = _logic getVariable ["TFARTerrainInterference", "1"];

// Client Actions
if (hasInterface) then {
	if (_VehicleCrewListEnable) then {call YAINA_fnc_crewNames;};
	if (_MapIconsEnable) then { _null = [] execVM "LRG Fundamentals\General\scripts\QS\QS_icons.sqf";};
	if !(isClass (configFile >> "CfgPatches" >> "ace_main")) then {
		[] execVM "LRG Fundamentals\General\scripts\YAINA\earplugs.sqf";
		["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;
		player enableFatigue false;
	};
	player setVariable ["tf_sendingDistanceMultiplicator", _TFARTransmitRange];
	player setVariable ["TF_terrain_interception_coefficient", _TFARTerrainInterference];

};

// Server Actions
if (isserver) then {};