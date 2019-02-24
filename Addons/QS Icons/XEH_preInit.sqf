//==================================================================================//
//================================ MASTER SWITCHES ================================//
//==================================================================================//

// LRG_QS_ST_MasterEnable
[
    "LRG_QS_ST_MasterEnable",
    "CHECKBOX",
    ["Master - Enable", "Enable QS Icons. Deselect to turn off QS Icons."],
    "LRG QS Icons",
    true,
    true,
    {  
        if (!isserver) exitwith {};
        if (_this) then {remoteExecCall ["LR_fnc_MapIcons", 0, true]};
    }
] call CBA_Settings_fnc_init;

// LRG_QS_ST_map_enableUnitIcons
[
    "LRG_QS_ST_map_enableUnitIcons",
    "CHECKBOX",
    ["Master - Map Icons", "TRUE to enable MAP unit/vehicle Icons."],
    "LRG QS Icons",
    true,
    true,
    {  
       uiNamespace setVariable ["LRG_QS_ST_map_enableUnitIcons", _this];
    }
] call CBA_Settings_fnc_init;

// LRG_QS_ST_gps_enableUnitIcons
[
    "LRG_QS_ST_gps_enableUnitIcons",
    "CHECKBOX",
    ["Master - GPS Icons ", "TRUE to enable GPS unit/vehicle Icons."],
    "LRG QS Icons",
    true,
    true,
    {  
       uiNamespace setVariable ["LRG_QS_ST_gps_enableUnitIcons", _this];
    }
] call CBA_Settings_fnc_init;

// LRG_QS_ST_enableGroupIcons
[
    "LRG_QS_ST_enableGroupIcons",
    "CHECKBOX",
    ["Master - Group Icons", "TRUE to enable Group unit/vehicle Icons."],
    "LRG QS Icons",
    true,
    true,
    {  
       uiNamespace setVariable ["LRG_QS_ST_enableGroupIcons", _this];
    }
] call CBA_Settings_fnc_init;

//==================================================================================//
//================================ CONFIGURE MAP ================================//
//==================================================================================//

// LRG_QS_ST_showFactionOnly
[
    "LRG_QS_ST_showFactionOnly",
    "CHECKBOX",
    ["Map - Faction Only", "Enable to show only the players FACTION, not SIDE."],
    "LRG QS Icons",
    true,
    true,
    {  
       uiNamespace setVariable ["LRG_QS_ST_showFactionOnly", _this];
    }
] call CBA_Settings_fnc_init;

// LRG_QS_ST_showAI
[
    "LRG_QS_ST_showAI",
    "CHECKBOX",
    ["Map - AI", "Show AI Units on Map"],
    "LRG QS Icons",
    false,
    true,
    {  
       uiNamespace setVariable ["LRG_QS_ST_showAI", _this];
    }
] call CBA_Settings_fnc_init;

// LRG_QS_ST_AINames
[
    "LRG_QS_ST_AINames",
    "CHECKBOX",
    ["Map - AI Names", "Enable to show AI human names on map, otherwise map will only state AI."],
    "LRG QS Icons",
    false,
    true,
    {  
       uiNamespace setVariable ["LRG_QS_ST_AINames", _this];
    }
] call CBA_Settings_fnc_init;

// LRG_QS_ST_showCivilianIcons
[
    "LRG_QS_ST_showCivilianIcons",
    "CHECKBOX",
    ["Map - Civilian Icons", "Show Civilian Icons on map."],
    "LRG QS Icons",
    false,
    true,
    {  
       uiNamespace setVariable ["LRG_QS_ST_showCivilianIcons", _this];
    }
] call CBA_Settings_fnc_init;

// LRG_QS_ST_iconMapText
[
    "LRG_QS_ST_iconMapText",
    "CHECKBOX",
    ["Map - Icon Text", "Show Civilian Icons on map."],
    "LRG QS Icons",
    true,
    true,
    {  
       uiNamespace setVariable ["LRG_QS_ST_iconMapText", _this];
    }
] call CBA_Settings_fnc_init;

// LRG_QS_ST_showMOS
[
    "LRG_QS_ST_showMOS",
    "CHECKBOX",
    ["Map - Military Occupational Specialty", "Show Military Occupational Specialty text(unit/vehicle class/role display name), FALSE = disable and only show icons and names."],
    "LRG QS Icons",
    true,
    true,
    {  
       uiNamespace setVariable ["LRG_QS_ST_showMOS", _this];
    }
] call CBA_Settings_fnc_init;

// LRG_QS_ST_showMOS_range
[
    "LRG_QS_ST_showMOS_range",
    "SLIDER",
    ["Map - Military Occupational Specialty Range", "Range in meters to show MOS on the map."],
    "LRG QS Icons",
    [0, 5000, 3500, 0],
    true,
    {  
       uiNamespace setVariable ["LRG_QS_ST_showMOS_range", _this];
    }
] call CBA_Settings_fnc_init;

