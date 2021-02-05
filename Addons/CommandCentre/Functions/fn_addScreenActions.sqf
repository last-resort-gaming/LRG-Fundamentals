params ["_object", "_selection", "_name", "_args"];

private _parentAction = [
	format ["screen%1_parent", _selection],
	format ["%1", _name],
	"",
	{ diag_log "hi" },
	{ true },
	nil,
	[]
] call ACE_interact_menu_fnc_createAction;

private _configAction = [
	format ["screen%1_config", _selection],
	"Configure Screen",
	"",
	{
		params ["_target", "_player", "_params"];
		_params params ["_object", "_selection", "_args"];

		[_object, _selection, _args] call LR_fnc_configureScreen;
	},
	{
		params ["_target", "_player", "_params"];
		_params params ["_object", "_selection"];

		_object getVariable [format ["LRG_CC_screen_%1_on", _selection], false];
	},
	nil,
	[_object, _selection, _args],
	nil,
	nil,
	nil,
	{
		params ["_target", "_player", "_params", "_actionData"];
		_params params ["_object", "_selection"];

		private _screenMode = _object getVariable [format ["LRG_CC_screen_%1_mode", _selection], ""];
		private _screenTarget = _object getVariable [format ["LRG_CC_screen_%1_target", _selection], ""];
		private "_modeName";

		if ((!(_screenMode isEqualTo "")) && (!(_screenTarget isEqualTo ""))) then {
			switch (_screenMode) do {
				case "HCAM": { _modeName = "Viewing Helmet Cam"; };
				case "DCAM": { _modeName = "Viewing Drone Cam"; };
				case "SAT": { _modeName = "Viewing Satellite Footage"; };
				default { _modeName = "Error, invalid mode!"; };
			};

			_actionData set [1, format["Configure Screen - %1: %2", _modeName, _screenTarget]];
		} else {
			_actionData set [1, "Configure Screen"]
		};
}
] call ACE_interact_menu_fnc_createAction;

private _turnOnAction = [
	format ["screen%1_turnOn", _selection],
	"Turn On",
	"",
	{
		params ["_target", "_player", "_params"];
		_params params ["_object", "_selection", "_args"];

		[_object, _selection, true, _args] call LR_fnc_turnOnScreen;
	},
	{
		params ["_target", "_player", "_params"];
		_params params ["_object", "_selection"];

		!(_object getVariable [format ["LRG_CC_screen_%1_on", _selection], false]);
	},
	nil,
	[_object, _selection, _args]
] call ACE_interact_menu_fnc_createAction;

private _turnOffAction = [
	format ["screen%1_turnOff", _selection],
	"Turn Off",
	"",
	{
		params ["_target", "_player", "_params"];
		_params params ["_object", "_selection", "_args"];

		[_object, _selection, false, _args] call LR_fnc_turnOnScreen;
	},
	{
		params ["_target", "_player", "_params"];
		_params params ["_object", "_selection"];

		_object getVariable [format ["LRG_CC_screen_%1_on", _selection], false];
	},
	nil,
	[_object, _selection, _args]
] call ACE_interact_menu_fnc_createAction;

private _toggleVisualAction = [
	format ["screen%1_toggleVisual", _selection],
	"Toggle Visual Mode",
	"",
	{
		params ["_target", "_player", "_params"];
		_params params ["_object", "_selection"];

		[_object, _selection] call LR_fnc_toggleVisualMode;
	},
	{
		params ["_target", "_player", "_params"];
		_params params ["_object", "_selection"];

		_object getVariable [format ["LRG_CC_screen_%1_on", _selection], false];
	},
	nil,
	[_object, _selection]
] call ACE_interact_menu_fnc_createAction;

[_object, 0, ["ACE_MainActions"], _parentAction] call ACE_interact_menu_fnc_addActionToObject;
[_object, 0, ["ACE_MainActions", format ["screen%1_parent", _selection]], _configAction] call ACE_interact_menu_fnc_addActionToObject;
[_object, 0, ["ACE_MainActions", format ["screen%1_parent", _selection]], _toggleVisualAction] call ACE_interact_menu_fnc_addActionToObject;
[_object, 0, ["ACE_MainActions", format ["screen%1_parent", _selection]], _turnOnAction] call ACE_interact_menu_fnc_addActionToObject;
[_object, 0, ["ACE_MainActions", format ["screen%1_parent", _selection]], _turnOffAction] call ACE_interact_menu_fnc_addActionToObject;