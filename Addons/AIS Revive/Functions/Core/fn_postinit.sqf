
systemchat "Postinit called";
LRG_AIS_MASTER_ENABLE = uiNamespace getVariable ["LRG_AIS_MASTER_ENABLE", false];
if (isNil "LRG_AIS_MASTER_ENABLE") exitwith {};
if (not LRG_AIS_MASTER_ENABLE) exitWith{};
systemchat "Master Accepted";

if (isClass (configFile >> "CfgPatches" >> "ace_main")) exitWith {["AIS: AIS shutdown itself cause ACE mod was detected. ACE and AIS cant work at the same time."] call BIS_fnc_logFormat};
systemchat "ACE Not Detected";

LRG_AIS_REVIVE_INIT_UNITS = uiNamespace getVariable ["LRG_AIS_REVIVE_INIT_UNITS", "allPlayables"];
LRG_AIS_MEDICAL_EDUCATION = uiNamespace getVariable ["LRG_AIS_MEDICAL_EDUCATION", 2];
LRG_AIS_DAMAGE_TOLLERANCE_FACTOR = uiNamespace getVariable ["LRG_AIS_DAMAGE_TOLLERANCE_FACTOR", 1];
LRG_AIS_BLEEDOUT_TIME = uiNamespace getVariable ["LRG_AIS_BLEEDOUT_TIME", 400];
LRG_AIS_BLEEDOUT_MULTIPLIER = uiNamespace getVariable ["LRG_AIS_BLEEDOUT_MULTIPLIER", 1];
LRG_AIS_REVIVETIME = uiNamespace getVariable ["LRG_AIS_REVIVETIME", 20];
LRG_AIS_STABILIZETIME = uiNamespace getVariable ["LRG_AIS_STABILIZETIME", 15];
LRG_AIS_REVIVE_HEAL = uiNamespace getVariable ["LRG_AIS_REVIVE_HEAL", true];
LRG_AIS_AI_HELP_RADIUS = uiNamespace getVariable ["LRG_AIS_AI_HELP_RADIUS", 100];
LRG_AIS_DISABLE_RESPAWN_BUTTON = uiNamespace getVariable ["LRG_AIS_DISABLE_RESPAWN_BUTTON", 30];
LRG_AIS_CONSUME_FAKS = uiNamespace getVariable ["LRG_AIS_CONSUME_FAKS", true];
LRG_AIS_REQUIRE_MEDIKIT = uiNamespace getVariable ["LRG_AIS_REQUIRE_MEDIKIT", true];
LRG_AIS_RESTORE_LOADOUT = uiNamespace getVariable ["LRG_AIS_RESTORE_LOADOUT", true];
LRG_AIS_ACTION_DISTANCE = uiNamespace getVariable ["LRG_AIS_ACTION_DISTANCE", 6];
LRG_AIS_REVIVE_GUARANTY = uiNamespace getVariable ["LRG_AIS_REVIVE_GUARANTY", true];
LRG_AIS_TOGGLE_RADIO = uiNamespace getVariable ["LRG_AIS_TOGGLE_RADIO", true];
LRG_AIS_NO_CHAT = uiNamespace getVariable ["LRG_AIS_NO_CHAT", true];
LRG_AIS_SHOW_UNC_MARKERS = uiNamespace getVariable ["LRG_AIS_SHOW_UNC_MARKERS", false];
LRG_AIS_SHOW_UNC_MESSAGE_TO = uiNamespace getVariable ["LRG_AIS_SHOW_UNC_MESSAGE_TO", "None"];
LRG_AIS_SHOW_UNC_3D_MARKERS = uiNamespace getVariable ["LRG_AIS_SHOW_UNC_3D_MARKERS", true];
LRG_AIS_IMPACT_EFFECTS = uiNamespace getVariable ["LRG_AIS_IMPACT_EFFECTS", true];
LRG_AIS_SHOW_COUNTDOWN = uiNamespace getVariable ["LRG_AIS_SHOW_COUNTDOWN", true];
LRG_AIS_SHOW_DIARYINFO = uiNamespace getVariable ["LRG_AIS_SHOW_DIARYINFO", true];
LRG_AIS_MEDEVAC_STATIONS = uiNamespace getVariable ["LRG_AIS_MEDEVAC_STATIONS", []];

