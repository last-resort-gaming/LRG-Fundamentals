if (!hasinterface) exitwith {};


private _ProfileCredits = profileNamespace getVariable ["LRGCS", 75];
player setVariable ["BIS_WL_funds", _ProfileCredits, true];

[
	{
		params ["_args", "_pfhID"];
		_args params ["_ProfileCredits"];
		profileNameSpace setvariable ["LRGCS", _ProfileCredits];

	}, 20, [_ProfileCredits]
] call CBA_fnc_addPerFrameHandler;
