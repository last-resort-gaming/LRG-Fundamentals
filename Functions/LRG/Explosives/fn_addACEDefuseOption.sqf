/*
Function: LR_fnc_makeIED

Description:
	Adds an option to defuse a certain explosive in the ACE interaction menu.
	Is executed globally by LR_fnc_makeIED.

Parameters:
	_object - The explosive to add the defusal option for
	_requireDefusalKit - If a defusal kit is required to defuse the explosive

Return Values:
	None

Examples:
    Nothing to see here...

Author:
	Mokka
*/

params [
	["_object", objNull],
	["_requireDefusalKit", true]
];

_condition = [{
	((_this select 0) getVariable ["IEDarmed",false])
	&& {not ((_this select 0) getVariable ["IEDdetonated",false])}
	&& {not ((_this select 0) getVariable ["IEDdisarmed", false])}
}, {
	((_this select 0) getVariable ["IEDarmed",false])
	&& {not ((_this select 0) getVariable ["IEDdetonated",false])}
	&& {not ((_this select 0) getVariable ["IEDdisarmed", false])}
	&& {[(_this select 1)] call ace_explosives_fnc_canDefuse}
}] select (_requireDefusalKit);

// Adds action to defuse the bomb
_action = [
	"DefuseIED",
	"Defuse IED",
	"",
	{
		(_this select 0) setVariable ["IEDdisarmed", true, true];
		["You've disarmed the IED.", [-1, 0.8], "#339900", 0.5, false] call LR_fnc_dynamicText;
	},
	_condition
] call ace_interact_menu_fnc_createAction;

[_object, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;