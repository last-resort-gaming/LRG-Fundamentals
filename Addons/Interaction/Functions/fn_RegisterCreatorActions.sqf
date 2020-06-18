// internal function
params ["_actions"];

if (isClass (configFile >> "CfgPatches" >> "ace_main")) then {

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
} else {

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