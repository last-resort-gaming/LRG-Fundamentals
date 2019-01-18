/*
Function: YAINA_CMD_fnc_findPlayer

Description:
	Find a player, using supplied prefix.

Parameters:
	_prefix - The prefix of the wanted player

Return Values:
	Player object if found, null otherwise.

Examples:
    Nothing to see here

Author:
	Martin
*/

params ["_prefix"];

_prefix = toLower(_prefix);
_pl = count _prefix;

_r = allPlayers select { (toLower(name _x) select [0, _pl]) isEqualTo _prefix };

// However a direct match wins
_d = _r select { toLower((name _x)) isEqualTo _prefix };

if !(_d isEqualTo []) exitWith { _d };

// If r is empty, lookup based on guid
if (_r isEqualTo []) then {

    {
        if (getPlayerUID _x isEqualTo _prefix) exitWith {
            _r = [_x];
        };
        nil;
    } count allPlayers;
};

_r