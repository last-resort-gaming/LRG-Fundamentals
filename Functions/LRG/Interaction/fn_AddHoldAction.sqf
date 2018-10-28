/*
Function: LR_fnc_AddHoldAction

Description:
	Adds a timed action to an object. The action will only complete after a
	certain amount of time, wich progresses only if certain conditions are met.
	The player executing the action is informed about the progress.
	The action is added only to the clients on which the function was originally
	called. If the function is called with _global set to true the action will
	be added to every player and JIP.

	The condition for showing the action has the following keywords available:

	_target - The object that the action is attached to
	_player - The player that is currently checked

	The keyword "_this" is reserved, don't use it in the condition string!

	All the _codeX clocks have the following parameters available:

	_target - The object to which the action is assigned to
	_caller - The unit that activated the action
	_args - The arguments passed through the function

Parameters:
	_object - The object to which the action is added
	_id - The globally unique identifier of the action (used for ACE, JIP etc)
	_title - The title of the action as shown to players
	_icon - The icon that's shown to the player
	_conditionShow - Condition for the action to be shown, default: "true"
	_conditionProgress - Condition for the action to progress; if false is returned action progress is paused, default: "true"
	_codeStart - Code executed when action starts
	_codeProgress - Code executed on every progress tick
	_codeCompleted - Code executed on completion
	_codeInterrupted - Code executed on interrupted
	_args - Arguments that are passed to the code blocks
	_duration - The duration in seconds it takes to complete the action, default: 10
	_removeCompleted - Remove the action once it's completed, default: true
	_progressTitle - Shown in the ACE progress bar, optional
	_global - Set to true to add the action to every player

Return Values:
	None

Examples:
    --- Code
	[
		Car,
		"UnlockCar",
		"Unlock Car",
		"",
		"true",
		"true",
		{hint "Unlocking Car!";},
		{hint "Still unlocking Car!";},
		{hint "Car unlocked!";},
		{hint "Couldn't unlock Car!";},
		[],
		14,
		true,
		"Unlocking Car...",
		true
	] call LR_fnc_AddHoldAction;
	---

Author:
	Mokka
*/

params [
	"_object",
	"_id",
	"_title",
	["_icon", ""],
	"_conditionShow",
	"_conditionProgress",
	"_codeStart",
	"_codeProgress",
	"_codeCompleted",
	"_codeInterrupted",
	["_args",[]],
	["_duration", 10],
	["_removeCompleted", true],
	["_progressTitle", ""],
	["_global", false]
];

if (_global) exitWith {
	[
		_object,
		_id,
		_title,
		_icon,
		_conditionShow,
		_conditionProgress,
		_codeStart,
		_codeProgress,
		_codeCompleted,
		_codeInterrupted,
		_args,
		_duration,
		_removeCompleted,
		_progressTitle,
		false
	] remoteExec ["LR_fnc_AddHoldAction", 0, _id];
};

if (!hasInterface) exitWith {};

if (isClass (configFile >> "CfgPatches" >> "ace_main")) then {

	if (_conditionShow isEqualType "") then {
		_conditionShow = compileFinal _conditionShow;
	};

	if (_conditionProgress isEqualType "") then {
		_conditionProgress = compileFinal _conditionProgress;
	};

	_action = [
		_id,
		_title,
		_icon,
		{
			params ["_target", "_caller", "_arguments"];

			_arguments params [
				"_args",
				"_conditionProgress",
				"_codeStart",
				"_codeProgress",
				"_codeCompleted",
				"_codeInterrupted",
				"_id",
				"_remove",
				"_duration",
				"_progressTitle"
			];

			[_target, _caller, _args] call _codeStart;

			[
				_duration,
				[_args, _codeCompleted, _codeInterrupted, _remove, _target, _caller],
				{
					(_this select 0) params [
						"_parameters",
						"_codeCompleted",
						"_codeInterrupted",
						"_remove",
						"_target",
						"_caller"
					];

					[_target, _caller, _parameters] call _codeCompleted;

					if (_remove) then {
						[_target,0,["ACE_MainActions", _id]] call ace_interact_menu_fnc_removeActionFromObject;
					};
				},
				{
					(_this select 0) params [
						"_parameters",
						"_codeCompleted",
						"_codeInterrupted",
						"_remove",
						"_target",
						"_caller"
					];

					[_target, _caller, _parameters] call _codeCompleted;
				},
				_progressTitle,
				compile format ["(_this select 0) params [""_parameters"",""_codeCompleted"",""_codeInterrupted"",""_remove"",""_target"",""_caller""]; _nul = [_target, _caller, _parameters] call %1; _bool = [_target, _caller, _parameters] call %2; _bool", _codeProgress, _conditionProgress]
			] call ace_common_fnc_progressBar;

		},
		_conditionShow,
		{},
		[_args, _conditionProgress, _codeStart, _codeProgress, _codeCompleted, _codeInterrupted, _id, _removeCompleted, _duration, _progressTitle]
	] call ace_interact_menu_fnc_createAction;

	[_object, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
} else {

	// Fix the condition string (replace _player with _this)
	_condition = [_condition, "_player", "_this", nil, false] call LR_fnc_FindReplaceString;

	[
		_object,
		_title,
		_icon,
		_icon,
		_conditionShow,
		_conditionProgress,
		{
			params ["_target", "_caller", "_actionId", "_arguments"];
			
			_arguments params [
				"_args",
				"_codeStart",
				"_codeProgress",
				"_codeCompleted",
				"_codeInterrupted"
			];

			[_target, _caller, _args] call _codeStart;
		},
		{
			params ["_target", "_caller", "_actionId", "_arguments"];
			
			_arguments params [
				"_args",
				"_codeStart",
				"_codeProgress",
				"_codeCompleted",
				"_codeInterrupted"
			];

			[_target, _caller, _args] call _codeProgress;
		},
		{
			params ["_target", "_caller", "_actionId", "_arguments"];
			
			_arguments params [
				"_args",
				"_codeStart",
				"_codeProgress",
				"_codeCompleted",
				"_codeInterrupted"
			];

			[_target, _caller, _args] call _codeCompleted;
		},
		{
			params ["_target", "_caller", "_actionId", "_arguments"];
			
			_arguments params [
				"_args",
				"_codeStart",
				"_codeProgress",
				"_codeCompleted",
				"_codeInterrupted"
			];

			[_target, _caller, _args] call _codeInterrupted;
		},
		[_args, _codeStart, _codeProgress, _codeCompleted, _codeInterrupted],
		_duration,
		1.5,
		_removeCompleted
	] call BIS_fnc_holdActionAdd;
};