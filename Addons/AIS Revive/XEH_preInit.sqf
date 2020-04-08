//==================================================================================//
//================================ MASTER SWITCHES ================================//
//==================================================================================//
// LRG_AIS_MASTER_ENABLE
[
    "LRG_AIS_MASTER_ENABLE",
    "CHECKBOX",
    ["Enabled", "True to Enable AIS Revive. Automatically disabled if @ACE is detected."],
    "LRG AIS Revive",
    true,
    true,
    {  
       uiNamespace setVariable ["LRG_AIS_REVIVE_GUARANTY", _this];
    }
] call CBA_Settings_fnc_init;

// LRG_AIS_REVIVE_INIT_UNITS
[
    "LRG_AIS_REVIVE_INIT_UNITS",
    "LIST",
    ["Revivable Units", "Units which AIS Revive is enabled on."],
    "LRG AIS Revive",
    [[0, 1, 2, 3, 4, 5], [
        ["Players Only", "Players Only."],
        ["All Units", "All Units."],
        ["BLUFOR Only", "BLUFOR Only."],
        ["OPFOR Only", "OPFOR Only."],
        ["INDEP Only", "INDEP Only."],
        ["Civilians Only", "Civilians Only."]
    ], 0],
    true,
    {  
       uiNamespace setVariable ["LRG_AIS_REVIVE_INIT_UNITS", _this];
    }
] call CBA_Settings_fnc_init;

// LRG_AIS_MEDICAL_EDUCATION
[
    "LRG_AIS_MEDICAL_EDUCATION",
    "LIST",
    ["Revivers", "Who can revive."],
    "LRG AIS Revive",
    [[0, 1, 2], [
        ["Everybody", "Everybody."],
        ["Everybody with First Aid Kit or Medkit", "Everybody with First Aid Kit or Medkit."],
        ["Medics Only", "allUnitsBLUFOR."]
    ], 2],
    true,
    {  
       uiNamespace setVariable ["LRG_AIS_MEDICAL_EDUCATION", _this];
    }
] call CBA_Settings_fnc_init;

// LRG_AIS_REVIVE_GUARANTY
[
    "LRG_AIS_REVIVE_GUARANTY",
    "CHECKBOX",
    ["Forced Unconscious Mode", "If True, unit will always go unconscious if hurt."],
    "LRG AIS Revive",
    true,
    true,
    {  
       uiNamespace setVariable ["LRG_AIS_REVIVE_GUARANTY", _this];
    }
] call CBA_Settings_fnc_init;

[
	"AIS_MEDEVAC_STATIONS",
	"EDITBOX",
	["Medivac Stations", "Variable Names of any Medivac Stations. If used, revive is ONLY available at these locations."],
	"LRG AIS Revive",
	""

] call cba_settings_fnc_init;
