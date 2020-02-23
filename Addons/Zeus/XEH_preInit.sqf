// AISpawns Modules
[
    "LRG_Zeus_Module_AISpawnsEast",
    "CHECKBOX",
    ["Zeus Module - Spawn AI (East)", "Enable the Spawn AI (East) Zeus module for use with Achilles"],
    "LRG Zeus",
    true,
    true,
    {
        params ["_value"];
        if (!isClass (configFile >> "CfgPatches" >> "achilles_modules_f_achilles")) exitWith {};

        if (_value) then {
            Achilles_var_availableModuleClasses pushBackUnique "LRG_Module_AISpawnsEastZeus";
        } else {
            Achilles_var_availableModuleClasses = Achilles_var_availableModuleClasses - ["LRG_Module_AISpawnsEastZeus"];
        };
        Achilles_var_reloadDisplay = true;
    }
] call CBA_Settings_fnc_init;

[
    "LRG_Zeus_Module_AISpawnsIndep",
    "CHECKBOX",
    ["Zeus Module - Spawn AI (Independent)", "Enable the Spawn AI (Independent) Zeus module for use with Achilles"],
    "LRG Zeus",
    true,
    true,
    {
        params ["_value"];
        if (!isClass (configFile >> "CfgPatches" >> "achilles_modules_f_achilles")) exitWith {};

        if (_value) then {
            Achilles_var_availableModuleClasses pushBackUnique "LRG_Module_AISpawnsIndepZeus";
        } else {
            Achilles_var_availableModuleClasses = Achilles_var_availableModuleClasses - ["LRG_Module_AISpawnsIndepZeus"];
        };
        Achilles_var_reloadDisplay = true;
    }
] call CBA_Settings_fnc_init;

[
    "LRG_Zeus_Module_AISpawnsWest",
    "CHECKBOX",
    ["Zeus Module - Spawn AI (West)", "Enable the Spawn AI (West) Zeus module for use with Achilles"],
    "LRG Zeus",
    true,
    true,
    {
        params ["_value"];
        if (!isClass (configFile >> "CfgPatches" >> "achilles_modules_f_achilles")) exitWith {};

        if (_value) then {
            Achilles_var_availableModuleClasses pushBackUnique "LRG_Module_AISpawnsWestZeus";
        } else {
            Achilles_var_availableModuleClasses = Achilles_var_availableModuleClasses - ["LRG_Module_AISpawnsWestZeus"];
        };
        Achilles_var_reloadDisplay = true;
    }
] call CBA_Settings_fnc_init;

// CivilianSpawns Modules
[
    "LRG_Zeus_Module_CivilianSpawns",
    "CHECKBOX",
    ["Zeus Module - Spawn Civilians", "Enable the Spawn Civilians Zeus module for use with Achilles"],
    "LRG Zeus",
    true,
    true,
    {
        params ["_value"];
        if (!isClass (configFile >> "CfgPatches" >> "achilles_modules_f_achilles")) exitWith {};

        if (_value) then {
            Achilles_var_availableModuleClasses pushBackUnique "LRG_Module_CivilianSpawnsZeus";
        } else {
            Achilles_var_availableModuleClasses = Achilles_var_availableModuleClasses - ["LRG_Module_CivilianSpawnsZeus"];
        };
        Achilles_var_reloadDisplay = true;
    }
] call CBA_Settings_fnc_init;