// Vehicle Crew List
[
    "LRG_Main_VehicleCrewList",
    "CHECKBOX",
    ["Vehicle Crew List", "Shows a list of players in a vehicle."],
    "LRG Main",
    true,
    true,
    {  

    }
] call CBA_Settings_fnc_init;

// Map Icons
[
    "LRG_Main_MapIcons",
    "CHECKBOX",
    ["Map Icons", "Shows player locations on the map."],
    "LRG Main",
    true,
    true,
    {  

    }
] call CBA_Settings_fnc_init;

// PilotCheck
[
    "LRG_Main_PilotCheck",
    "CHECKBOX",
    ["Pilot Restrictions", "Restrict aircraft so only those with 'Pilot' Trait can fly."],
    "LRG Main",
    true,
    true,
    {  

    }
] call CBA_Settings_fnc_init;

// CH View Distance
[
    "LRG_Main_CHViewDistance",
    "CHECKBOX",
    ["CH View Distance", "Enable CHVD within LRG Fundamentals"],
    "LRG Main",
    true,
    true,
    {  

    }
] call CBA_Settings_fnc_init;

// CHVD - Max View Distance
[
    "LRG_Main_ViewDistanceMaxDistance",
    "SLIDER",
    ["CHVD - Max View Distance", "Max distance a player can set CHVD View Distance to."],
    "LRG Main",
    [5000, 15000, 10000, 0],
    true,
    {  

    }
] call CBA_Settings_fnc_init;

// CHVD - Max Object View Distance
[
    "LRG_Main_ViewDistanceMaxObjectDistance",
    "SLIDER",
    ["CHVD - Max Object View Distance", "Max distance a player can set CHVD Object View Distance to."],
    "LRG Main",
    [5000, 15000, 10000, 0],
    true,
    {  

    }
] call CBA_Settings_fnc_init;

// CHVD - Allow No Grass
[
    "LRG_Main_ViewDistanceNoGrass",
    "CHECKBOX",
    ["CHVD - Allow No Grass", "Should players be allowed to turn grass off?"],
    "LRG Main",
    false,
    true,
    {  

    }
] call CBA_Settings_fnc_init;

// Arsenal - Save/Load
[
    "LRG_Main_LRG_Main_ArsenalSaveLoad",
    "CHECKBOX",
    ["Arsenal - Save/Load", "Should a player be allowed to Save/Load Loadouts in the Arsenal?"],
    "LRG Main",
    false,
    true,
    {  

    }
] call CBA_Settings_fnc_init;

// Dynamic Weather
[
    "LRG_Main_DynamicWeather",
    "CHECKBOX",
    ["Dynamic Weather", "Enable/Disable randomised Weather."],
    "LRG Main",
    false,
    true,
    {  

    }
] call CBA_Settings_fnc_init;

// Dynamic Weather Start
[
    "LRG_Main_LRG_Main_DynamicWeatherStart",
    "LIST",
    ["Dynamic Weather - Start", "If Dynamic Weather enabled, what should the starting weather be?"],
    "LRG Main",
    [[0, 1, 2, 3], [
        ["Random", "Start with the Weather on a random setting."],
        ["Clear", "Start with the Weather Clear."],
        ["Cloudy", "Start with the Weather Cloudy."],
        ["Raining", "Start with the Weather Raining"]
    ], 0],
    true,
    {
        params ["_value"];
        call {
            if (_value IsEqualTo 0) exitwith {LRG_Main_LRG_Main_DynamicWeatherStart = "Random"};
            if (_value IsEqualTo 1) exitwith {LRG_Main_LRG_Main_DynamicWeatherStart = "Clear"};
            if (_value IsEqualTo 2) exitwith {LRG_Main_LRG_Main_DynamicWeatherStart = "Cloudy"};
            if (_value IsEqualTo 3) exitwith {LRG_Main_LRG_Main_DynamicWeatherStart = "Raining"};
            LRG_Main_LRG_Main_DynamicWeatherStart = "Random";
        };
    }
] call CBA_Settings_fnc_init;

// TFAR - Range Multiplyer
[
    "LRG_Main_LRG_Main_TFARTransmitRange",
    "SLIDER",
    ["TFAR - Range Multiplyer", "Increase or decrease max Transmit Range. 0.1 = poor range, 3.5 = All of Altis"],
    "LRG Main",
    [0, 5, 2.5, 1],
    true,
    {  

    }
] call CBA_Settings_fnc_init;

// TFAR - Terrain Interference
[
    "LRG_Main_LRG_Main_TFARTerrainInterference",
    "SLIDER",
    ["TFAR - Terrain Interference", "How much Terrain interferes with range. 0.1 = little impact, 2.0 = large impact."],
    "LRG Main",
    [0, 5, 1, 1],
    true,
    {  

    }
] call CBA_Settings_fnc_init;

// Cue Cards
[
    "LRG_Main_CueCards",
    "CHECKBOX",
    ["Cue Cards", "Show/Hide Cue Cards in ACE Self Interaction Menu."],
    "LRG Main",
    true,
    true,
    {  

    }
] call CBA_Settings_fnc_init;

// Diary Defaults
[
    "LRG_Main_Diary",
    "CHECKBOX",
    ["Diary Defaults", "Show/Hide Default LRG Diary Entries."],
    "LRG Main",
    true,
    true,
    {  

    }
] call CBA_Settings_fnc_init;

// Creator Actions
[
    "LRG_Main_CreatorActions",
    "CHECKBOX",
    ["Creator Actions", "Show/Hide Creator Actions in ACE Self Interaction Menu"],
    "LRG Main",
    true,
    true,
    {  

    }
] call CBA_Settings_fnc_init;

// Fatigue (Vanilla ONLY)
[
    "LRG_Main_LRG_Main_FatigueVanilla",
    "CHECKBOX",
    ["Fatigue (Vanilla ONLY)", "Enable/Disable Vanilla Fatigue System. Does not apply with @ACE."],
    "LRG Main",
    false,
    true,
    {  

    }
] call CBA_Settings_fnc_init;

// FPS Counter
[
    "LRG_Main_FPSCounter",
    "CHECKBOX",
    ["FPS Counter", "Show FPS counter of Player, Server & Headless Client on the map."],
    "LRG Main",
    true,
    true,
    {  

    }
] call CBA_Settings_fnc_init;