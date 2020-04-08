/*
	author: MartinCo
	description:
	    gets an array of the count of FAKs in the healerrs [uniform, vest, backpack]
	returns:
	    array of counts of FAKs in [uniform, vest, backpack]
*/

params ["_unit"];
private _retval = [0,0,0];

// Faks from the uniform
{
	if (_x == "FirstAidKit") then {
		_retval set [0, (_retval select 0) + 1];
	};
	nil
} count (uniformItems _unit);

// Faks from the vest
{
	if (_x == "FirstAidKit") then {
        _retval set [1, (_retval select 1) + 1];
	};
	nil
} count (vestItems _unit);

// Faks from the backpack
{
	if (_x == "FirstAidKit") then {
        _retval set [2, (_retval select 2) + 1];
	};
	nil
} count (backpackItems _unit);

_retval;