/*
Function: LR_fnc_InitCreatorActions

Description:
	This functions initializes the creator action system which allows mission
	creators to execute predefined functions/commands in (or, in general, 
	interact with) the live mission.

	Actions added using the function LR_fnc_AddCreatorAction can be executed at
	any point in time after it was added. If ACE is in use the actions are added
	directly to the self-actions, otherwise the mouse-wheel interaction menu is
	used.

	Executed during postInit, don't call directly!

Parameters:
	None

Return Values:
	None

Examples:
    Nothing to see here

Author:
	Mokka
*/
if (isNil "LRG_Main_Master") exitwith {};
if (not LRG_Main_Master) exitWith{};

if (isNil "LRG_Main_CreatorActions") exitwith {};
if (not LRG_Main_CreatorActions) exitWith{};

CreatorActions = [];
if ((!hasInterface) || !(player getUnitTrait "Mission Maker")) exitWith {};

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

		_addedActions = player getVariable ["addedActions", []];

		{
			_x params ["_title", "_name", "_statement", "_args"];
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
		} forEach _actions;

		player setVariable ["addedActions", _addedActions];
	};
} else {
	"CreatorActions" addPublicVariableEventHandler {
		params ["_variable", "_actions"];

		_addedActions = player getVariable ["addedActions", []];

		{
			_x params ["_title", "_name", "_statement", "_args"];
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
		} forEach _actions;

		player setVariable ["addedActions", _addedActions];
	};
};

publicVariable "CreatorActions";