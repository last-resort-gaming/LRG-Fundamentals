// Reporting AI
[
    "LRG_AI_Reporting",
    "CHECKBOX",
    ["Spawn Reporting", "Receive a systemchat message for any groups or vehicles that fail to spawn."],
    "LRG AI",
    false,
    true,
    {

    }
] call CBA_Settings_fnc_init;

// Set DynSim
[
    "LRG_AI_DynSim",
    "CHECKBOX",
    ["Set Dynamic Simulation", "If enabled, all units in the mission file and all new units placed by Zeus and Spawn AI will automatically have Dynamic Simulation turned on."],
    "LRG AI",
    true,
    true,
    {}
] call CBA_Settings_fnc_init;

// Initial AI
[
    "LRG_AI_InitialAI",
    "CHECKBOX",
    ["Apply AI Skill", "This will automatically apply the below skills to AI Spawns and Zeus-placed AI. If enabled, it will also apply them to any Editor placed AI at mission start."],
    "LRG AI",
    true,
    true,
    {
        if (_this && { isserver }) then  { call LR_fnc_SetInitialAI};
    }
] call CBA_Settings_fnc_init;

// AI Aiming Accuracy
[
    "LRG_AI_AimingAccuracy",
    "SLIDER",
    ["Min Aiming Accuracy", "Higher value means the AI will be more likely to hit the target."],
    "LRG AI",
    [0, 1, 0.10, 2, true],
    true,
    {

    }
] call CBA_Settings_fnc_init;

// AI Aiming Shake
[
    "LRG_AI_AimingShake",
    "SLIDER",
    ["Min Aiming Shake", "Higher value means the AI will be more precise."],
    "LRG AI",
    [0, 1, 0.45, 2, true],
    true,
    {

    }
] call CBA_Settings_fnc_init;

// AI Aiming Speed
[
    "LRG_AI_AimingSpeed",
    "SLIDER",
    ["Min Aiming Speed", "Higher value means the AI can rotate and stabilize its aim faster."],
    "LRG AI",
    [0, 1, 0.30, 2, true],
    true,
    {

    }
] call CBA_Settings_fnc_init;

// AI Commanding
[
    "LRG_AI_Commanding",
    "SLIDER",
    ["Commanding", "Higher value means the AI can report targets faster."],
    "LRG AI",
    [0, 1, 1.00, 2, true],
    true,
    {

    }
] call CBA_Settings_fnc_init;

// AI Courage
[
    "LRG_AI_Courage",
    "SLIDER",
    ["Courage", "Higher value means the AI is less likely to flee."],
    "LRG AI",
    [0, 1, 1.00, 2, true],
    true,
    {

    }
] call CBA_Settings_fnc_init;

// AI General
[
    "LRG_AI_General",
    "SLIDER",
    ["General", "Higher value improves the AI's decision making and general ability."],
    "LRG AI",
    [0, 1, 1.00, 2, true],
    true,
    {

    }
] call CBA_Settings_fnc_init;

// AI Min Reload Speed
[
    "LRG_AI_ReloadSpeed",
    "SLIDER",
    ["Min Reload Speed", "Higher value means the AI can switch or reload weapons faster."],
    "LRG AI",
    [0, 1, 0.50, 2, true],
    true,
    {

    }
] call CBA_Settings_fnc_init;

// AI Min Spot Distance
[
    "LRG_AI_SpotDistance",
    "SLIDER",
    ["Min Spot Distance", "Higher value means the AI is better at spotting targets."],
    "LRG AI",
    [0, 1, 0.40, 2, true],
    true,
    {

    }
] call CBA_Settings_fnc_init;

// AI Min Spot Time
[
    "LRG_AI_SpotTime",
    "SLIDER",
    ["Min Spot Time", "Higher value means the AI will react faster to death, damage or enemies."],
    "LRG AI",
    [0, 1, 0.20, 2, true],
    true,
    {

    }
] call CBA_Settings_fnc_init;

// CivAI Courage
[
    "LRG_AI_CivCourage",
    "SLIDER",
    ["Civilian Courage", "Higher value means the AI is less likely to flee. Only applies to Civilian units!"],
    "LRG AI",
    [0, 1,1, 2, true],
    true,
    {

    }
] call CBA_Settings_fnc_init;

// CivAI Fleeing
[
    "LRG_AI_CivFleeing",
    "CHECKBOX",
    ["Civilian Fleeing", "Prevent Civilian units from fleeing."],
    "LRG AI",
    false,
    true,
    {

    }
] call CBA_Settings_fnc_init;