// LRG_QS_ST_showGroupOnly
[
    "LRG_QS_ST_showGroupOnly",
    "CHECKBOX",
    ["Map - Group ONLY", "Show ONLY the unit icons of THE PLAYERS GROUP MEMBERS on the MAP, FALSE to show ALL your factions units."],
    "LRG QS Icons",
    false,
    true,
    {  
       uiNamespace setVariable ["LRG_QS_ST_showGroupOnly", _this];
    }
] call CBA_Settings_fnc_init;

// LRG_QS_ST_iconUpdatePulseDelay
[
    "LRG_QS_ST_iconUpdatePulseDelay",
    "SLIDER",
    ["Map - Refresh Rate", "How often should location of unit on the MAP be updated in seconds?"],
    "LRG QS Icons",
    [0, 300, 0, 0],
    true,
    {  
       uiNamespace setVariable ["LRG_QS_ST_iconUpdatePulseDelay", _this];
    }
] call CBA_Settings_fnc_init;

// LRG_QS_ST_iconTextFonts
[
    "LRG_QS_ST_iconTextFonts",
    "LIST",
    ["Map - Font", "Map Icon Text Font."],
    "LRG QS Icons",
    [[0, 1, 2, 3, 4, 5, 6, 7, 8], [
        ["EtelkaMonospacePro", "EtelkaMonospacePro."],
        ["EtelkaMonospaceProBold", "EtelkaMonospaceProBold."],
        ["EtelkaNarrowMediumPro", "EtelkaNarrowMediumPro."],
        ["LucidaConsoleB", "LucidaConsoleB."],
        ["PuristaBold", "PuristaBold."],
        ["PuristaLight", "PuristaLight."],
        ["puristaMedium", "puristaMedium."],
        ["PuristaSemibold", "PuristaSemibold."],
        ["TahomaB", "TahomaB."]
    ], 5],
    true,
    {  
       uiNamespace setVariable ["LRG_QS_ST_iconTextFonts", _this];
    }
] call CBA_Settings_fnc_init;


//==================================================================================//
//=========================== CONFIGURE GPS (UNIT/VEHICLE) ICONS ===================//
//==================================================================================//

// LRG_QS_ST_GPSDist
[
    "LRG_QS_ST_GPSDist",
    "SLIDER",
    ["GPS - Range", "Distance from player that units shown on GPS"],
    "LRG QS Icons",
    [0, 1000, 300, 0],
    true,
    {  
       uiNamespace setVariable ["LRG_QS_ST_GPSDist", _this];
    }
] call CBA_Settings_fnc_init;

// LRG_QS_ST_GPSshowNames
[
    "LRG_QS_ST_GPSshowNames",
    "CHECKBOX",
    ["GPS - Names", "Show unit names on the GPS display."],
    "LRG QS Icons",
    false,
    true,
    {  
       uiNamespace setVariable ["LRG_QS_ST_GPSshowNames", _this];
    }
] call CBA_Settings_fnc_init;

// LRG_QS_ST_GPSshowGroupOnly
[
    "LRG_QS_ST_GPSshowGroupOnly",
    "CHECKBOX",
    ["GPS - Group ONLY", "Show only group members on the GPS display."],
    "LRG QS Icons",
    false,
    true,
    {  
       uiNamespace setVariable ["LRG_QS_ST_GPSshowGroupOnly", _this];
    }
] call CBA_Settings_fnc_init;


//==================================================================================//
//============================= CONFIGURE GROUP ICONS ==============================//
//==================================================================================//

// LRG_QS_ST_showGroupMapIcons
[
    "LRG_QS_ST_showGroupMapIcons",
    "CHECKBOX",
    ["Group - Map Icon", "Show rectangular group Icon on Map."],
    "LRG QS Icons",
    true,
    true,
    {  
       uiNamespace setVariable ["LRG_QS_ST_showGroupMapIcons", _this];
    }
] call CBA_Settings_fnc_init;

// LRG_QS_ST_showGroupHudIcons
[
    "LRG_QS_ST_showGroupHudIcons",
    "CHECKBOX",
    ["Group - HUD", "Group icons displayed on player 3D HUD."],
    "LRG QS Icons",
    false,
    true,
    {  
       uiNamespace setVariable ["LRG_QS_ST_showGroupHudIcons", _this];
    }
] call CBA_Settings_fnc_init;

// LRG_QS_ST_showAIGroups
[
    "LRG_QS_ST_showAIGroups",
    "CHECKBOX",
    ["Group - AI Groups", "Show Groups with AI leaders."],
    "LRG QS Icons",
    false,
    true,
    {  
       uiNamespace setVariable ["LRG_QS_ST_showAIGroups", _this];
    }
] call CBA_Settings_fnc_init;

// LRG_QS_ST_showAINames
[
    "LRG_QS_ST_showAINames",
    "CHECKBOX",
    ["Group - AI Names", "Show AI Names."],
    "LRG QS Icons",
    false,
    true,
    {  
       uiNamespace setVariable ["LRG_QS_ST_showAINames", _this];
    }
] call CBA_Settings_fnc_init;

