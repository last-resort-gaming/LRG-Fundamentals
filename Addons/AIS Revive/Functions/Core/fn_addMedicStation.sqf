/*
	author: Martin
	description: none
	returns: nothing
*/

params ["_station", "_range"];

// If the item has no FAK cargo, do nothing.
private _cargo    = getItemCargo _station;
private _mkCargo  = (_cargo select 0) find "Medikit";
private _fakCargo = (_cargo select 0) find "FirstAidKit";

if (_mkCargo isEqualTo -1 && _station getVariable["AIS_REQUIRE_MEDIKIT", true]) exitWith { false };
if (_fakCargo isEqualTo -1 && !(_station getVariable["AIS_NO_CONSUME_FAKS", false])) exitWith { false };

// And it's not already in the array
if !(((ais_mobile_medic_stations select 0) find _station) isEqualTo -1) exitWith { true; };

// Might as well do the cleanup here of destroyed stations as we'll be submitting the var
ais_mobile_medic_stations = ais_mobile_medic_stations select { !isNull (_x select 0) && alive (_x select 0) };

// Add to the public array
ais_mobile_medic_stations pushBack [_station, _range];
publicVariable "ais_mobile_medic_stations";

true