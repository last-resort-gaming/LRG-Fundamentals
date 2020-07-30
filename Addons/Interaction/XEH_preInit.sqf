// Creator Actions
[
    "LRG_CreatorActions_Master",
    "CHECKBOX",
    ["Enable Creator Actions", "Show/Hide Creator Actions in ACE Self Interaction Menu"],
    "LRG Creator Actions",
    true,
    true,
    {
		if !(isClass (configFile >> "CfgPatches" >> "ace_main")) exitWith {};
        if (_this && { hasinterface }) then  {call LR_fnc_InitCreatorActions};
    }
] call CBA_Settings_fnc_init;

[
    "LRG_CreatorActions_Channels",
    "CHECKBOX",
    ["Enable Channel Actions", "Add Creator Actions to enable/disable channels"],
    "LRG Creator Actions",
    true,
    true,
    {
		if !(isClass (configFile >> "CfgPatches" >> "ace_main")) exitWith {};
        if (_this && { isServer }) then  {call LR_fnc_InitChannelActions};
    }
] call CBA_Settings_fnc_init;

/*
[
    "LRG_CreatorActions_MarkerSaving",
    "CHECKBOX",
    ["Enable SaveMarkers", "Add Creator Actions to save/load markers"],
    "LRG Creator Actions",
    true,
    true,
    {
		if !(isClass (configFile >> "CfgPatches" >> "ace_main")) exitWith {};
        if (_this && { hasinterface }) then  {
			[
				"SaveMarkers",
				"Save/Load Markers",
				"",
				{[] call LR_MI_fnc_openDialog;},
				{LRG_Main_MapIcons}
			] call LR_fnc_addCreatorAction;
		};
    }
] call CBA_Settings_fnc_init;
*/ // broken as fuck, crashes the game...

[
    "LRG_CreatorActions_EndMission",
    "CHECKBOX",
    ["Enable EndMission", "Add Creator Actions to end the mission and return players to the lobby"],
    "LRG Creator Actions",
    true,
    true,
    {
		if !(isClass (configFile >> "CfgPatches" >> "ace_main")) exitWith {};
        if (_this && { isServer }) then  {
			[
				"EndMissionSuccess",
				"<t color='#00ff00'>Mission Success</t>",
				"",
				{["EveryoneWins"] remoteExec ["BIS_fnc_endMissionServer", 2]},
				{true}
			] call LR_fnc_addCreatorAction;

			[
				"EndMissionFail",
				"<t color='#ff0000'>Mission Failure</t>",
				"",
				{["EveryoneLost"] remoteExec ["BIS_fnc_endMissionServer", 2]},
				{true}
			] call LR_fnc_addCreatorAction;
		};
    }
] call CBA_Settings_fnc_init;