// LRG_QS_ST_groupTextFactionOnly
[
    "LRG_QS_ST_groupTextFactionOnly",
    "CHECKBOX",
    ["Group - Faction ONLY", "Show group icon text from ONLY the PLAYERS faction."],
    "LRG QS Icons",
    false,
    true,
    {  
       uiNamespace setVariable ["LRG_QS_ST_groupTextFactionOnly", _this];
    }
] call CBA_Settings_fnc_init;

// LRG_QS_ST_showOwnGroup
[
    "LRG_QS_ST_showOwnGroup",
    "CHECKBOX",
    ["Group - Own Group", "Show players own group icon."],
    "LRG QS Icons",
    false,
    true,
    {  
       uiNamespace setVariable ["LRG_QS_ST_showOwnGroup", _this];
    }
] call CBA_Settings_fnc_init;

//==================================================================================//
//============================= CONFIGURE MEDICAL ICONS ==============================//
//==================================================================================//

// LRG_QS_ST_MedicalSystem
[
    "LRG_QS_ST_MedicalSystem",
    "LIST",
    ["Medical - System", "Used to ensure QS Icons are used with a predefined medical system."],
    "LRG QS Icons",
    [[0, 1, 2, 3, 4, 5], [
        ["BIS", "BIS Revive."],
        ["BTC", "BTC Revive."],
        ["AIS", "AIS Revive."],
        ["ACE", "@ACE 3 Revive."],
        ["FAR", "Farooq's Revive."],
        ["AWS", "A3 Wounding System by Psycho."]
    ], 0],
    true,
    {  
       uiNamespace setVariable ["LRG_QS_ST_MedicalSystem", _this];
    }
] call CBA_Settings_fnc_init;

// LRG_QS_ST_showMedicalWounded
[
    "LRG_QS_ST_showMedicalWounded",
    "CHECKBOX",
    ["Medical - Show Wounded", "Show wounded on the map and GPS."],
    "LRG QS Icons",
    true,
    true,
    {  
       uiNamespace setVariable ["LRG_QS_ST_showMedicalWounded", _this];
    }
] call CBA_Settings_fnc_init;


//==================================================================================//
//=========================== CONFIGURE ICON COLOURS ===================//
//==================================================================================//

// LRG_QS_ST_iconColor_EAST
[
    "LRG_QS_ST_iconColor_EAST",
    "COLOR",
    ["Icon Color - EAST", "Icon Color for any East units."],
    "LRG QS Icons",
    [0.5,0,0,0.65],
    true,
    {  
       uiNamespace setVariable ["LRG_QS_ST_iconColor_EAST", _this];
    }
] call CBA_Settings_fnc_init;

// LRG_QS_ST_iconColor_WEST
[
    "LRG_QS_ST_iconColor_WEST",
    "COLOR",
    ["Icon Color - WEST", "Icon Color for any West units."],
    "LRG QS Icons",
    [0,0.3,0.6,0.65],
    true,
    {  
       uiNamespace setVariable ["LRG_QS_ST_iconColor_WEST", _this];
    }
] call CBA_Settings_fnc_init;

// LRG_QS_ST_iconColor_RESISTANCE
[
    "LRG_QS_ST_iconColor_RESISTANCE",
    "COLOR",
    ["Icon Color - RESISTANCE", "Icon Color for any Resistance units."],
    "LRG QS Icons",
    [0,0.5,0,0.65],
    true,
    {  
       uiNamespace setVariable ["LRG_QS_ST_iconColor_RESISTANCE", _this];
    }
] call CBA_Settings_fnc_init;

// LRG_QS_ST_iconColor_CIVILIAN
[
    "LRG_QS_ST_iconColor_CIVILIAN",
    "COLOR",
    ["Icon Color - CIVILIAN", "Icon Color for any Civilian units."],
    "LRG QS Icons",
    [0.4,0,0.5,0.65],
    true,
    {  
       uiNamespace setVariable ["LRG_QS_ST_iconColor_CIVILIAN", _this];
    }
] call CBA_Settings_fnc_init;

// LRG_QS_ST_iconColor_UNKNOWN
[
    "LRG_QS_ST_iconColor_UNKNOWN",
    "COLOR",
    ["Icon Color - UNKNOWN", "Icon Color for any Unknown units."],
    "LRG QS Icons",
    [0.7,0.6,0,0.5],
    true,
    {  
       uiNamespace setVariable ["LRG_QS_ST_iconColor_UNKNOWN", _this];
    }
] call CBA_Settings_fnc_init;

// LRG_QS_ST_MedicalIconColor
[
    "LRG_QS_ST_MedicalIconColor",
    "COLOR",
    ["Icon Color - Medical", "Color of medical icons."],
    "LRG QS Icons",
    [1,0.41,0,1],
    true,
    {  
       uiNamespace setVariable ["LRG_QS_ST_MedicalIconColor", _this];
    }
] call CBA_Settings_fnc_init;

// LRG_QS_ST_colorInjured
[
    "LRG_QS_ST_colorInjured",
    "COLOR",
    ["Icon Color - Wounded", "Color of Wounded icons."],
    "LRG QS Icons",
    [0.75,0.55,0,0.75],
    true,
    {  
       uiNamespace setVariable ["LRG_QS_ST_colorInjured", _this];
    }
] call CBA_Settings_fnc_init;