/*
Function: LR_fnc_sum

Description:
    Sums up all numbers in given array.

	Taken from Achilles (https://github.com/ArmaAchilles/Achilles)

Arguments:
	_array - Array containing the numbers to sum up

Return Value:
	Sum of all numbers in given array.

Example:
	Nothing to see here

Author:
    Kex, modified by Mokka
*/

params ["_array"];
private _sum = 0;
{
	_sum = _sum + _x;
} forEach _array;

_sum