LRG_AIS_MASTER_ENABLE = uiNamespace getVariable ["LRG_AIS_MASTER_ENABLE", false];

if (isNil "LRG_AIS_MASTER_ENABLE") exitwith {};
if (not LRG_AIS_MASTER_ENABLE) exitWith{};
diag_log format ["############## %1 ############## - AIS init started", missionName];

if (isServer) then {
	ais_mobile_medic_stations  = [];
	publicVariable "ais_mobile_medic_stations";
};

if !(isClass (configFile >> "CfgPatches" >> "ace_main")) then {

    removeAllMissionEventHandlers "Draw3D";
    removeAllMissionEventHandlers "EachFrame";

    call LRG_AIS_Core_fnc_initEvents;
    AIS_Core_Interaction_Actions = [];

};
