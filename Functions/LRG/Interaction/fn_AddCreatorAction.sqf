/*
Function: LR_fnc_AddCreatorAction

Description:
	Adds an action for the mission creator that allows executing code/functions
	during the live mission.

Parameters:
	_title - The globally unique identifier of the action
	_name - The name of the action as shown to players
	_statement - The code executed upon calling the action, the following params are available: [_target, _caller, _args]
	_args - Arguments for the statement script

Return Values:
	None

Examples:
    --- Code
	[
		"MissionStart",
		"Start Mission",
		{hint "Mission started!";},
		[]
	] call LR_fnc_AddCreatorAction;
	---

Author:
	Mokka
*/

if (!isServer) exitWith {
	_this remoteExec ["LR_fnc_AddCreatorAction", 2];
};

params ["_title", "_name", "_statement", "_args"];

CreatorActions pushBackUnique [_title, _name, _statement, _args];
publicVariable "CreatorActions";

/* // Remove from production code
// Stuff for single-player testing, since publicVariable EH does not fire on the
// machine where the broadcast happened (and in testing server == creator...)
if ((!isMultiplayer) || ((count allPlayers) == 1)) then {
	if (isClass (configFile >> "CfgPatches" >> "ace_main")) then {
		_addedActions = player getVariable ["addedActions", []];

		if !(_title in _addedActions) then {

			_action = [
				_title,
				_name,
				"",
				_statement,
				{true},
				{},
				_args
			] call ace_interact_menu_fnc_createAction;

			[player, 1, ["ACE_SelfActions", "CreatorAction"], _action] call ace_interact_menu_fnc_addActionToObject;
		};

		_addedActions pushBackUnique _title;
		player setVariable ["addedActions", _addedActions];
	} else {
		_addedActions = player getVariable ["addedActions", []];

		if !(_title in _addedActions) then {

			player addAction [
				_name,
				_statement,
				_args,
				1.5,
				false,
				true,
				"",
				"true"
			];
		};

		_addedActions pushBackUnique _title;
		player setVariable ["addedActions", _addedActions];
	};
};
*/