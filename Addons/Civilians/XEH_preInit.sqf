// AISpawns Modules

[
    "LRG_Civilians_enableGestures",
    "CHECKBOX",
    ["Enable Gestures", "Enable Civilian interactions using gestures. If this is disabled, all other settings below have no effect."],
    "LRG Civilians",
    true,
    true,
    {
        params ["_value"];
        if (!_value) exitWith {};

        call LR_fnc_initCivilianGestures;
    }
] call CBA_Settings_fnc_init;

[
    "LRG_Civilians_enableStopGestures",
    "CHECKBOX",
    ["Enable Stop Gestures", "Enables stopping civilians using the appropriate gestures."],
    "LRG Civilians",
    true,
    true,
    {}
] call CBA_Settings_fnc_init;

[
    "LRG_Civilians_enableGoAwayGestures",
    "CHECKBOX",
    ["Enable Go Away Gestures", "Enables ordering civilians to Go Away using the appropriate gestures."],
    "LRG Civilians",
    true,
    true,
    {}
] call CBA_Settings_fnc_init;

[
    "LRG_Civilians_enableGetDownGestures",
    "CHECKBOX",
    ["Enable Get Down Gestures", "Enables ordering civilians to Get Down using the appropriate gestures."],
    "LRG Civilians",
    true,
    true,
    {}
] call CBA_Settings_fnc_init;

[
    "LRG_Civilians_enableFollowGestures",
    "CHECKBOX",
    ["Enable Follow Gestures", "Enables ordering civilians to follow using the appropriate gestures."],
    "LRG Civilians",
    true,
    true,
    {}
] call CBA_Settings_fnc_init;

[
    "LRG_Civilians_enableGreetingGestures",
    "CHECKBOX",
    ["Enable Greeting Gestures", "Enables greeting civilians using the appropriate gestures."],
    "LRG Civilians",
    true,
    true,
    {}
] call CBA_Settings_fnc_init;

[
    "LRG_Civilians_successChance_unarmed",
    "SLIDER",
    ["Success Chance (Unarmed)", "Chance of success if the player gesturing is currently unarmed."],
    "LRG Civilians",
    [0,1,0.8,2,true],
    true,
    {}
] call CBA_Settings_fnc_init;

[
    "LRG_Civilians_successChance_armed",
    "SLIDER",
    ["Success Chance (Armed)", "Chance of success if the player gesturing is currently armed."],
    "LRG Civilians",
    [0,1,0.5,2,true],
    true,
    {}
] call CBA_Settings_fnc_init;
