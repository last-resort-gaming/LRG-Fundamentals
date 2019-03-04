//Postinit for Client

if (!hasinterface) exitwith {};

if (isNil { player getVariable "CreditsChecked"; } ) then {

	private _ProfileCredits = profileNamespace getVariable ["LRGCS", 0];	// Get credits from Client Profile, if not set join with 500
	player setVariable ["BIS_WL_funds", _ProfileCredits, true];
	[
		{
			params ["_args", "_pfhID"];
			_args params ["_ProfileCredits"];
			private _WLFunds = player getvariable ["BIS_WL_funds", 0];	// Get player WL Credit balance.
			if (_WLFunds > 50000) then {
				_WLFunds = 50000;
				player setvariable ["BIS_WL_funds", _WLFunds, true];
				};
			profileNameSpace setvariable ["LRGCS", _WLFunds];			// Update Player Profile with credit amount
			saveProfileNamespace;										// Save Profile Data

		}, 20, [_ProfileCredits]										// Tick every 20, to be reviewed. (Every 60 Seconds to match tick?)
	] call CBA_fnc_addPerFrameHandler;

	player setvariable ["CreditsChecked", true];
};