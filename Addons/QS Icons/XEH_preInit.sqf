// Master Enable
[
    "LRG_QSIcons_MasterEnable",
    "CHECKBOX",
    ["QS Icons Master Enable", "Turn ON/OFF QS Icons function."],
    "LRG QS Icons",
    false,
    true,
    {  

    }
] call CBA_Settings_fnc_init;

// Enable Map Icons
[
    "LRG_QSIcons_Map_EnableUnitIcons",
    "CHECKBOX",
    ["Map Icons Enable", "Enable MAP unit/vehicle Icons."],
    "LRG QS Icons",
    true,
    true,
    {  

    }
] call CBA_Settings_fnc_init;

// Icon Refresh Rate
[
    "LRG_QSIcons_Map_Delay",
    "SLIDER",
    ["Map Icons Refresh Rate", "How often should location of unit on the MAP be updated in seconds?"],
    "LRG QS Icons",
    [0, 300, 60, 0],
    true,
    {  

    }
] call CBA_Settings_fnc_init;


// Enable GPS Icons
[
    "LRG_QSIcons_GPS_EnableUnitIcons",
    "CHECKBOX",
    ["GPS Icons Enable", "Enable GPS unit/vehicle Icons."],
    "LRG QS Icons",
    true,
    true,
    {  

    }
] call CBA_Settings_fnc_init;

// GPS Range
[
    "LRG_QSIcons_GPS_Range",
    "SLIDER",
    ["GPS Icons Range", "Distance from player that units shown on GPS. Higher number = lower script performance."],
    "LRG QS Icons",
    [0, 500, 300, 0],
    true,
    {  

    }
] call CBA_Settings_fnc_init;

// Enable GPS Icons
[
    "LRG_QSIcons_GPS_ShowNames",
    "CHECKBOX",
    ["GPS Icons Names", "TRUE to show unit names on the GPS display."],
    "LRG QS Icons",
    false,
    true,
    {  

    }
] call CBA_Settings_fnc_init;

// Enable GPS Group Only
[
    "LRG_QSIcons_GPS_GroupOnly",
    "CHECKBOX",
    ["GPS Icons Group Only", "TRUE to show ONLY group members on the GPS display."],
    "LRG QS Icons",
    false,
    true,
    {  

    }
] call CBA_Settings_fnc_init;

// Enable Group Map
[
    "LRG_QSIcons_Group_Map",
    "CHECKBOX",
    ["Group Map Enable", "Group icons displayed on map."],
    "LRG QS Icons",
    false,
    true,
    {  

    }
] call CBA_Settings_fnc_init;

// Enable Group HUD
[
    "LRG_QSIcons_Group_HUD",
    "CHECKBOX",
    ["Group HUD Enable", "Group icons displayed on player 3D HUD."],
    "LRG QS Icons",
    false,
    true,
    {  

    }
] call CBA_Settings_fnc_init;

// Medical System
[
    "LRG_QSIcons_MedicalSystem",
    "LIST",
    ["Medical System", "Used to ensure QS Icons are used with a predefined medical system."],
    "LRG QS Icons",
    [[0, 1, 2, 3, 4, 5], [
        ["BIS", "BIS Revive."],
        ["BTC", "BTC Revive."],
        ["AIS", "AIS Revive."],
        ["ACE", "@ACE 3 Revive."],
        ["FAR", "Farooq's Revive."],
        ["AWS", "A3 Wounding System by Psycho."]
    ], 3],
    true,
    {  
        params ["_value"];
        call {
            if (_value IsEqualTo 0) exitwith {LRG_QSIcons_MedicalSystem = ['BIS'];};
            if (_value IsEqualTo 1) exitwith {LRG_QSIcons_MedicalSystem = ['BTC'];};
            if (_value IsEqualTo 2) exitwith {LRG_QSIcons_MedicalSystem = ['AIS'];};
            if (_value IsEqualTo 3) exitwith {LRG_QSIcons_MedicalSystem = ['ACE'];};
            if (_value IsEqualTo 4) exitwith {LRG_QSIcons_MedicalSystem = ['FAR'];};
            if (_value IsEqualTo 5) exitwith {LRG_QSIcons_MedicalSystem = ['AWS'];};
            LRG_QSIcons_MedicalSystem = ['BIS'];
        };
    }
] call CBA_Settings_fnc_init;




