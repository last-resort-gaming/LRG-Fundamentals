//adds ace actions to radio
params ["_object", "_radio"];

private _parentAction = [
	"RadioParentAction",
	"Stationary Radio",
	"",
	{ diag_log "hi" },
	{ true },
	nil,
	[]
] call ACE_interact_menu_fnc_createAction;

private _configAction = [
	"RadioConfigAction",
	"Configure Radio",
	"",
	{
		params ["_target", "_player", "_params"];
		_params params ["_radio"];
		[_target, _player, _radio] call LR_fnc_configureRadio;
	},
	{ true },
	nil,
	[_radio]
] call ACE_interact_menu_fnc_createAction;

private _turnOnAction = [
	"RadioTurnOnAction",
	"Turn On Radio",
	"",
	{
		params ["_target", "_player", "_params"];
		_params params ["_radio"];
		[_target, _radio, true] remoteExec ["LR_fnc_turnOnRadio", 2];
	},
	{
		params ["_target", "_player", "_params"];
		!([(_params select 0), "radio_settings"] call TFAR_fnc_getLrSpeakers);
	},
	nil,
	[_radio]
] call ACE_interact_menu_fnc_createAction;

private _turnOffAction = [
	"RadioTurnOffAction",
	"Turn Off Radio",
	"",
	{
		params ["_target", "_player", "_params"];
		_params params ["_radio"];
		[_target, _radio, false] remoteExec ["LR_fnc_turnOnRadio", 2];
	},
	{
		params ["_target", "_player", "_params"];
		[(_params select 0), "radio_settings"] call TFAR_fnc_getLrSpeakers;
	},
	nil,
	[_radio]
] call ACE_interact_menu_fnc_createAction;

[_object, 0, ["ACE_MainActions"], _parentAction] call ACE_interact_menu_fnc_addActionToObject;
[_object, 0, ["ACE_MainActions", "RadioParentAction"], _configAction] call ACE_interact_menu_fnc_addActionToObject;
[_object, 0, ["ACE_MainActions", "RadioParentAction"], _turnOnAction] call ACE_interact_menu_fnc_addActionToObject;
[_object, 0, ["ACE_MainActions", "RadioParentAction"], _turnOffAction] call ACE_interact_menu_fnc_addActionToObject;