//#include "..\AIS_SETUP.sqf"

if (isServer) then {
	private _allPlayers = allUnits select {isPlayer _x};	// doesn't use allPlayers at this point, cause it can be delayed in self-hosted env.

	private _ais_revive_units = toLower LRG_AIS_REVIVE_INIT_UNITS;
	private _init_units = call {
		if (_ais_revive_units isEqualTo "allunits") exitWith {allUnits};
		if (_ais_revive_units isEqualTo "allplayers") exitWith {_allPlayers};	// at this point only as a dummy. Cause everytime every player will auto-init, regardless what the setup will say.
		if (_ais_revive_units isEqualTo "allplayables") exitWith {if (isMultiplayer) then {playableUnits} else {switchableUnits}};
		if (_ais_revive_units isEqualTo "allunitsblufor") exitWith {allUnits select {(side _x) isEqualTo blufor}};
		if (_ais_revive_units isEqualTo "allunitsopfor") exitWith {allUnits select {(side _x) isEqualTo opfor}};
		if (_ais_revive_units isEqualTo "allunitsindfor") exitWith {allUnits select {(side _x) isEqualTo resistance}};
		if (_ais_revive_units isEqualTo "allunitscivilian") exitWith {allUnits select {(side _x) isEqualTo civilian}};
		diag_log "AIS ERROR: Issue in Setup-File found! Parameter AIS_REVIVE_UNITS wrong defined."; []
	};

	// run the init for all units present by game/mission start
	_init_units = _init_units - _allPlayers;
	//diag_log format ["ais init units: %1", _init_units];
	if (count _init_units > 0) then {
		{
			[_x] call LRG_AIS_Core_fnc_aisInitHost;
			true
		} count _init_units;
	};
	
	addMissionEventHandler ["HandleDisconnect", {_this call LRG_AIS_Core_fnc_handleDisconnect}];
};

if (isNil "LRG_AIS_MEDEVAC_STATIONS") then {
	LRG_AIS_MEDEVAC_STATIONS = [];
} else {
	if !(LRG_AIS_MEDEVAC_STATIONS isEqualType []) then {
		LRG_AIS_MEDEVAC_STATIONS = [];
		["AIS: LRG_AIS_MEDEVAC_STATIONS wasnt defined in the correct way."] call BIS_fnc_logFormat;
	};
};

if (isDedicated || !hasInterface) exitWith {};

// This is needed to provide a player object for zeus controlled units. Important to ensure that player is not null here (which is done in autoload).
AIS_Core_realPlayer = player;
AIS_Core_realPlayer call LRG_AIS_Core_fnc_aisInitPlayer;
AIS_Core_realSide = getNumber (configfile >> "CfgVehicles" >> (typeOf AIS_Core_realPlayer) >> "side");

[{
    // There is no command to get the current player but BI has an variable in mission namespace we can use.
	private _currentPlayer = missionNameSpace getVariable ["bis_fnc_moduleRemoteControl_unit", player];	// Psycho: isNull until a unit is remote controlled
    
    // If the player changed we trigger an event and update the global variable.
    if (AIS_Core_realPlayer != _currentPlayer) then {
		removeAllActions AIS_Core_realPlayer;
		AIS_Core_realPlayer enableAI "TEAMSWITCH";
		
        ["AIS_playerChanged", [_currentPlayer, AIS_Core_realPlayer]] call LRG_AIS_Core_fnc_triggerEvent;
		
        AIS_Core_realPlayer = _currentPlayer;
		AIS_Core_realSide = getNumber (configfile >> "CfgVehicles" >> (typeOf AIS_Core_realPlayer) >> "side");
    };
}] call LRG_AIS_Core_fnc_onEachFrame;

true call LRG_AIS_Core_fnc_Interaction_loop;

if (LRG_AIS_SHOW_DIARYINFO) then {
	call LRG_AIS_System_fnc_diary;
};

true spawn {
	waitUntil {time > 0};
	ais_3d = addMissionEventHandler ["Draw3D", {_this call LRG_AIS_Effects_fnc_draw3D}];
};