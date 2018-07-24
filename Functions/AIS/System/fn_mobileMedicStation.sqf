/*
	author: Martin
	description: none
	returns: first mobile medic station in range that has faks
*/

params ["_unit"];

private _station = objNull;

if (isNil "ais_mobile_medic_stations") exitWith { _station; };

{
    _x params ["_cStation", "_cDistance"];
    if (!(isNull _cStation) && alive _cStation && _unit distance2D _cStation <= _cDistance && (!((((getItemCargo _cStation) select 0) find "FirstAidKit") isEqualTo -1) || _cStation getVariable ["AIS_NO_CONSUME_FAKS", false])) exitWith {
        _station = _cStation;
    };
} count ais_mobile_medic_stations;

_station;