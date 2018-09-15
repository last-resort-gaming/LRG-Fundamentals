/*
Function: LR_fnc_AddAction

Description:
	Adds an action to an object. The action is added only to the clients on 
	which the function was originally called. If the function is called on the 
	server the action is added globally and added to the JIP queue.

	The condition has the following keywords available:

	_target - The object that the action is attached to
	_player - The player that is currently checked

	The keyword "_this" is reserved, don't use it in the condition string!

Parameters:
	_object - The object to which the action is added
	_id - The globally unique identifier of the action (used for ACE, JIP etc)
	_title - The title of the action as shown to players
	_statement - The code executed upon calling the action, the following params are available: [_target, _caller, _args]
	_args - Arguments for the statement script (Optional), default: []
	_condition - Code in string which needs to be true for the action to show up, default: "true"
	_removeCompleted - Remove the action after it has been completed/called, default: true
	_distance - The radius in m around the object in which the object is visible, default: 10

Return Values:
	None

Examples:
    --- Code
	[
		Car,
		"UnlockCar",
		"Unlock Car",
		{hint "Car unlocked!";},
		[],
		"true",
		true,
		15
	] call LR_fnc_AddAction;
	---

Author:
	Mokka
*/

params [
	"_object",
	"_id",
	"_title",
	"_statement",
	["_args", []],
	["_condition", "true"],
	["_removeCompleted", true],
	["_distance", 10]
];

if (isServer && isMultiplayer) exitWith {
	[
		_object, 
		_id, 
		_title, 
		_statement, 
		_args, 
		_condition, 
		_removeCompleted, 
		_distance
	] remoteExec ["LR_fnc_AddAction", -2, _id];
};

if (!hasInterface) exitWith {};

if (isClass (configFile >> "CfgPatches" >> "ace_main")) then {

	_action = [
		_id,
		_title,
		"",
		{
			params ["_target", "_caller", "_arguments"];
			_arguments params ["_code", "_args", "_id",  "_remove"];

			[_target, _caller, _args] call _code;

			if (_remove) then {
				[_target,0,[_id]] call ace_interact_menu_fnc_removeActionFromObject;
			};
		},
		compile _condition,
		{},
		[_statement, _args, _id, _removeCompleted],
		"",
		_distance
	] call ace_interact_menu_fnc_createAction;

	[_object, 0, [], _action] call ace_interact_menu_fnc_addActionToObject;

} else {

	// Fix the condition string (replace _player with _this)
	_condition = [_condition, "_player", "_this", nil, false] call LR_fnc_FindReplaceString;

	_object addAction [
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
		_condition,
		_distance
	];
};