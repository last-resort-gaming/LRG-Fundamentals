/*
Function: LR_fnc_SpawnAIZeusWrapper

Description:
	Wraps calls to LR_fnc_SpawnAI for use with the Zeus Modules.

Arguments:
	_side - The side of the AI to spawn <STRING>
	_pos - Position of the module <ARRAY/POS3D>

Return Values:
	None

Examples:
    Nothing to see here

Author:
	Mokka
*/

#define EAST_FACTIONS ["Vanilla - CSAT", "Vanilla - CSAT (Pacific)", "@3CB Factions - Chernarus Communist Militia", "@3CB Factions - Takistan National Army", "@3CB Factions - Takistan Insurgents", "@3CB Factions - Takistan National Police", "@CSAT Mod Project - CSAT (Iran, Mediterranean)", "@CSAT Mod Project - CSAT (Iran, Pacific)", "@CUP - Chernarussian Movement of the Red Star", "@CUP - Russian Federation", "@CUP - Sahrani Liberation Army", "@CUP - Takistan Army", "@CUP - Takistan Militia", "@IFA3 - Red Army", "@OPTRE - Insurrectionists", "@Project OPFOR - African Militia", "@Project OPFOR - Middle Eastern Militia", "@Project OPFOR - Boko Haram", "@Project OPFOR - ChDKZ", "@Project OPFOR - Irish Republican Army", "@Project OPFOR - Islamic State", "@Project OPFOR - Sahrani Liberation Army", "@Project OPFOR - Takistani Armed Forces", "@RHS AFRF - Russia - MSV", "@RHS AFRF - Russia - VDV", "@RHS AFRF - Russia - VMF", "@RHS GREF - ChDKZ Insurgents", "@UNSUNG - NVA"]
#define INDEP_FACTIONS ["Vanilla - AAF", "Vanilla - Syndikat", "@3CB Factions - Chernarus Nationalist Militia", "@3CB Factions - Takistan National Army", "@3CB Factions - Takistan Tribal Fighters", "@3CB Factions - Takistan National Police", "@3CB Factions - UN Peacekeepers", "@CUP - National Part of Chernarus", "@CUP - ION PMC", "@CUP - Royal Army Corps of Sahrani", "@CUP - Takistani Locals", "@CUP - United Nations", "@IFA3 - US Army", "@Project OPFOR - Iranian Armed Forces", "@Project OPFOR - Chernarussian National Insurgents", "@Project OPFOR - Kurdish Peshmerga Forces", "@Project OPFOR - Private Military Company", "@Project OPFOR - Royal Army Corps of Sahrani", "@Project OPFOR - Ultranationalists", "@Project OPFOR - Ukrainian Armed Forces", "@Project OPFOR - United Nations", "@Project OPFOR - Ulster Volunteer Force", "@RHS GREF - Chernarus (Ground Forces)", "@RHS GREF - ChDKZ Insurgents", "@RHS GREF - Nationalist Militia", "@RHS SAF - SAF (KOV)", "@RHS SAF - SAF (UN Peacekeepers)"]
#define WEST_FACTIONS ["Vanilla - NATO", "Vanilla - NATO (Pacific)", "@3CB BAF - Army - Arctic", "@3CB BAF - Army - Desert", "@3CB BAF - Army - MTP", "@3CB BAF - Army - Temperate", "@3CB BAF - Army - Tropical", "@3CB BAF - Army - Woodland", "@3CB Factions - Afghan National Army", "@3CB Factions - Afghan National Police", "@3CB Factions - Chernarus Local Defence Volunteers", "@3CB Factions - Takistan National Army", "@3CB Factions - Takistan Pro-Government Militia", "@3CB Factions - Takistan National Police", "@3CB Factions - UN Peacekeepers", "@CUP - Army of the Czech Republic", "@CUP - British Armed Forces", "@CUP - Bundeswehr", "@CUP - United States Army", "@IFA3 - Wehrmacht", "@OPTRE - UNSCDF", "@Project OPFOR - Afghan National Army", "@Project OPFOR - Iraqi Armed Forces", "@RHS USAF  - USA Army - Desert", "@RHS USAF  - USA Army - Woodland"]

