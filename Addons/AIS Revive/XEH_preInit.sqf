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
    false,
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
        ["Medics Only", "Medics Only."]
    ], 2],
    true,
    {  
       uiNamespace setVariable ["LRG_AIS_MEDICAL_EDUCATION", _this];
    }
] call CBA_Settings_fnc_init;

// LRG_AIS_DAMAGE_TOLLERANCE_FACTOR
[
    "LRG_AIS_DAMAGE_TOLLERANCE_FACTOR",
    "SLIDER",
    ["Damage Tolerance", "Higher value means a unit will take more damage before dying."],
    "LRG AIS Revive",
    [0.1, 5, 1, 2],
    true,
    {
       uiNamespace setVariable ["LRG_AIS_DAMAGE_TOLLERANCE_FACTOR", _this];
    }
] call CBA_Settings_fnc_init;

// LRG_AIS_BLEEDOUT_TIME
[
    "LRG_AIS_BLEEDOUT_TIME",
    "SLIDER",
    ["Bleedout Time", " Basic time before a unit dies after taking damage. This time is affected by damage taken."],
    "LRG AIS Revive",
    [30, 1200, 400, 0],
    true,
    {
       uiNamespace setVariable ["LRG_AIS_BLEEDOUT_TIME", _this];
    }
] call CBA_Settings_fnc_init;

// LRG_AIS_BLEEDOUT_MULTIPLIER
[
    "LRG_AIS_BLEEDOUT_MULTIPLIER",
    "SLIDER",
    ["Bleedout Multiplier", "Used to multiply the Bleedout Time defined above. AIS ¯\_(ツ)_/¯ "],
    "LRG AIS Revive",
    [0, 5, 1, 0],
    true,
    {
       uiNamespace setVariable ["LRG_AIS_BLEEDOUT_MULTIPLIER", _this];
    }
] call CBA_Settings_fnc_init;

// LRG_AIS_REVIVETIME
[
    "LRG_AIS_REVIVETIME",
    "SLIDER",
    ["Revive Time", " The time taken to revive a downed unit."],
    "LRG AIS Revive",
    [1, 120, 20, 0],
    true,
    {
       uiNamespace setVariable ["LRG_AIS_REVIVETIME", _this];
    }
] call CBA_Settings_fnc_init;

// LRG_AIS_STABILIZETIME
[
    "LRG_AIS_STABILIZETIME",
    "SLIDER",
    ["Stabilize Time", " The time taken to stabilize a downed unit."],
    "LRG AIS Revive",
    [1, 120, 15, 0],
    true,
    {
       uiNamespace setVariable ["LRG_AIS_STABILIZETIME", _this];
    }
] call CBA_Settings_fnc_init;

// LRG_AIS_REVIVE_HEAL
[
    "LRG_AIS_REVIVE_HEAL",
    "CHECKBOX",
    ["Full Heal After Revive", "If True, unit will be fully healed after being revived."],
    "LRG AIS Revive",
    true,
    true,
    {  
       uiNamespace setVariable ["LRG_AIS_REVIVE_HEAL", _this];
    }
] call CBA_Settings_fnc_init;

// LRG_AIS_AI_HELP_RADIUS
[
    "LRG_AIS_AI_HELP_RADIUS",
    "SLIDER",
    ["AI Help Radius", " Radius AI will travel to heal an allied unit."],
    "LRG AIS Revive",
    [0, 200, 100, 0],
    true,
    {
       uiNamespace setVariable ["LRG_AIS_AI_HELP_RADIUS", _this];
    }
] call CBA_Settings_fnc_init;

// LRG_AIS_DISABLE_RESPAWN_BUTTON
[
    "LRG_AIS_DISABLE_RESPAWN_BUTTON",
    "SLIDER",
    ["Disable Respawn Button Timer", " How long the respawn button will be disabled after going unconscious."],
    "LRG AIS Revive",
    [0, 1200, 30, 0],
    true,
    {
       uiNamespace setVariable ["LRG_AIS_DISABLE_RESPAWN_BUTTON", _this];
    }
] call CBA_Settings_fnc_init;

// LRG_AIS_CONSUME_FAKS
[
    "LRG_AIS_CONSUME_FAKS",
    "CHECKBOX",
    ["Consume FAK on use", "If True, FAKs are consumed on successful heal."],
    "LRG AIS Revive",
    true,
    true,
    {  
       uiNamespace setVariable ["LRG_AIS_CONSUME_FAKS", _this];
    }
] call CBA_Settings_fnc_init;

// LRG_AIS_REQUIRE_MEDIKIT
[
    "LRG_AIS_REQUIRE_MEDIKIT",
    "CHECKBOX",
    ["Medkit Required", "If True, Medkits are required to heal units."],
    "LRG AIS Revive",
    true,
    true,
    {  
       uiNamespace setVariable ["LRG_AIS_REQUIRE_MEDIKIT", _this];
    }
] call CBA_Settings_fnc_init;

