// not documented: postInit

if (!hasinterface) exitwith {};
if (isNil "LRG_Main_Master") exitwith {};
if (not LRG_Main_Master) exitWith{};

if !(isClass (configFile >> "CfgPatches" >> "ace_main")) exitwith {};

if (isNil "LRG_Main_FatigueVanilla") then {LRG_Main_FatigueVanilla = false};
player enableFatigue LRG_Main_FatigueVanilla;