#define EAST_FACTIONS_LOOKUP ["OPF_F", "OPF_T_F", "UK3CB_CCM_O", "UK3CB_TKA_O", "UK3CB_TKM_O", "UK3CB_TKP_O", "TEC_CSAT", "TEC_CSAT_Pacific", "CUP_O_ChDKZ", "CUP_O_RU", "CUP_O_SLA", "CUP_O_TK", "CUP_O_TK_MILITIA", "LIB_RKKA", "OPTRE_Ins", "LOP_AFR_OPF", "LOP_AM_OPF", "LOP_BH", "LOP_ChDKZ", "LOP_IRA", "LOP_ISTS_OPF", "LOP_SLA", "LOP_TKA", "rhs_faction_msv", "rhs_faction_vdv", "rhs_faction_vmf", "rhsgref_faction_chdkz", "UNSUNG_E_NVA"]
#define INDEP_FACTIONS_LOOKUP ["IND_F", "IND_C_F", "UK3CB_CCM_I", "UK3CB_TKA_I", "UK3CB_TKM_I", "UK3CB_TKP_I", "UK3CB_UN_I", "CUP_I_NAPA", "CUP_I_PMC_ION", "CUP_I_RACS", "CUP_I_TK_GUE", "CUP_I_UN", "LIB_US_ARMY", "LOP_IRAN", "LOP_NAPA", "LOP_PESH_IND", "LOP_PMC", "LOP_RACS", "LOP_UA", "LOP_UKR", "LOP_UN", "LOP_UVF", "rhsgref_faction_cdf_ground", "rhsgref_faction_chdkz_g", "rhsgref_faction_nationalist", "rhssaf_faction_army", "rhssaf_faction_un"]
#define WEST_FACTIONS_LOOKUP ["BLU_F", "BLU_T_F", "UK3CB_BAF_Faction_Army_Arctic", "UK3CB_BAF_Faction_Army_Desert", "UK3CB_BAF_Faction_Army_MTP", "UK3CB_BAF_Faction_Army_Temperate", "UK3CB_BAF_Faction_Army_Tropical", "UK3CB_BAF_Faction_Army_Woodland", "UK3CB_ANA_B", "UK3CB_ANP_B", "UK3CB_CCM_B", "UK3CB_TKA_B", "UK3CB_TKM_B", "UK3CB_TKP_B", "UK3CB_UN_B", "CUP_B_CZ", "CUP_B_GB", "CUP_B_GER", "CUP_B_US_Army", "LIB_WEHRMACHT", "OPTRE_UNSC", "LOP_AA", "LOP_IA", "rhs_faction_usarmy_d", "rhs_faction_usarmy_wd"]

params [["_side", ""], ["_pos", [0, 0, 0]]];

if ((_side isEqualTo "") || (_pos isEqualTo [0, 0, 0])) exitWith {
	["Couldn't process wrapper call", "ErrorLog"] call YAINA_fnc_log;
};

// Holds the array of factions that are available for selection, based on side
_availableFactions = [];

// Is used to match the selected faction with the the internal name, by index
_lookup = [];

switch (toLower _side) do {
	case "east": {
		_availableFactions = EAST_FACTIONS;
		_lookup = EAST_FACTIONS_LOOKUP;
	};
	case "independent": {
		_availableFactions = INDEP_FACTIONS;
		_lookup = INDEP_FACTIONS_LOOKUP;
	};
	case "west": {
		_availableFactions = WEST_FACTIONS;
		_lookup = WEST_FACTIONS_LOOKUP;
	};
	default {};
};

private _dialogResult = [
	format ["Spawn AI (%1)", _side],
	[
		["Objective Name", "", "Objective Alpha"],
		["Faction", _availableFactions],
		["Spawn Radius", "", "500"],
		["Min. Garrisoned Groups", "", "0"],
		["Max. Garrisoned Groups", "", "0"],
		["Min. Infantry Patrols", "", "0"],
		["Max. Infantry Patrols", "", "0"],
		["Min. AA Infantry Squads", "", "0"],
		["Max. AA Infantry Squads", "", "0"],
		["Min. AT Infantry Squads", "", "0"],
		["Max. AT Infantry Squads", "", "0"],
		["Min. Sniper Squads", "", "0"],
		["Max. Sniper Squads", "", "0"],
		["Min. AA Vehicles", "", "0"],
		["Max. AA Vehicles", "", "0"],
		["Min. MRAPS", "", "0"],
		["Max. MRAPS", "", "0"],
		["Min. Light Vehicles", "", "0"],
		["Max. Light Vehicles", "", "0"],
		["Min. Heavy Vehicles", "", "0"],
		["Max. Heavy Vehicles", "", "0"],
		["Min. Random Vehicles", "", "0"],
		["Max. Random Vehicles", "", "0"]
	]
] call Ares_fnc_showChooseDialog;

if (_dialogResult isEqualTo []) exitWith {
	["fn_ShowChooseDialog didn't return good results", "ErrorLog"] call YAINA_fnc_log;
};

_procDiagResults = [];

{
	_value = _x;

	// Look up the proper faction name in the lookup table
	if (_forEachIndex == 1) then {
		_value = _lookup select _x;
	};

	// Process number inputs and make sure they're integers
	if (_forEachIndex > 1) then {
		_value = round (parseNumber _x);
	};

	_procDiagResults pushBack _value;
} forEach _dialogResult;

_procDiagResults params [
	"_grpPrefix",
	"_faction",
	"_radius",
	"_garrisonsMin", "_garrisonsMax",
	"_infMin", "_infMax",
	"_infaaMin", "_infaaMax",
	"_infatMin", "_infatMax",
	"_sniperMin", "_sniperMax",
	"_vehaaMin", "_vehaaMax",
	"_vehmrapMin", "_vehmrapMax",
	"_vehlightMin", "_vehlightMax",
	"_vehheavyMin", "_vehheavyMax",
	"_vehrandMin", "_vehrandMax"
];

// Actually call SpawnAI, do it remotely so the server has the units and takes care of them c:
[
	_grpPrefix, _pos, _radius, _faction,
	[_garrisonsMin, _garrisonsMax],
	[_infMin, _infMax],
	[_infaaMin, _infaaMax],
	[_infatMin, _infatMax],
	[_sniperMin, _sniperMax],
	[_vehaaMin, _vehaaMax],
	[_vehmrapMin, _vehmrapMax],
	[_vehlightMin, _vehlightMax],
	[_vehheavyMin, _vehheavyMax],
	[_vehrandMin, _vehrandMax]
] remoteExec ["LR_fnc_SpawnAI", 2];