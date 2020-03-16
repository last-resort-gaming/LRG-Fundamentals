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

	_this select 0 - The object to which the action is assigned to <OBJECT>
	_this select 1 - The unit that activated the action <OBJECT>
	_this select 2 - The arguments passed through the function in _args <ARRAY of ANYTHING>

Arguments:
	_object - The object to which the action is added <OBJECT>
	_id - The globally unique identifier of the action (used for ACE, JIP etc) <STRING>
	_title - The title of the action as shown to players <STRING>
	_icon - The icon that's shown to the player <STRING>
	_conditionShow - Condition for the action to be shown, default: "true" <STRING>
	_conditionProgress - Condition for the action to progress; if false is returned action progress is paused, default: "true" <STRING>
	_codeStart - Code executed when action starts <CODE>
	_codeProgress - Code executed on every progress tick <CODE>
	_codeCompleted - Code executed on completion <CODE>
	_codeInterrupted - Code executed on interrupted <CODE>
	_args - Arguments that are passed to the code blocks <ARRAY OF ANYTHING>
	_duration - The duration in seconds it takes to complete the action, default: 10 <SCALAR>
	_removeCompleted - Remove the action once it's completed, default: true <BOOLEAN>
	_progressTitle - Shown in the ACE progress bar, optional <STRING>
	_global - Set to true to add the action to every player <BOOLEAN>

Return Values:
	None

Examples:
    (begin example)
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
	(end)

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
				[_args, _codeCompleted, _codeInterrupted, _remove, _target, _caller, _id],
				{
					(_this select 0) params [
						"_parameters",
						"_codeCompleted",
						"_codeInterrupted",
						"_remove",
						"_target",
						"_caller",
						"_id"
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
						"_caller",
						"_id"
					];

					[_target, _caller, _parameters] call _codeInterrupted;
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
	_conditionShow = [_conditionShow, "_player", "_this", nil, false] call LR_fnc_FindReplaceString;
	_conditionProgress = [_conditionProgress, "_player", "_this", nil, false] call LR_fnc_FindReplaceString;

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
		-99,
		_removeCompleted
	] call BIS_fnc_holdActionAdd;
};