// LRG_AIS_RESTORE_LOADOUT
[
    "LRG_AIS_RESTORE_LOADOUT",
    "CHECKBOX",
    ["Restore Loadouts on Respawn", "If True, units will spawn with the gear they died with."],
    "LRG AIS Revive",
    true,
    true,
    {  
       uiNamespace setVariable ["LRG_AIS_RESTORE_LOADOUT", _this];
    }
] call CBA_Settings_fnc_init;

// LRG_AIS_ACTION_DISTANCE
[
    "LRG_AIS_ACTION_DISTANCE",
    "SLIDER",
    ["Interaction Distance", " Max distance for actions (such as drag, stabalise, and revive)."],
    "LRG AIS Revive",
    [0, 20, 6, 0],
    true,
    {
       uiNamespace setVariable ["LRG_AIS_ACTION_DISTANCE", _this];
    }
] call CBA_Settings_fnc_init;

// LRG_AIS_REVIVE_GUARANTY
[
    "LRG_AIS_REVIVE_GUARANTY",
    "CHECKBOX",
    ["Forced Unconscious Mode", "If True, unit will always go unconscious if hurt instead of dying."],
    "LRG AIS Revive",
    true,
    true,
    {  
       uiNamespace setVariable ["LRG_AIS_REVIVE_GUARANTY", _this];
    }
] call CBA_Settings_fnc_init;

// LRG_AIS_TOGGLE_RADIO
[
    "LRG_AIS_TOGGLE_RADIO",
    "CHECKBOX",
    ["Unconscious Raido Disable", "If True, downed units will be unable to use raidos."],
    "LRG AIS Revive",
    true,
    true,
    {  
       uiNamespace setVariable ["LRG_AIS_TOGGLE_RADIO", _this];
    }
] call CBA_Settings_fnc_init;

// LRG_AIS_NO_CHAT
[
    "LRG_AIS_NO_CHAT",
    "CHECKBOX",
    ["Unconscious Chat Disable", "If True, downed units will be unable to use chat."],
    "LRG AIS Revive",
    true,
    true,
    {  
       uiNamespace setVariable ["LRG_AIS_NO_CHAT", _this];
    }
] call CBA_Settings_fnc_init;


// LRG_AIS_SHOW_UNC_MARKERS
[
    "LRG_AIS_SHOW_UNC_MARKERS",
    "CHECKBOX",
    ["Unconscious Markers", "If True, injured units will show on the map."],
    "LRG AIS Revive",
    true,
    false,
    {  
       uiNamespace setVariable ["LRG_AIS_SHOW_UNC_MARKERS", _this];
    }
] call CBA_Settings_fnc_init;

// LRG_AIS_SHOW_UNC_MESSAGE_TO
[
    "LRG_AIS_SHOW_UNC_MESSAGE_TO",
    "LIST",
    ["Unconscious Message", "Who should see a message about an unconscious unit."],
    "LRG AIS Revive",
    [[0, 1, 2], [
        ["None", "None."],
        ["Group", "Group."],
        ["Side", "Side."]
    ], 0],
    true,
    {  
       uiNamespace setVariable ["LRG_AIS_SHOW_UNC_MESSAGE_TO", _this];
    }
] call CBA_Settings_fnc_init;

// LRG_AIS_SHOW_UNC_3D_MARKERS
[
    "LRG_AIS_SHOW_UNC_3D_MARKERS",
    "CHECKBOX",
    ["Unconscious 3D Markers", "If True, injured units will have a floating marker above their body to units close by."],
    "LRG AIS Revive",
    true,
    true,
    {  
       uiNamespace setVariable ["LRG_AIS_SHOW_UNC_3D_MARKERS", _this];
    }
] call CBA_Settings_fnc_init;

// LRG_AIS_SHOW_COUNTDOWN
[
    "LRG_AIS_SHOW_COUNTDOWN",
    "CHECKBOX",
    ["Unconscious Countdown", "If set to true, an unconscious unit will be able to see the bleed out timer."],
    "LRG AIS Revive",
    true,
    true,
    {  
       uiNamespace setVariable ["LRG_AIS_SHOW_COUNTDOWN", _this];
    }
] call CBA_Settings_fnc_init;

// LRG_AIS_IMPACT_EFFECTS
[
    "LRG_AIS_IMPACT_EFFECTS",
    "CHECKBOX",
    ["Suppression Effects", "If True, units will be effected by impacts."],
    "LRG AIS Revive",
    true,
    true,
    {  
       uiNamespace setVariable ["LRG_AIS_IMPACT_EFFECTS", _this];
    }
] call CBA_Settings_fnc_init;

// LRG_AIS_SHOW_DIARYINFO
[
    "LRG_AIS_SHOW_DIARYINFO",
    "CHECKBOX",
    ["Diary Info", "If set to true, a diary entry with some informations about the AIS (Credits, features, How to) is added."],
    "LRG AIS Revive",
    true,
    false,
    {  
       uiNamespace setVariable ["LRG_AIS_SHOW_DIARYINFO", _this];
    }
] call CBA_Settings_fnc_init;