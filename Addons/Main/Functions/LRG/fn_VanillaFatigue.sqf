// not documented: postInit

if (!hasinterface) exitwith {};

private _LRG_Main_Master = uiNamespace getVariable ["LRG_Main_Master", false];
if (not _LRG_Main_Master) exitWith{};

private _LRG_Main_FatigueVanilla = uiNamespace getVariable ["LRG_Main_FatigueVanilla", false];
if (not _LRG_Main_FatigueVanilla) exitWith{};


if !(isClass (configFile >> "CfgPatches" >> "ace_main")) exitwith {};


player enableFatigue LRG_Main_FatigueVanilla;