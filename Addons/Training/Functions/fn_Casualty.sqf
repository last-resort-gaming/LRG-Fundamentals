/*
Function: LR_fnc_Casualty

Description:
    Used to set an AI to a triage state via hold add actions.

Arguments:
	_object - Object the addaction is applied to. <OBJECT>

Examples:
    (begin example)
	    [this] call LR_fnc_Casualty;
    (end)

Author:
	MitchJC
*/

params ["_object"];

if (isserver) then {
	_object setVariable ["CasualtyHealed", True, True];
	_object disableAI "MOVE";
	_object disableAI "FSM";
};


_RandomBodyPart = ["Head", "Body", "LeftArm", "RightArm", "LeftLeg", "RightLeg"];
_RandomInjuryType = ["bullet", "grenade", "explosive", "shell", "vehiclecrash"];

if (!hasinterface) exitwith {};
//========================= T1

[
    _object,
    format ["t1_cas_action_%1", round (random 10000)],
    "<t color='#e74c3c'>T1 Casualty</t>",
    {
        params ["_target", "_caller", "_arguments"];

		for "_i" from 1 to 6 do {
		    [_target, 0.5, selectRandom (_arguments select 0), selectRandom (_arguments select 1)] remoteExecCall ["ace_medical_fnc_addDamageToUnit", 0];
		};

		[_target, true, 0, true] remoteExecCall ["ace_medical_fnc_setUnconscious", 2];
		[_target, true] remoteExecCall ["ace_medical_status_fnc_setCardiacArrestState", 2];
		_target setVariable ["CasualtyHealed", False, True];
    },
    [_RandomBodyPart,_RandomInjuryType],
    '(_target getVariable "CasualtyHealed") && (_player getunittrait "Instructor")',
    false,
    5,
    false
] call LR_fnc_AddAction;

//========================= T2

[
    _object,
    format ["t2_cas_action_%1", round (random 10000)],
    "<t color='#f1c40f'>T2 Casualty</t>",
    {
        params ["_target", "_caller", "_arguments"];
		for "_i" from 1 to 3 do {
		    [_target, 0.7, selectRandom (_arguments select 0), selectRandom (_arguments select 1)] remoteExecCall ["ace_medical_fnc_addDamageToUnit", 0];
		};

		[_target, true, 10, true] remoteExecCall ["ace_medical_fnc_setUnconscious", 2];

		_target setVariable ["CasualtyHealed", False, True];
    },
    [_RandomBodyPart,_RandomInjuryType],
    '(_target getVariable "CasualtyHealed") && (_player getunittrait "Instructor")',
    false,
    5,
    false
] call LR_fnc_AddAction;

//========================= T3

[
    _object,
    format ["t3_cas_action_%1", round (random 10000)],
    "<t color='#27ae60'>T3 Casualty</t>",
    {
        params ["_target", "_caller", "_arguments"];

		for "_i" from 1 to 2 do {
		    [_target, 0.2, selectRandom (_arguments select 0), selectRandom (_arguments select 1)] remoteExecCall ["ace_medical_fnc_addDamageToUnit", 0];
		};

		_target setVariable ["CasualtyHealed", False, True];
    },
    [_RandomBodyPart,_RandomInjuryType],
    '(_target getVariable "CasualtyHealed") && (_player getunittrait "Instructor")',
    false,
    5,
    false
] call LR_fnc_AddAction;

//=================== Reset

[
    _object,
    format ["reset_cas_action_%1", round (random 10000)],
    "<t color='#666666'>Reset Casualty</t>",
    {
        params ["_target", "_caller", "_arguments"];
		["ace_medical_treatment_fullHeal", _target, _target] call CBA_fnc_targetEvent;
		_target disableAI "MOVE";
		_target disableAI "FSM";
		_target setVariable ["CasualtyHealed", true, True];
    },
    [],
    '!(_target getVariable "CasualtyHealed") && (_player getunittrait "Instructor")',
    false,
    5,
    false
] call LR_fnc_AddAction;