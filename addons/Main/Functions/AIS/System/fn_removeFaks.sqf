/*
 * Author: Alwarren
 
 * Remove first aid and Medikits
 
 * Arguments:
	0: Unit (Object)
	
 * Example:
	[player] call AIS_System_fnc_removeFaks;
 
 * Return value:
	BOOL - false if items already stored
*/

params ["_unit"];

// Bail if it's already set, this can happen if we get multiple
// unconsious in the same frame
if (!isNil {_unit getVariable "AIS_MedicalStore"}) exitWith {};

// Count the number of FAK's and Medikits this unit has
_numFakUniform = 0;
_numFaksVest = 0;
_numFaksBackpack = 0;
_numMedi = 0;

// Faks from the uniform
{
	if (_x == "FirstAidKit") then {
		_numFakUniform = _numFakUniform + 1;
		_unit removeItemFromUniform "FirstAidKit";
	};
	nil
} count (uniformItems _unit);

// Faks from the vest
{
	if (_x == "FirstAidKit") then {
		_numFaksVest = _numFaksVest + 1;
		_unit removeItemFromVest "FirstAidKit";
	};
	nil
} count (vestItems _unit);

// Faks and Medikits from the backpack. Kits can only be in backpack, so we don't search for them anywhere else
{
	if (_x == "FirstAidKit") then {
		_numFaksBackpack = _numFaksBackpack + 1;
		_unit removeItemFromBackpack "FirstAidKit";
	};
	if (_x == "Medikit") then {
		_numMedi = _numMedi + 1;
		_unit removeItemFromBackpack "Medikit";
	};
	nil
} count (backpackItems _unit);

// Store the result
_unit setVariable ["AIS_MedicalStore", [_numFakUniform, _numFaksVest, _numFaksBackpack, _numMedi], true];


true