// not documented: postInit
if !(hasInterface && (isClass (configFile >> "CfgPatches" >> "ace_main"))) exitWith {};

LRG_ActionIDs = [];

_action = [
	"CreatorActions",
	"Mission Creator Actions",
	"",
	{diag_log "running parent action"},
	{_player getUnitTrait "Mission Maker"}
] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;
[["ACE_ZeusActions"], _action] call ACE_interact_menu_fnc_addActionToZeus;

["LRG_RegisterCreatorAction", {
	params ["_action", "_actionPath", "_actionName"];

	if (_actionName in LRG_ActionIDs) exitWith {};

	[player, 1, ["ACE_SelfActions", "CreatorActions"] + _actionPath, _action] call ace_interact_menu_fnc_addActionToObject;
	[["ACE_ZeusActions", "CreatorActions"] + _actionPath, _action] call ACE_interact_menu_fnc_addActionToZeus;

	LRG_ActionIDs pushBack _actionName;
}] call CBA_fnc_addEventHandler;
