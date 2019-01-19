if (isNil "LRG_Main_Master") exitwith {};
if (not LRG_Main_Master) exitWith{};

if (isNil "LRG_Main_Earplugs") exitwith {};
if (not LRG_Main_Earplugs) exitWith{};

if (!hasInterface) exitwith {};
if (isClass (configFile >> "CfgPatches" >> "ace_main")) exitwith {};

[] execVM "LRG Fundamentals\General\scripts\YAINA\earplugs.sqf";