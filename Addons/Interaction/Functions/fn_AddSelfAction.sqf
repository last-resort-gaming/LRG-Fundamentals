/*
Function: LR_fnc_AddSelfAction

Description:
	Adds an action to a player. The action is added only to the clients on
	which the function was originally called. The action is only visible to the
	player(s) this function was called on.

	The condition has the following keywords available:

	_target - The object that the action is attached to
	_player - The player that is currently checked

	The keyword "_this" is reserved, don't use it in the condition string!

Arguments:
	_player - The player to which the action is added <UNIT>
	_id - The globally unique identifier of the action (used for ACE, JIP etc) <STRING>
	_title - The title of the action as shown to players <STRING>
	_statement - The code executed upon calling the action, the following params are available: [_target, _caller, _args] <CODE>
	_args - Arguments for the statement script (Optional), default: [] <ARRAY OF ANYTHING>
	_condition - Code in string which needs to be true for the action to show up, default: "true" <STRING>
	_removeCompleted - Remove the action after it has been completed/called, default: true <BOOLEAN>

Return Values:
	None

Examples:
    --- Code
		[
			player,
			"HealUp",
			"Heal Up",
			{hint "Fully healed!";},
			[],
			"true",
			true
		] call LR_fnc_AddSelfAction;
	---

Author:
	Mokka
*/

params [
	"_player",
	"_id",
	"_title",
	"_statement",
	["_args", []],
	["_condition", "true"],
	["_removeCompleted", true]
];

if (!hasInterface) exitWith {};

if (player != _player) exitWith {
	[
		_player,
		_id,
		_title,
		_statement,
		_args,
		_condition,
		_removeCompleted
	] remoteExec ["LR_fnc_AddSelfAction", _player];
};

if (isClass (configFile >> "CfgPatches" >> "ace_main")) then {

	if (_condition isEqualType "") then {
		_condition = compileFinal _condition;
	};

	_action = [
		_id,
		_title,
		"",
		{
			params ["_target", "_caller", "_arguments"];
			_arguments params ["_code", "_args", "_id",  "_remove"];

			[_target, _caller, _args] call _code;

			if (_remove) then {
				[_target,0,["ACE_MainActions", _id]] call ace_interact_menu_fnc_removeActionFromObject;
			};
		},
		_condition,
		{},
		[_statement, _args, _id, _removeCompleted],
		""
	] call ace_interact_menu_fnc_createAction;

	[_player, 1, [], _action] call ace_interact_menu_fnc_addActionToObject;

} else {

	// Fix the condition string (replace _player with _this)
	_condition = [_condition, "_player", "_this", nil, false] call LR_fnc_FindReplaceString;

	_player addAction [
		_title,
		{
			params ["_target", "_caller", "_actionId", "_arguments"];
			_arguments params ["_code", "_args",  "_remove"];

			[_target, _caller, _args] call _code;

			if (_remove) then {
				_target removeAction _actionId;
			};
		},
		[_statement, _args, _removeCompleted],
		1.5,
		true,
		true,
		"",
		_condition
	];
};