/*
Function: YAINA_SPAWNS_fnc_infantryGarrison

Description:
	Garrison buildings in given radius around given position, using
	units of the passed faction.

Parameters:
	_pos - Position around which to garrison buildings
	_radius - Radius around the position in which to garrison buildings
	_army - The faction which we want to use to populate the garrisons
	_groupCount - The amount of groups we want to create
	_AIOB_Positioning - The positioning directive to use (default: 2)
	_skill - The skill level of the garrisoned units
	_maxFill - The maximum amount of units in one building
	_excludes - Exclude buildings in this array from being garrisoned
	_units - Array of units already in existence which we want to garrison as well


Return Values:
	Array containing the garrisoned units

Examples:
    Nothing to see here

Author:
	MartinCo
	MitchJC
*/
if (!isServer) exitWith {};

params [
    "_pos",
    ["_radius", [0, 30]],
    "_army",
    ["_groupCount", 1],
    ["_AIOB_Positioning", 2],
    ["_skill", "LRG Default"],
    ["_maxFill", 4],
    ["_excludes", []],
    ["_units", []]
];

if (_units isEqualTo []) then {


// Set the Default Faction if all else fails
private _side = East;
private _FactionSide = "East";
private _InfantryType = "UInfantry";
private _InfantryGroup = "OIA_GuardSquad";

// Check for Side from _army
private _SideNumber = getnumber (configfile >> "CfgFactionClasses" >> _army >> "side");
call {
 	if (_sidenumber IsEqualTo 0) exitwith {
		 _side = East;
		 _FactionSide = "East";
	}; 
 	if (_sidenumber IsEqualTo 1) exitwith {
		 _side = West;
		 _FactionSide = "West";
	}; 
 	if (_sidenumber IsEqualTo 2) exitwith {
		 _side = Resistance;
		 _FactionSide = "Indep";
	};	
};

// Check for matching Faction from _army
	call {
		if (_army isEqualto "OPF_F") exitWith {
			_InfantryType = "UInfantry";
			_InfantryGroup = "OIA_GuardSquad";
		};
			
		if (_army isEqualto "OPF_T_F") exitWith {
			_InfantryType = "Infantry";
			_InfantryGroup = "O_T_InfSquad";
		};

		if (_army isEqualto "IND_F") exitWith {
			_InfantryType = "Infantry";
			_InfantryGroup = "HAF_InfSquad";
		};

		if (_army isEqualto "IND_C_F") exitWith {
			_InfantryType = "Infantry";
			_InfantryGroup = "BanditCombatGroup";
		};

		if (_army isEqualto "CUP_O_RU") exitWith {
			_InfantryType = "Infantry";
			_InfantryGroup = "CUP_O_RU_InfSquad_EMR";
		};

		if (_army isEqualto "CUP_O_ChDKZ") exitWith {
			_InfantryType = "Infantry";
			_InfantryGroup = "CUP_O_ChDKZ_InfSquad";
		};

		if (_army isEqualto "CUP_O_SLA") exitWith {
			_InfantryType = "Infantry_Urban";
			_InfantryGroup = "CUP_O_SLA_InfantrySquad_Urban";
		};

		if (_army isEqualto "CUP_O_TK") exitWith {
			_InfantryType = "Infantry";
			_InfantryGroup = "CUP_O_TK_InfantrySquad";
		};

		if (_army isEqualto "rhsgref_faction_chdkz") exitWith {
			_InfantryType = "rhsgref_group_chdkz_insurgents_infantry";
			_InfantryGroup = "rhsgref_group_chdkz_insurgents_squad";
		};

		if (_army isEqualto "rhs_faction_msv") exitWith {
			_InfantryType = "rhs_group_rus_msv_infantry";
			_InfantryGroup = "rhs_group_rus_msv_infantry_squad";
		};

		if (_army isEqualto "rhs_faction_vdv") exitWith {
			_InfantryType = "rhs_group_rus_vdv_infantry";
			_InfantryGroup = "rhs_group_rus_vdv_infantry_squad";
		};

		if (_army isEqualto "rhs_faction_vmf") exitWith {
			_InfantryType = "rhs_group_rus_vmf_infantry";
			_InfantryGroup = "rhs_group_rus_vmf_infantry_squad";
		};

		if (_army isEqualto "OPTRE_Ins") exitWith {
			_InfantryType = "Infantry_URF";
			_InfantryGroup = "OPTRE_Ins_URF_Inf_RifleSquad";
		};

		if (_army isEqualto "CSAT TEC_CSAT") exitwith {
			_InfantryType = "TEC_CSAT";
			_InfantryGroup = "TEC_Infantry_SA";
		};

		if (_army isEqualto "TEC_CSAT_Pacific") exitwith {
			_InfantryType = "Infantry_URF";
			_InfantryGroup = "OPTRE_Ins_URF_Inf_RifleSquad";
		};
	};

	private _groupType = (configFile >> "CfgGroups" >> _FactionSide >> _army >> _InfantryType >> _InfantryGroup);

    for "_x" from 1 to _groupCount do {
        private _g = [_pos, _side, _groupType] call BIS_fnc_spawnGroup;
        _units append (units _g);
    };
};

if (_units isEqualTo []) exitWith { [] };

private _failed = [_pos, nil, _units, _radius, _AIOB_Positioning, true, _maxFill, _excludes] call DERP_fnc_AIOccupyBuilding;

// Remove any non-garrisoned units
{ deleteVehicle _x; } forEach _failed;
_allUnits = _units - _failed;

// Set Skill
[_allUnits, _skill] call LR_fnc_setUnitSkill;

// Add units to zeus
{_x addCuratorEditableObjects [_allUnits, false];} forEach allCurators;

_allUnits;
