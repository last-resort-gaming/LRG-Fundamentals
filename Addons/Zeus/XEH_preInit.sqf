// AISpawns Modules

[
    "LRG_Zeus_Module_AISpawnsEast",
    "CHECKBOX",
    ["Zeus Module - AI Spawn - East", "Enable the Spawn AI - East Zeus module for use with ZEN"],
    "LRG Zeus",
    true,
    true,
    {
        params ["_value"];
        if (!isClass (configFile >> "CfgPatches" >> "zen_main")) exitWith {};

        ["LRG Fundamentals", "AI Spawn - East", {_this call LR_fnc_moduleAISpawnsEastZeus}, "\z\LRG Fundamentals\addons\media\images\icons\AI EAST.paa"] call zen_custom_modules_fnc_register;
    }
] call CBA_Settings_fnc_init;

[
    "LRG_Zeus_Module_AISpawnsIndep",
    "CHECKBOX",
    ["Zeus Module - AI Spawn - Independent", "Enable the Spawn AI - Independent Zeus module for use with ZEN"],
    "LRG Zeus",
    true,
    true,
    {
        params ["_value"];
        if (!isClass (configFile >> "CfgPatches" >> "zen_main")) exitWith {};

        ["LRG Fundamentals", "AI Spawn - Independent", {_this call LR_fnc_moduleAISpawnsIndepZeus}, "\z\LRG Fundamentals\addons\media\images\icons\AI INDEP.paa"] call zen_custom_modules_fnc_register;
    }
] call CBA_Settings_fnc_init;

[
    "LRG_Zeus_Module_AISpawnsWest",
    "CHECKBOX",
    ["Zeus Module - AI Spawn - West", "Enable the Spawn AI - West Zeus module for use with ZEN"],
    "LRG Zeus",
    true,
    true,
    {
        params ["_value"];
        if (!isClass (configFile >> "CfgPatches" >> "zen_main")) exitWith {};

        ["LRG Fundamentals", "AI Spawn - West", {_this call LR_fnc_moduleAISpawnsWestZeus}, "\z\LRG Fundamentals\addons\media\images\icons\AI WEST.paa"] call zen_custom_modules_fnc_register;
    }
] call CBA_Settings_fnc_init;

// CivilianSpawns Module
[
    "LRG_Zeus_Module_CivilianSpawns",
    "CHECKBOX",
    ["Zeus Module - AI Spawn - Civilian", "Enable the Spawn AI Civilians Zeus module for use with ZEN"],
    "LRG Zeus",
    true,
    true,
    {
        params ["_value"];
        if (!isClass (configFile >> "CfgPatches" >> "zen_main")) exitWith {};

        ["LRG Fundamentals", "AI Spawn - Civilian", {_this call LR_fnc_moduleCivilianSpawnsZeus}, "\z\LRG Fundamentals\addons\media\images\Icons\AI CIV.paa"] call zen_custom_modules_fnc_register;
    }
] call CBA_Settings_fnc_init;

// SafeZone Module
[
    "LRG_Zeus_Module_SafeZone",
    "CHECKBOX",
    ["Zeus Module - Safe Zone", "Enable the Safe Zone Zeus module for use with ZEN"],
    "LRG Zeus",
    true,
    true,
    {
        params ["_value"];
        if (!isClass (configFile >> "CfgPatches" >> "zen_main")) exitWith {};

        ["LRG Fundamentals", "Safe Zone", {_this call LR_fnc_moduleSafeZoneZeus}, "\z\LRG Fundamentals\addons\media\images\Icons\Safe Zone.paa"] call zen_custom_modules_fnc_register;
    }
] call CBA_Settings_fnc_init;