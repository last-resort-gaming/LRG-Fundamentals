/*
Function: LR_fnc_Casualty

Description:
    Used to set an AI to a triage state via hold add actions.

Arguments:
	_object - Object the addaction is applied to. <OBJECT>

Examples:
    --- Code
	    [this] call LR_fnc_Casualty;
    ---

Author: MitchJC
*/

params ["_object"];

if (isserver) then {
	_object setVariable ["CasualtyHealed", True, True];
	_object disableAI "MOVE";
};


_RandomBodyPart = ["head", "body", "hand_l", "hand_r", "leg_l", "leg_r"];
_RandomInjuryType = ["bullet", "grenade", "explosive", "shell", "vehiclecrash"];

if (!hasinterface) exitwith {};
//========================= T1

_object addAction [
    "<t color='#e74c3c'>T1 Casualty</t>",
    {
        params ["_target", "_caller", "_actionId", "_arguments"];

		for "_i" from 1 to 6 do {
		    [_target, 0.5, selectRandom ((_this select 3) select 0), selectRandom ((_this select 3) select 1)] remoteExecCall ["ace_medical_fnc_addDamageToUnit", 0];
		};

		[_target, true, 10, true] remoteExecCall ["ace_medical_fnc_setUnconscious", 2];
		[_target] remoteExecCall ["ace_medical_fnc_setCardiacArrest", 2];
		_target setVariable ["CasualtyHealed", False, True];
    },
    [_RandomBodyPart,_RandomInjuryType],
    1.5,
    true,
    false,
    "",
    '(_target getVariable "CasualtyHealed") && (player getunittrait "Instructor")',
    5,
    false,
    "",
    ""
];

//========================= T2

_object addAction [
    "<t color='#f1c40f'>T2 Casualty</t>",
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
		for "_i" from 1 to 3 do {
		    [_target, 0.7, selectRandom ((_this select 3) select 0), selectRandom ((_this select 3) select 1)] remoteExecCall ["ace_medical_fnc_addDamageToUnit", 0];
		};

		[_target, true, 10, true] remoteExecCall ["ace_medical_fnc_setUnconscious", 2];

		_target setVariable ["CasualtyHealed", False, True];
    },
    [_RandomBodyPart,_RandomInjuryType],
    1.5,
    true,
    true,
    "",
    '(_target getVariable "CasualtyHealed") && (player getunittrait "Instructor")',
    5,
    false,
    "",
    ""
];

//========================= T3

_object addAction [
    "<t color='#27ae60'>T3 Casualty</t>",
    {
        params ["_target", "_caller", "_actionId", "_arguments"];

		for "_i" from 1 to 2 do {
		    [_target, 0.2, selectRandom ((_this select 3) select 0), selectRandom ((_this select 3) select 1)] remoteExecCall ["ace_medical_fnc_addDamageToUnit", 0];
		};

		_target setVariable ["CasualtyHealed", False, True];
    },
    [_RandomBodyPart,_RandomInjuryType],
    1.5,
    true,
    true,
    "",
    '(_target getVariable "CasualtyHealed") && (player getunittrait "Instructor")',
    5,
    false,
    "",
    ""
];

//=================== Reset

_object addAction
[
    "<t color='#666666'>Reset Casualty</t>",
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
		[_caller, _target] remoteExecCall ["ace_medical_fnc_treatmentAdvanced_fullHealLocal", 0];
		_target disableAI "MOVE";
		_target setVariable ["CasualtyHealed", true, True];
    },
    [],
    1.5,
    true,
    true,
    "",
    '!(_target getVariable "CasualtyHealed") && (player getunittrait "Instructor")',
    5,
    false,
    "",
    ""
];