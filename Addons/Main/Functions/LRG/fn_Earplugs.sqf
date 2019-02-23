// not documented: postInit

private _LRG_Main_Master = uiNamespace getVariable ["LRG_Main_Master", false];
if (not _LRG_Main_Master) exitWith{};

private _LRG_Main_Earplugs = uiNamespace getVariable ["LRG_Main_Earplugs", false];
if (not _LRG_Main_Earplugs) exitWith{};

if (!hasInterface) exitwith {};
if (isClass (configFile >> "CfgPatches" >> "ace_main")) exitwith {};

[] execVM "z\LRG Fundamentals\Addons\Main\Scripts\Earplugs\earplugs.sqf";