// Icon Text Fonts
[
    "LRG_QSIcons_IconTextFonts",
    "LIST",
    ["Icon Text Fonts", "Icon Text Font."],
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
    ], 0],
    true,
    {  
        params ["_value"];
        call {
            if (_value IsEqualTo 0) exitwith {LRG_QSIcons_IconTextFonts = ['EtelkaMonospacePro'];};
            if (_value IsEqualTo 1) exitwith {LRG_QSIcons_IconTextFonts = ['EtelkaMonospaceProBold'];};
            if (_value IsEqualTo 2) exitwith {LRG_QSIcons_IconTextFonts = ['EtelkaNarrowMediumPro'];};
            if (_value IsEqualTo 3) exitwith {LRG_QSIcons_IconTextFonts = ['LucidaConsoleB'];};
            if (_value IsEqualTo 4) exitwith {LRG_QSIcons_IconTextFonts = ['PuristaBold'];};
            if (_value IsEqualTo 5) exitwith {LRG_QSIcons_IconTextFonts = ['PuristaLight'];};
            if (_value IsEqualTo 6) exitwith {LRG_QSIcons_IconTextFonts = ['puristaMedium'];};
            if (_value IsEqualTo 7) exitwith {LRG_QSIcons_IconTextFonts = ['PuristaSemibold'];};
            if (_value IsEqualTo 8) exitwith {LRG_QSIcons_IconTextFonts = ['TahomaB'];};

            LRG_QSIcons_IconTextFonts = ['TahomaB'];
        };
    }
] call CBA_Settings_fnc_init;

// Icon Color - EAST
[
    "LRG_QSIcons_IconColor_East",
    "COLOR",
    ["Icon Color - EAST", "Icon Color for any East units."],
    "LRG QS Icons",
    [0.5,0,0,0.65],
    true,
    {  

    }
] call CBA_Settings_fnc_init;

// Icon Color - WEST
[
    "LRG_QSIcons_IconColor_West",
    "COLOR",
    ["Icon Color - WEST", "Icon Color for any West units."],
    "LRG QS Icons",
    [0,0.3,0.6,0.65],
    true,
    {  

    }
] call CBA_Settings_fnc_init;

// Icon Color - Resistance
[
    "LRG_QSIcons_IconColor_Resistance",
    "COLOR",
    ["Icon Color - RESISTANCE", "Icon Color for any Resistance units."],
    "LRG QS Icons",
    [0,0.5,0,0.65],
    true,
    {  

    }
] call CBA_Settings_fnc_init;

// Icon Color - Civilian
[
    "LRG_QSIcons_IconColor_Civilian",
    "COLOR",
    ["Icon Color - CIVILIAN", "Icon Color for any Civilian units."],
    "LRG QS Icons",
    [0.4,0,0.5,0.65],
    true,
    {  

    }
] call CBA_Settings_fnc_init;

// Icon Color - Unknown
[
    "LRG_QSIcons_IconColor_Unknown",
    "COLOR",
    ["Icon Color - UNKNOWN", "Icon Color for any Unknown units."],
    "LRG QS Icons",
    [0.7,0.6,0,0.5],
    true,
    {  

    }
] call CBA_Settings_fnc_init;

// Icon Color - Medical
[
    "LRG_QSIcons_IconColor_Medical",
    "COLOR",
    ["Icon Color - Medical", "Color of medical icons."],
    "LRG QS Icons",
    [1,0.41,0,1],
    true,
    {  

    }
] call CBA_Settings_fnc_init;

// Icon Color - Wounded
[
    "LRG_QSIcons_IconColor_Wounded",
    "COLOR",
    ["Icon Color - Wounded", "Color of Wounded icons."],
    "LRG QS Icons",
    [0.75,0.55,0,0.75],
    true,
    {  

    }
] call CBA_Settings_fnc_init;