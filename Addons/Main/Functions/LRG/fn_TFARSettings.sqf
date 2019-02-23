// not documented: postInit

if (isserver) then {{_x setSpeaker "NoVoice"} forEach playableUnits;}; // Here because it has nowhere else to go!

if (!hasinterface) exitwith {};

private _LRG_Main_Master = uiNamespace getVariable ["LRG_Main_Master", false];
if (not _LRG_Main_Master) exitWith{};

if !(isClass (configFile >> "CfgPatches" >> "task_force_radio")) exitwith {};

if (isNil "LRG_Main_TFARTransmitRange") exitwith {};
player setVariable ["tf_sendingDistanceMultiplicator", LRG_Main_TFARTransmitRange];

if (isNil "LRG_Main_TFARTerrainInterference") exitwith {};
player setVariable ["TF_terrain_interception_coefficient", LRG_Main_TFARTerrainInterference];
