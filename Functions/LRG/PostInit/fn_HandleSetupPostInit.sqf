/*
Function: LR_fnc_HandleSetupPostInit

Description:
	Handles the custom postInit function/code supplied through LRG_Setup.sqf
	in "onPostInit".

	Add a line to the LRG_Setup.sqf file with

	onPostInit = "LR_fnc_SomeFunction";

	// or

	onPostInit = { hint "Some code"; player setDamage 1; };

	where the string indicates a specific function to be run and code describes
	custom code to run during postInit.

Parameters:
	None

Return Values:
	None

Examples:
    Nothing to see here, called in postInit

Author:
	Mokka
*/

// Only run on the server
if (!isServer) exitWith {};

// If onPostInit is not used (not set) exit
if (isNil "onPostInit") exitWith {};

if (onPostInit isEqualType "") exitWith {

	_fnc = compileFinal (format ["call %1;", onPostInit]);
	call _fnc;
};

if (onPostInit isEqualType {}) exitWith {
	call onPostInit;
};