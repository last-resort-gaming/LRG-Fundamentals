// not documented: postInit

CreatorActions = [];
if !(hasInterface && (player getUnitTrait "Mission Maker")) exitWith {};

if (isClass (configFile >> "CfgPatches" >> "ace_main")) then {

	_action = [
		"CreatorAction",
		"Mission Creator Actions",
		"",
		{diag_log "running parent action"},
		{true}
	] call ace_interact_menu_fnc_createAction;

	[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

	"CreatorActions" addPublicVariableEventHandler {
		params ["_variable", "_actions"];

		[_actions] call LR_fnc_RegisterCreatorActions;
	};
} else {
	"CreatorActions" addPublicVariableEventHandler {
		params ["_variable", "_actions"];

		[_actions] call LR_fnc_RegisterCreatorActions;
	};
};

[CreatorActions] call LR_fnc_RegisterCreatorActions;

publicVariable "CreatorActions";