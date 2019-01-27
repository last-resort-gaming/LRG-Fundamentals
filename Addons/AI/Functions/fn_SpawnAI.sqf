/*
LRG MISSION TEMPLATE
	LR_fnc_SpawnAI.sqf
	Author: MitchJC, using functions from YAINA (MartinCo) and DERP (alganthe)
	Description: Used to populate an area with a predefined enemy faction. This function has a large list of parameters to adjust the number of enemies spawned. It's advised to use the numbers in this function sparingly. It's easy to spawn in huge numbers which could cause a temporary drop in frames. This function works best when executed prior to mission start but can be executed during the mission in the Debug Console for on the fly objectives.

	
	Syntax
	["Group Prefix Name",
	[_Position],
	_Radius,
	"_army",
	[_GarrisonGroupCount, _minRadius, _MaxRadius],
	[_MinInfAmmount, _MaxInfAmmount],
	[_MinAAInfAmmount, _MaxAAInfAmmount],
	[_MinATInfAmmount, _MaxATInfAmmount],
	[_MinVehAA, _MaxVehAA],
	[_MinVehMRAP, _MaxVehMRAP],
	[_MinVehRandom, _MaxVehRandom],
	[_MinVehLight, _MaxVehLight],
	[_MinVehHeavy, _MaxVehHeavy]
	] call LR_fnc_SpawnAI;
	
	Parameters
	_grpPrefix - The prefix for the group IDs
    _center - The center position of the area we want to populate
    _radius - The radius of the area we want to populate
    _army - The faction which we want to use for populating the AO
    _garrisons - Garrison Parameters,[Group Count, Min Radius, Max Radius, Skill Level of Garrisoned Units, Max Fill in Buildling, Exclusion List]
    _inf - Infantry Parameters,[Min Amount of Groups, Random Upper Bound of Groups]
    _infaa - AA Parameters,[Min Amount of Groups, Random Upper Bound of Groups]
    _infat - AT Parameters,[Min Amount of Groups, Random Upper Bound of Groups]
    _sniper - Sniper Parameters,[Min Amount of Groups, Random Upper Bound of Groups]
    _vehaa - Vehicle-based AA Parameters,[Min Amount of Groups, Random Upper Bound of Groups]
    _vehmrap - MRAP Parameters,[Min Amount of Groups, Random Upper Bound of Groups]
    _vehran - Random Vehicles Parameters,[Min Amount of Groups, Random Upper Bound of Groups]
    _vehlight - Light Vehicles Parameters,[Min Amount of Groups, Random Upper Bound of Groups]
    _vehheavy - Heavy/Armoured Vehicle Parameters,[Min Amount of Groups, Random Upper Bound of Groups]
	
	Example 1:
	--- Code
	["Objective 1",
	[2955.43,6010.11,0],
	500,
	"Sahrani Liberation Army",
	[5, 100, 200],
	[3, 5]
	] call LR_fnc_SpawnAI;
	Example 2:
	["Kavala",
	[2955.43,6010.11,0],
	500,
	"Chernarussian Red Star",
	[5, 200, 400],
	[5, 10],
	[2, 3],
	[3, 4],
	[2, 3],
	[4, 5],
	[2, 3],
	[2, 3],
	[5, 6]] call LR_fnc_SpawnAI;
	---

Available _army so far:
// Vanilla
"CSAT"
"CSAT Pacific"
"AAF"
"Syndikat"

// CUP
"TM" - Takistani Militia
"CRS" - Chernarussian Movement of the Red Star
"CUP AFRF" - Armed Forces of the Russian Federation
"SLA" - Sahrani Liberation Army
"TA" - Takistani Army
*/
if (!isserver) exitwith {};

params [
	"_grpPrefix", "_center", "_radius",
	["_army", "CSAT"],
	["_garrisons", [1,0,60, "LRG Default", 4, []]],
	["_inf", [3,3]],
	["_infaa", [0,0]],
	["_infat", [0,0]],
	["_sniper", [0,0]],
	["_vehaa", [0,0]],
	["_vehmrap", [0,0]],
	["_vehrand", [0,0]],
	["_vehlight", [0,0]],
	["_vehheavy", [0,0]]
];

_typeNameCenter = typeName _center;

call {
	if (_typeNameCenter isEqualTo "OBJECT") exitwith { _center = getPos _center;};
	if (_typeNameCenter isEqualTo "STRING") exitwith { _center = getMarkerPos _center;};
	if (_typeNameCenter isEqualTo [0, 0, 0]) exitwith {systemchat "AISpawns - Position is invalid";};

};

_center set [2, 0];

_garrisons params ["_garrisonGroupCount", ["_garrisonMinRad", 0], ["_garrisonMaxRad", 60], ["_garrisonSkill", 2], ["_garrisonFill", 4], ["_garrisonExcludes", []]];
_inf params ["_infMin", ["_infRand", 0], ["_infSkill", "LRG Default"]];
_infaa params ["_infaaMin", ["_infaaRand",0], ["_infaaSkill", "LRG Default"]];
_infat params ["_infatMin", ["_infatRand",0], ["_infatSkill", "LRG Default"]];
_sniper params ["_sniperMin", ["_sniperRand",0], ["_sniperSkill", "LRG Default"]];
_vehaa params ["_vehaaMin", ["_vehaaRand",0], ["_vehaaSkill", "LRG Default"]];
_vehmrap params ["_vehmrapMin", ["_vehmrapRand",0], ["_vehmrapSkill", "LRG Default"]];
_vehrand params ["_vehrandMin", ["_vehrandRand",0], ["_vehrandSkill", "LRG Default"]];
_vehlight params ["_vehlightMin", ["_vehlightRand",0], ["_vehlightSkill", "LRG Default"]];
_vehheavy params ["_vehheavyMin", ["_vehheavyRand",0], ["_vehheavySkill", "LRG Default"]];

///////////////////////////////////////////////////////////
// UNIT TYPES
///////////////////////////////////////////////////////////

private ["_side", "_infList", "_confBase", "_infaaList", "_infatList", "_sniperList", "_vehAAList", "_vehMrapList", "_vehRandList", "_vehLightList", "_vehHeavyList"];

// TODO: UAVs ?

call {
	
	_side = east;
	
	if (_army isEqualto "OPF_F") exitwith {
		_confBase     = configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry";
		_infList      = ["OIA_InfTeam","OI_reconPatrol"];
		_infaaList    = ["OIA_InfTeam_AA"];
		_infatList    = ["OIA_InfTeam_AT"];
		_sniperList   = ["OI_SniperTeam"];
		_vehAAList    = ["O_APC_Tracked_02_AA_F"];
		_vehMrapList  = ["O_MRAP_02_F", "O_MRAP_02_hmg_F", "O_MRAP_02_gmg_F", "O_LSV_02_armed_F", "O_Truck_03_transport_F", "O_Truck_03_covered_F"];
		_vehRandList  = ["O_APC_Tracked_02_cannon_F", "O_APC_Wheeled_02_rcws_F"];
		_vehLightList = ["O_LSV_02_armed_F", "O_G_Offroad_01_armed_F"];
		_vehHeavyList = ["O_MBT_02_cannon_F", "O_MBT_04_cannon_F", "O_MBT_04_command_F"];
	};
		
	if (_army isEqualto "OPF_T_F") exitwith {
		_confBase = configfile >> "CfgGroups" >> "East" >> "OPF_T_F" >> "Infantry";
		_infList = ("true" configClasses _confBase) apply { configName _x };
		_infaaList    = ["O_T_InfTeam_AA"];
		_infatList    = ["O_T_InfTeam_AT","O_T_InfTeam_AT_Heavy"];
		_sniperList   = ["O_T_SniperTeam"];
		_vehAAList    = ["O_T_APC_Tracked_02_AA_ghex_F"];
		_vehMrapList  = ["O_T_MRAP_02_ghex_F","O_T_MRAP_02_gmg_ghex_F","O_T_MRAP_02_hmg_ghex_F","O_T_LSV_02_AT_F","O_T_LSV_02_armed_F","O_T_LSV_02_unarmed_F"];
		_vehRandList  = ["O_T_APC_Tracked_02_cannon_ghex_F","O_T_APC_Wheeled_02_rcws_v2_ghex_F"];
		_vehLightList = ["O_T_LSV_02_armed_F","O_T_LSV_02_unarmed_F"];
		_vehHeavyList = ["O_T_MBT_02_cannon_ghex_F","O_T_MBT_04_cannon_F","O_T_MBT_04_command_F"];
	};

	if (_army isEqualto "IND_F") exitwith {
		_side = resistance;
		_confBase = configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry";
		_infList = ("true" configClasses _confBase) apply { configName _x };
		_infaaList    = ["HAF_InfTeam_AA"];
		_infatList    = ["HAF_InfTeam_AT"];
		_sniperList   = ["HAF_SniperTeam"];
		_vehAAList    = ["I_APC_Wheeled_03_cannon_F", "I_LT_01_AA_F"];
		_vehMrapList  = ["I_MRAP_03_F", "I_MRAP_03_gmg_F", "I_MRAP_03_hmg_F", "I_Truck_02_transport_F", "I_Truck_02_transport_F"];
		_vehRandList  = ["I_APC_Tracked_C03_cannon_F"];
		_vehLightList = ["I_G_Offroad_01_armed_F"];
		_vehHeavyList = ["I_MBT_03_cannon_F", "I_LT_01_AT_F", "I_LT_01_cannon_F"];
	};
	
	if (_army isEqualto "IND_C_F") exitwith {
		_side = resistance;
		_confBase = configfile >> "CfgGroups" >> "Indep" >> "IND_C_F" >> "Infantry";
		_infList = ("true" configClasses _confBase) apply { configName _x };
		_infaaList    = [];
		_infatList    = [];
		_sniperList   = [];
		_vehAAList    = ["I_APC_Wheeled_03_cannon_F"];
		_vehMrapList  = ["I_MRAP_03_F", "I_MRAP_03_gmg_F", "I_MRAP_03_hmg_F", "I_Truck_02_transport_F", "I_Truck_02_transport_F"];
		_vehRandList  = ["I_APC_Tracked_C03_cannon_F"];
		_vehLightList = ["I_G_Offroad_01_armed_F"];
		_vehHeavyList = ["I_MBT_03_cannon_F", "I_LT_01_AT_F", "I_LT_01_cannon_F"];
	};
	
	if (_army isEqualto "CUP_O_TK_MILITIA") exitwith {
		_confBase = configfile >> "CfgGroups" >> "East" >> "CUP_O_TK_MILITIA" >> "Infantry";
		_infList = ("true" configClasses _confBase) apply { configName _x };
		_infaaList    = ["CUP_O_TK_INS_Soldier_AA"];
		_infatList    = ["CUP_O_TK_INS_Soldier_AT"];
		_sniperList   = ["CUP_O_TK_INS_Sniper"];
		_vehAAList    = ["CUP_O_Ural_ZU23_TKM"];
		_vehMrapList  = ["CUP_O_BTR40_TKM", "CUP_O_BTR40_MG_TKM"];
		_vehRandList  = ["CUP_O_LR_MG_TKM","CUP_O_LR_SPG9_TKM","CUP_O_LR_Transport_TKM","CUP_O_V3S_Open_TKM","CUP_O_V3S_Covered_TKM"];
		_vehLightList = ["CUP_O_LR_MG_TKM","CUP_O_LR_SPG9_TKM","CUP_O_LR_Transport_TKM","CUP_O_V3S_Open_TKM","CUP_O_V3S_Covered_TKM"];
		_vehHeavyList = [];
	};
	
	if (_army isEqualto "CUP_O_ChDKZ") exitwith {
		_confBase = configfile >> "CfgGroups" >> "East" >> "CUP_O_ChDKZ" >> "Infantry";
		_infList = ("true" configClasses _confBase) apply { configName _x };
		_infaaList    = ["CUP_O_INS_Soldier_AA"];
		_infatList    = ["CUP_O_INS_Soldier_AT"];
		_sniperList   = ["CUP_O_INS_Sniper"];
		_vehAAList    = ["CUP_O_Ural_ZU23_CHDKZ", "CUP_O_ZSU23_Afghan_ChDKZ", "CUP_O_ZSU23_ChDKZ"];
		_vehMrapList  = ["CUP_O_BMP2_CHDKZ","CUP_O_BMP_HQ_CHDKZ","CUP_O_BMP2_AMB_CHDKZ","CUP_O_BRDM2_CHDKZ","CUP_O_BRDM2_HQ_CHDKZ","CUP_O_BRDM2_ATGM_CHDKZ"];
		_vehRandList  = ["CUP_O_UAZ_SPG9_CHDKZ","CUP_O_UAZ_MG_CHDKZ"];
		_vehLightList = ["CUP_O_Datsun_PK","CUP_O_Datsun_PK_Random","CUP_O_UAZ_METIS_CHDKZ","CUP_O_UAZ_SPG9_CHDKZ","CUP_O_UAZ_MG_CHDKZ"];
		_vehHeavyList = ["CUP_O_T72_CHDKZ"];
	};
	
	if (_army isEqualto "CUP_O_RU") exitwith {
		_confBase		= configfile >> "CfgGroups" >> "East" >> "CUP_O_RU" >> "Infantry";
		_infList 		= ["CUP_O_RU_InfSection","CUP_O_RU_InfSection_EMR","CUP_O_RU_InfSection_MG","CUP_O_RU_InfSection_MG_EMR","CUP_O_RU_InfSection_MG_VDV","CUP_O_RU_InfSection_MG_VDV_EMR","CUP_O_RU_InfSection_VDV","CUP_O_RU_InfSection_VDV_EMR","CUP_O_RU_InfSquad","CUP_O_RU_InfSquad_EMR","CUP_O_RU_InfSquad_VDV","CUP_O_RU_InfSquad_VDV_EMR"];
		_infaaList		= ["CUP_O_RU_Soldier_AA_EMR","CUP_O_RU_Soldier_AA"];
		_infatList    	= ["CUP_O_RU_Soldier_AT","CUP_O_RU_Soldier_LAT","CUP_O_RU_Soldier_HAT","CUP_O_RU_Soldier_HAT_EMR","CUP_O_RU_Soldier_AT_EMR","CUP_O_RU_Soldier_LAT_EMR"];
		_sniperList   	= ["CUP_O_RU_Sniper_EMR","CUP_O_RU_Sniper_KSVK_EMR","CUP_O_RU_Sniper","CUP_O_RU_Sniper_KSVK","CUP_O_RU_Spotter","CUP_O_RU_Spotter_EMR"];
		_vehAAList    	= ["CUP_O_2S6_RU","CUP_O_2S6M_RU","CUP_O_Ural_ZU23_RU"];
		_vehMrapList  	= ["CUP_O_BMP2_RU","CUP_O_BMP_HQ_RU","CUP_O_BMP2_AMB_RU","CUP_O_BMP3_RU","CUP_O_BRDM2_RUS","CUP_O_BRDM2_ATGM_RUS","CUP_O_BRDM2_HQ_RUS","CUP_O_BTR90_RU","CUP_O_BTR90_HQ_RU","CUP_O_GAZ_Vodnik_PK_RU","CUP_O_GAZ_Vodnik_AGS_RU","CUP_O_GAZ_Vodnik_BPPU_RU","CUP_O_GAZ_Vodnik_MedEvac_RU"];
		_vehRandList  	= ["CUP_O_UAZ_MG_RU","CUP_O_GAZ_Vodnik_BPPU_RU","CUP_O_BRDM2_RUS","CUP_O_BMP2_RU"];
		_vehLightList	= ["CUP_O_UAZ_Unarmed_RU","CUP_O_UAZ_MG_RU","CUP_O_UAZ_AMB_RU","CUP_O_UAZ_METIS_RU","CUP_O_UAZ_Open_RU","CUP_O_UAZ_SPG9_RU","CUP_O_Ural_RU","CUP_O_Ural_Open_RU"];
		_vehHeavyList 	= ["CUP_O_T72_RU","CUP_O_T90_RU"];
	};
	
	if (_army isEqualto "CUP_O_SLA") exitwith {
		_confBase     = configfile >> "CfgGroups" >> "East" >> "CUP_O_SLA" >> "Infantry";
		_infList = ("true" configClasses _confBase) apply { configName _x };
		_infaaList    = ["CUP_O_sla_Soldier_AA", "CUP_O_sla_Soldier_AA_desert"];
		_infatList    = ["CUP_O_sla_Soldier_HAT", "CUP_O_sla_Soldier_LAT", "CUP_O_sla_Soldier_AT", "CUP_O_sla_Soldier_AAT_desert", "CUP_O_sla_Soldier_LAT_desert", "CUP_O_sla_Soldier_AT_desert", "CUP_O_Partisans_Soldier_AT"];
		_sniperList   = ["CUP_O_sla_Sniper", "CUP_O_sla_Sniper_KSVK", "CUP_O_SLA_Sniper_SVD_Night", "CUP_O_SLA_Spotter", "CUP_O_sla_Sniper_desert", "CUP_O_sla_Sniper_KSVK_desert", "CUP_O_SLA_Sniper_SVD_Night_desert", "CUP_O_SLA_Spotter_desert"];
		_vehAAList    = ["CUP_O_Ural_ZU23_SLA", "CUP_O_ZSU23_SLA", "CUP_O_ZSU23_Afghan_SLA"];
		_vehMrapList  = ["CUP_O_BMP2_SLA", "CUP_O_BMP_HQ_sla", "CUP_O_BMP2_AMB_sla", "CUP_O_BRDM2_SLA", "CUP_O_BRDM2_ATGM_SLA", "CUP_O_BRDM2_HQ_SLA", "CUP_O_BTR60_SLA"];
		_vehRandList  = ["CUP_O_UAZ_MG_SLA", "CUP_O_UAZ_METIS_SLA", "CUP_O_BTR60_SLA"];
		_vehLightList = ["CUP_O_UAZ_Unarmed_SLA", "CUP_O_UAZ_MG_SLA", "CUP_O_UAZ_METIS_SLA", "CUP_O_UAZ_Militia_SLA", "CUP_O_UAZ_SPG9_SLA", "CUP_O_Ural_SLA", "CUP_O_Ural_Open_SLA"];
		_vehHeavyList = ["CUP_O_T55_SLA", "CUP_O_T72_SLA"];
	};
	
	if (_army isEqualto "CUP_O_TK") exitwith {
		_confBase = configfile >> "CfgGroups" >> "East" >> "CUP_O_TK" >> "Infantry" ;
		_infList = ("true" configClasses _confBase) apply { configName _x };
		_infaaList    = ["CUP_O_TK_Soldier_AA"];
		_infatList    = ["CUP_O_TK_Soldier_HAT", "CUP_O_TK_Soldier_AT", "CUP_O_TK_Soldier_LAT"];
		_sniperList   = ["CUP_O_TK_Sniper", "CUP_O_TK_Sniper_KSVK", "CUP_O_TK_Spotter", "CUP_O_TK_Sniper_SVD_Night"];
		_vehAAList    = ["CUP_O_Ural_ZU23_TKA", "CUP_O_ZSU23_TK", "CUP_O_ZSU23_Afghan_TK"];
		_vehMrapList  = ["CUP_O_BMP1_TKA", "CUP_O_BMP1P_TKA", "CUP_O_BMP2_TKA", "CUP_O_BMP_HQ_TKA", "CUP_O_BMP2_AMB_TKA", "CUP_O_BMP2_ZU_TKA", "CUP_O_BRDM2_TKA", "CUP_O_BRDM2_ATGM_TKA", "CUP_O_BRDM2_HQ_TKA", "CUP_O_BTR40_MG_TKA", "CUP_O_BTR40_TKA", "CUP_O_BTR60_TK", "CUP_O_M113_TKA", "CUP_O_M113_Med_TKA"];
		_vehRandList  = ["CUP_O_LR_MG_TKA", "CUP_O_LR_SPG9_TKA", "CUP_O_BMP1_TKA", "CUP_O_BMP1P_TKA"];
		_vehLightList = ["CUP_O_LR_MG_TKA", "CUP_O_LR_SPG9_TKA", "CUP_O_LR_Transport_TKA", "CUP_O_V3S_Open_TKA", "CUP_O_V3S_Covered_TKA", "CUP_O_UAZ_Unarmed_TKA", "CUP_O_UAZ_MG_TKA", "CUP_O_UAZ_METIS_TKA", "CUP_O_UAZ_Open_TKA", "CUP_O_Ural_TKA"];
		_vehHeavyList = ["CUP_O_T72_TKA", "CUP_O_T55_TK", "CUP_O_T34_TKA"];
	};

	if (_army isEqualto "rhsgref_faction_chdkz") exitwith {
		_confBase = configfile >> "CfgGroups" >> "East" >> "rhsgref_faction_chdkz" >> "rhsgref_group_chdkz_insurgents_infantry";
		_infList	  =	["rhsgref_group_chdkz_infantry_mg","rhsgref_group_chdkz_infantry_patrol","rhsgref_group_chdkz_insurgents_squad"];
		_infaaList    = ["rhsgref_ins_specialist_aa"];
		_infatList    = ["rhsgref_ins_grenadier_rpg","rhsgref_ins_rifleman_RPG26"];
		_sniperList   = ["rhsgref_ins_sniper", "rhsgref_ins_spotter"];
		_vehAAList    = ["rhsgref_ins_zsu234","rhsgref_ins_gaz66_zu23","rhsgref_ins_ural_Zu23"];
		_vehMrapList  = ["rhsgref_BRDM2_ins","rhsgref_BRDM2_ATGM_ins","rhsgref_BRDM2UM_ins","rhsgref_BRDM2_HQ_ins"];
		_vehRandList  = ["rhsgref_BRDM2_ins","rhsgref_BRDM2_ATGM_ins","rhsgref_BRDM2UM_ins","rhsgref_BRDM2_HQ_ins"];
		_vehLightList = ["rhsgref_ins_ural_Zu23","rhsgref_ins_ural_work_open","rhsgref_ins_ural_work","rhsgref_ins_ural_open","rhsgref_ins_ural","rhsgref_ins_gaz66_repair","rhsgref_ins_gaz66_ap2","rhsgref_ins_gaz66_r142","rhsgref_ins_gaz66o_flat","rhsgref_ins_gaz66o","rhsgref_ins_gaz66_flat","rhsgref_ins_gaz66_ammo","rhsgref_ins_gaz66"];
		_vehHeavyList = ["rhsgref_ins_bmp2k","rhsgref_ins_bmp2d","rhsgref_ins_bmp2","rhsgref_ins_bmp2e","rhsgref_ins_bmp1p","rhsgref_ins_bmp1k","rhsgref_ins_bmp1d","rhsgref_ins_bmd1p","rhsgref_ins_bmd1","rhsgref_ins_bmp1","rhsgref_ins_bmd2","rhsgref_ins_t72ba","rhsgref_ins_t72bb","rhsgref_ins_t72bc"];
	};

	if (_army isEqualto "rhs_faction_msv") exitwith {
		_confBase = configfile >> "CfgGroups" >> "East" >> "rhs_faction_msv" >> "rhs_group_rus_msv_infantry";
		_infList	  =	["rhs_group_rus_msv_infantry_chq", "rhs_group_rus_msv_infantry_fireteam", "rhs_group_rus_msv_infantry_MANEUVER", "rhs_group_rus_msv_infantry_section_marksman", "rhs_group_rus_msv_infantry_section_mg", "rhs_group_rus_msv_infantry_squad", "rhs_group_rus_msv_infantry_squad_2mg", "rhs_group_rus_msv_infantry_squad_mg_sniper", "rhs_group_rus_msv_infantry_squad_sniper"];
		_infaaList    = ["rhs_msv_emr_aa"];
		_infatList    = ["rhs_msv_emr_at","rhs_msv_emr_RShG2","rhs_msv_emr_LAT","rhs_msv_emr_grenadier_rpg"];
		_sniperList   = ["rhs_msv_emr_marksman"];
		_vehAAList    = ["RHS_Ural_Zu23_MSV_01","rhs_gaz66_zu23_msv"];
		_vehMrapList  = ["rhs_bmp1_msv","rhs_bmp1d_msv","rhs_bmp1k_msv","rhs_bmp1p_msv","rhs_bmp2e_msv","rhs_bmp2_msv","rhs_bmp2d_msv","rhs_bmp2k_msv","rhs_bmp2k_msv","rhs_brm1k_msv","rhs_Ob_681_2","rhs_prp3_msv"];
		_vehRandList  = ["RHS_BM21_MSV_01","rhs_gaz66_msv","rhs_gaz66_flat_msv","rhs_gaz66o_msv","rhs_gaz66o_flat_msv","rhs_gaz66_ammo_msv","rhs_gaz66_r142_msv","rhs_gaz66_ap2_msv","rhs_kamaz5350_msv","rhs_kamaz5350_flatbed_cover_msv","rhs_kamaz5350_open_msv","rhs_kamaz5350_flatbed_msv","RHS_Ural_MSV_01","RHS_Ural_Flat_MSV_01","RHS_Ural_Fuel_MSV_01","RHS_Ural_Open_MSV_01","RHS_Ural_Repair_MSV_01","rhs_zil131_msv","rhs_zil131_flatbed_cover_msv","rhs_zil131_open_msv","rhs_zil131_flatbed_msv"];
		_vehLightList = ["rhs_tigr_msv","rhs_tigr_3camo_msv","rhs_tigr_sts_msv","rhs_tigr_sts_3camo_msv","rhs_tigr_m_msv","rhs_tigr_m_3camo_msv","RHS_UAZ_MSV_01","rhs_uaz_open_MSV_01"];
		_vehHeavyList = ["rhs_bmp3_msv","rhs_bmp3_late_msv","rhs_bmp3mera_msv"];
	};
	if (_army isEqualto "rhs_faction_vdv") exitwith {
		_confBase = configfile >> "CfgGroups" >> "East" >> "rhs_faction_vdv" >> "rhs_group_rus_vdv_infantry";
		_infList	  =	["rhs_group_rus_vdv_infantry_chq", "rhs_group_rus_vdv_infantry_fireteam", "rhs_group_rus_vdv_infantry_MANEUVER", "rhs_group_rus_vdv_infantry_section_marksman", "rhs_group_rus_vdv_infantry_section_mg", "rhs_group_rus_vdv_infantry_squad", "rhs_group_rus_vdv_infantry_squad_2mg", "rhs_group_rus_vdv_infantry_squad_mg_sniper", "rhs_group_rus_vdv_infantry_squad_sniper"];
		_infaaList    = ["rhs_vdv_aa"];
		_infatList    = ["rhs_vdv_at","rhs_vdv_RShG2","rhs_vdv_LAT","rhs_vdv_grenadier_rpg"];
		_sniperList   = ["rhs_vdv_marksman","rhs_vdv_marksman_asval"];
		_vehAAList    = ["rhs_gaz66_zu23_vdv","RHS_Ural_Zu23_VDV_01"];
		_vehMrapList  = ["rhs_bmp1_vdv","rhs_bmp1d_vdv","rhs_bmp1k_vdv","rhs_bmp1p_vdv","rhs_bmp2e_vdv","rhs_bmp2_vdv","rhs_bmp2d_vdv","rhs_bmp2k_vdv","rhs_brm1k_vdv","rhs_prp3_vdv"];
		_vehRandList  = ["RHS_BM21_vdv_01","rhs_gaz66_vdv","rhs_gaz66_flat_vdv","rhs_gaz66o_vdv","rhs_gaz66o_flat_vdv","rhs_gaz66_ammo_vdv","rhs_gaz66_r142_vdv","rhs_gaz66_ap2_vdv","rhs_kamaz5350_vdv","rhs_kamaz5350_flatbed_cover_vdv","rhs_kamaz5350_open_vdv","rhs_kamaz5350_flatbed_vdv","RHS_Ural_vdv_01","RHS_Ural_Flat_vdv_01","RHS_Ural_Fuel_vdv_01","RHS_Ural_Open_vdv_01","RHS_Ural_Repair_vdv_01","rhs_zil131_vdv","rhs_zil131_flatbed_cover_vdv","rhs_zil131_open_vdv","rhs_zil131_flatbed_vdv"];
		_vehLightList = ["rhs_tigr_vdv","rhs_tigr_3camo_vdv","rhs_tigr_sts_vdv","rhs_tigr_sts_3camo_vdv","rhs_tigr_m_vdv","rhs_tigr_m_3camo_vdv","RHS_UAZ_vdv_01","rhs_uaz_open_vdv_01"];
		_vehHeavyList = ["rhs_btr60_vdv","rhs_btr70_vdv","rhs_btr80_vdv","rhs_btr80a_vdv", "rhs_sprut_vdv"];
	};
	if (_army isEqualto "rhs_faction_vmf") exitwith {
		_confBase = configfile >> "CfgGroups" >> "East" >> "rhs_faction_vmf" >> "rhs_group_rus_vmf_infantry"; 
		_infList	  =	["rhs_group_rus_vmf_infantry_chq","rhs_group_rus_vmf_infantry_fireteam","rhs_group_rus_vmf_infantry_MANEUVER","rhs_group_rus_vmf_infantry_section_marksman","rhs_group_rus_vmf_infantry_section_mg","rhs_group_rus_vmf_infantry_squad","rhs_group_rus_vmf_infantry_squad_2mg","rhs_group_rus_vmf_infantry_squad_mg_sniper","rhs_group_rus_vmf_infantry_squad_sniper"];
		_infaaList    = ["rhs_vmf_flora_aa"];
		_infatList    = ["rhs_vmf_flora_RShG2","rhs_vmf_flora_LAT","rhs_vmf_flora_at"];
		_sniperList   = ["rhs_vmf_flora_marksman"];
		_vehAAList    = ["RHS_Ural_Zu23_VMF_01","rhs_gaz66_zu23_vmf"];
		_vehMrapList  = ["rhs_btr60_vmf","rhs_btr70_vmf","rhs_btr80_vmf","rhs_pts_vmf","rhs_btr80a_vmf"];
		_vehRandList  = ["rhs_btr60_vmf","rhs_btr70_vmf","rhs_tigr_vmf","rhs_tigr_3camo_vmf","rhs_bmp1_vmf","rhs_bmp1d_vmf"];
		_vehLightList = ["rhs_tigr_vmf","rhs_tigr_3camo_vmf","rhs_tigr_sts_vmf","rhs_tigr_sts_3camo_vmf","rhs_tigr_m_vmf","rhs_tigr_m_3camo_vmf","rhs_uaz_vmf","rhs_uaz_open_vmf"];
		_vehHeavyList = ["rhs_bmp1_vmf","rhs_bmp1d_vmf","rhs_bmp1k_vmf","rhs_bmp1p_vmf","rhs_bmp2e_vmf","rhs_bmp2_vmf","rhs_bmp2d_vmf","rhs_bmp2k_vmf","rhs_brm1k_vmf","rhs_prp3_vmf"];
	};			
		if (_army isEqualto "OPTRE_Ins") exitwith {
		_confBase     = configfile >> "CfgGroups" >> "East" >> "OPTRE_Ins" >> "Infantry_URF";
		_infList      = ["OPTRE_Ins_URF_Inf_CmdSquad","OPTRE_Ins_URF_Inf_Fireteam", "OPTRE_Ins_URF_Inf_RifleSquad", "OPTRE_Ins_URF_Inf_Sentry"];
		_infaaList    = ["OPTRE_Ins_URF_Inf_AntiAir"];
		_infatList    = ["OPTRE_Ins_URF_Inf_AntiTank"];
		_sniperList   = ["OPTRE_Ins_URF_Inf_Sniper"];
		_vehAAList    = ["OPTRE_M12R_AA_ins"];
		_vehMrapList  = ["OPTRE_M12A1_LRV_ins","OPTRE_M12_LRV_ins","OPTRE_M12_FAV_APC","OPTRE_M12_FAV_ins","OPTRE_M914_RV_ins"];
		_vehRandList  = ["OPTRE_m1015_mule_ins","OPTRE_M12_FAV_APC","OPTRE_M12_FAV_ins","OPTRE_M12_LRV_ins","OPTRE_M12A1_LRV_ins","OPTRE_M12R_AA_ins","OPTRE_M274_ATV_Ins","OPTRE_M914_RV_ins"];
		_vehLightList = ["OPTRE_m1015_mule_ins","OPTRE_M12_FAV_ins","OPTRE_M274_ATV_Ins","OPTRE_M914_RV_ins"];
		_vehHeavyList = ["OPTRE_M12_LRV_ins","OPTRE_M12A1_LRV_ins"];
	};

	if (_army isEqualto "CSAT TEC_CSAT") exitwith {
		_confBase = configfile >> "CfgGroups" >> "East" >> "TEC_CSAT" >> "TEC_Infantry_SA";
		_infList      = ["TEC_AssaultSquad_SA","TEC_InfSquad_SA","TEC_WeapSquad_SA"];
		_infaaList    = ["TEC_AATeam_SA"];
		_infatList    = ["TEC_ATTeam_SA"];
		_sniperList   = ["TEC_O_Sniper_Scout_F","TEC_O_Spotter_Scout_F"];
		_vehAAList    = ["TEC_VH_APC_Kamysh_AA_F"];
		_vehMrapList  = ["TEC_VH_APC_Kamysh_F","TEC_VH_APC_Marid_F"];
		_vehRandList  = ["TEC_VH_MRAP_Abda_HMG","TEC_VH_MRAP_Shir_GMG","TEC_VH_MRAP_Shir_HMG","TEC_VH_LSV_Qilin_SOF_Armed","TEC_VH_APC_Marid_F"];
		_vehLightList = ["TEC_VH_MRAP_Abda_HMG","TEC_VH_MRAP_Shir_GMG","TEC_VH_MRAP_Shir_HMG","TEC_VH_LSV_Qilin_SOF_Armed"];
		_vehHeavyList = ["TEC_VH_Tank_Angara","TEC_VH_Tank_Varsuk_F"];
	};
	
	
		if (_army isEqualto "TEC_CSAT_Pacific") exitwith {
		_confBase = configfile >> "CfgGroups" >> "East" >> "TEC_CSAT_Pacific" >> "TEC_Infantry_WL";
		_infList      = ["TEC_AssaultSquad_WL","TEC_InfSquad_WL","TEC_InfTeam_WL"];
		_infaaList    = ["TEC_AATeam_WL"];
		_infatList    = ["TEC_ATTeam_WL"];
		_sniperList   = ["TEC_O_Sniper_Woodland_Scout_F","TEC_O_Spotter_Woodland_Scout_F"];
		_vehAAList    = ["TEC_VH_WD_APC_Kamysh_AA"];
		_vehMrapList  = ["TEC_VH_WD_APC_Kamysh","TEC_VH_WD_APC_Marid"];
		_vehRandList  = ["TEC_VH_WD_APC_Marid","TEC_VH_WD_MRAP_Abda_GMG","TEC_VH_WD_MRAP_Abda_HMG","TEC_VH_WD_LSV_Qilin_Armed","TEC_VH_WD_MRAP_Shir_GMG","TEC_VH_WD_MRAP_Shir_HMG"];
		_vehLightList = ["TEC_VH_WD_MRAP_Abda_GMG","TEC_VH_WD_MRAP_Abda_HMG","TEC_VH_WD_LSV_Qilin_Armed","TEC_VH_WD_MRAP_Shir_GMG","TEC_VH_WD_MRAP_Shir_HMG"];
		_vehHeavyList = ["TEC_VH_WD_Tank_Angara","TEC_VH_WD_Tank_Angara_Command","TEC_VH_WD_Tank_Varsuk"];
	};
		
};

private ["_x","_g","_pos","_flatPos","_rpos","_v"];

// Simple protection for broken requests
if (_center isEqualTo [0,0]) exitWith {};

// Prep return values
private _units = [];
private _vehicles = [];

///////////////////////////////////////////////////////////
// GARRISONS
///////////////////////////////////////////////////////////

if (_garrisonGroupCount > 0) then {
    private _garrisonedUnits = ([_center, [_garrisonMinRad, _garrisonMaxRad], _army, _garrisonGroupCount, nil, _garrisonSkill, _garrisonFill, _garrisonExcludes] call LR_fnc_infantryGarrison);
    _units append _garrisonedUnits;

    private _grps = [];
    { _grps pushBackUnique (group _x); nil } count _units;

    // tag groups
    { _x setGroupIdGlobal [format["%1_gar%2", _grpPrefix, _forEachIndex]]; } forEach _grps;
};

///////////////////////////////////////////////////////////
// STANDARD INFANTRY
///////////////////////////////////////////////////////////
if !(_infList isEqualTo []) then {
    for "_x" from 1 to (_infMin + floor(random (_infRand+1))) do {
        _rpos = [[[_center, _radius],[]],["water"]] call BIS_fnc_randomPos;
        _g = [_rpos, _side, _confBase >> (selectRandom _infList)] call BIS_fnc_spawnGroup;
        _g setGroupIdGlobal [format["%1_inf%2", _grpPrefix, _x]];
        [_g, _center, _radius/1.5, 3 + round (random 2), ["SAD", "MOVE"] select (random 1 > 0.33), ["AWARE", "SAFE"] select (random 1 > 0.5), ["red", "white"] select (random 1 > 0.2), ["limited", "normal"] select (random 1 > 0.5)] call CBA_fnc_taskPatrol;
        [_g, _infSkill] call LR_fnc_SetUnitSkill;
        _units append (units _g);
    };
};

///////////////////////////////////////////////////////////
// AA INFANTRY
///////////////////////////////////////////////////////////

if !(_infaaList isEqualTo []) then {
    for "_x" from 1 to (_infaaMin + floor(random (_infaaRand+1))) do {
        _rpos = [[[_center, _radius],[]],["water"]] call BIS_fnc_randomPos;
        _g = [_rpos, _side, _confBase >> (selectRandom _infaaList)] call BIS_fnc_spawnGroup;
        _g setGroupIdGlobal [format["%1_infaa%2", _grpPrefix, _x]];
        [_g, _center, _radius/1.5, 3 + round (random 2), "SAD", ["AWARE", "SAFE"] select (random 1 > 0.5), ["red", "white"] select (random 1 > 0.2), ["limited", "normal"] select (random 1 > 0.5)] call CBA_fnc_taskPatrol;
        [_g, _infaaSkill] call LR_fnc_SetUnitSkill;
        _units append (units _g);
    };
};

///////////////////////////////////////////////////////////
// AT INFANTRY
///////////////////////////////////////////////////////////

if !(_infatList isEqualTo []) then {
    for "_x" from 1 to (_infatMin + floor(random (_infatRand+1))) do {
        _rpos = [[[_center, _radius],[]],["water"]] call BIS_fnc_randomPos;
        _g = [_rpos, _side, _confBase >> (selectRandom _infatList)] call BIS_fnc_spawnGroup;
        _g setGroupIdGlobal [format["%1_infat%2", _grpPrefix, _x]];
        [_g, _center, _radius/1.5, 3 + round (random 2), "SAD", ["AWARE", "SAFE"] select (random 1 > 0.5), ["red", "white"] select (random 1 > 0.2), ["limited", "normal"] select (random 1 > 0.5)] call CBA_fnc_taskPatrol;
        [_g, _infatSkill] call LR_fnc_SetUnitSkill;
        _units append (units _g);
    };
};

///////////////////////////////////////////////////////////
// SNIPER TEAMS
///////////////////////////////////////////////////////////
if !(_sniperList isEqualTo []) then {
    for "_x" from 1 to (_sniperMin + floor(random (_sniperRand+1))) do {
        _rpos = [_center, _radius, 100, 20] call BIS_fnc_findOverwatch;
        _g = [_rpos, _side, _confBase >> (selectRandom _sniperList)] call BIS_fnc_spawnGroup;
        _g setGroupIdGlobal [format["%1_sniper%2", _grpPrefix, _x]];
        _g setBehaviour "COMBAT";
        _g setCombatMode "RED";
        [_g, _sniperSkill] call LR_fnc_SetUnitSkill;
        _units append (units _g);
    };
};

///////////////////////////////////////////////////////////
// AA
///////////////////////////////////////////////////////////

if !(_vehAAList isEqualTo []) then {
    for "_x" from 1 to (_vehaaMin + floor(random (_vehaaRand+1))) do {

        _g = createGroup _side;
        _g setGroupIdGlobal [format ["%1_VehAA%2", _grpPrefix, _x]];

        _rpos = [[[_center, _radius], []], ["water"], { !(_this isFlatEmpty [2,-1,0.5,1,0,false,objNull] isEqualTo []) }] call BIS_fnc_randomPos;

        if !(_rpos isEqualTo [0,0]) then {
            _v = (selectRandom _vehAAList) createVehicle _rpos ;
            _v lock 2;

            [_v, _g] call BIS_fnc_spawnCrew;
            [_g, _center, _radius / 2, 3 + round (random 2), "MOVE", ["AWARE", "SAFE"] select (random 1 > 0.5), ["red", "white"] select (random 1 > 0.2), ["limited", "normal"] select (random 1 > 0.5)] call CBA_fnc_taskPatrol;
            [_g, _vehaaSkill] call LR_fnc_SetUnitSkill;
            if (random 1 >= 0.5) then { _v allowCrewInImmobile true; };

            _units append (units _g);
            _vehicles pushBack _v;
        };
    };
};

///////////////////////////////////////////////////////////
// MRAP
///////////////////////////////////////////////////////////

if !(_vehmrapList isEqualTo []) then {
    for "_x" from 1 to (_vehmrapMin + floor(random (_vehmrapRand+1))) do {

        _g = createGroup _side;
        _g setGroupIdGlobal [format ["%1_vehmrap%2", _grpPrefix, _x]];

        _rpos = [[[_center, _radius], []], ["water"], { !(_this isFlatEmpty [2,-1,0.5,1,0,false,objNull] isEqualTo []) }] call BIS_fnc_randomPos;

        if !(_rpos isEqualTo [0,0]) then {
            _v = (selectRandom _vehmrapList) createVehicle _rpos ;
            _v lock 3;

            [_v, _g] call BIS_fnc_spawnCrew;
            [_g, _center, _radius / 2, 3 + round (random 2), "MOVE", ["AWARE", "SAFE"] select (random 1 > 0.5), ["red", "white"] select (random 1 > 0.2), ["limited", "normal"] select (random 1 > 0.5)] call CBA_fnc_taskPatrol;
            [_g, _vehmrapSkill] call LR_fnc_SetUnitSkill;
            if (random 1 >= 0.5) then { _v allowCrewInImmobile true; };

            _units append (units _g);
            _vehicles pushBack _v;
        };
    };
};

///////////////////////////////////////////////////////////
// RANDOM VEHS
///////////////////////////////////////////////////////////

if (_vehRandList isEqualTo []) then {
    for "_x" from 1 to (_vehrandMin + floor(random (_vehrandRand+1))) do {

        _g = createGroup _side;
        _g setGroupIdGlobal [format ["%1_vehrand%2", _grpPrefix, _x]];

        _rpos = [[[_center, _radius], []], ["water"], { !(_this isFlatEmpty [2,-1,0.5,1,0,false,objNull] isEqualTo []) }] call BIS_fnc_randomPos;

        if !(_rpos isEqualTo [0,0]) then {
            _v = (selectRandom _vehRandList) createVehicle _rpos ;
            _v lock 3;

            [_v, _g] call BIS_fnc_spawnCrew;
            [_g, _center, _radius / 2, 3 + round (random 2), "MOVE", ["AWARE", "SAFE"] select (random 1 > 0.5), ["red", "white"] select (random 1 > 0.2), ["limited", "normal"] select (random 1 > 0.5)] call CBA_fnc_taskPatrol;
            [_g, _vehrandSkill] call LR_fnc_SetUnitSkill;
            if (random 1 >= 0.5) then { _v allowCrewInImmobile true; };

            _units append (units _g);
            _vehicles pushBack _v;
        };
    };
};

///////////////////////////////////////////////////////////
// LIGHT VEHS
///////////////////////////////////////////////////////////

if (_vehLightList isEqualTo []) then {
    for "_x" from 1 to (_vehLightMin + floor(random (_vehLightRand+1))) do {

        _g = createGroup _side;
        _g setGroupIdGlobal [format ["%1_vehLight%2", _grpPrefix, _x]];

        _rpos = [[[_center, _radius], []], ["water"], { !(_this isFlatEmpty [2,-1,0.5,1,0,false,objNull] isEqualTo []) }] call BIS_fnc_randomPos;

        if !(_rpos isEqualTo [0,0]) then {
            _v = (selectRandom _vehLightList) createVehicle _rpos ;
            _v lock 3;

            [_v, _g] call BIS_fnc_spawnCrew;
            [_g, _center, _radius / 2, 3 + round (random 2), "MOVE", ["AWARE", "SAFE"] select (random 1 > 0.5), ["red", "white"] select (random 1 > 0.2), ["limited", "normal"] select (random 1 > 0.5)] call CBA_fnc_taskPatrol;
            [_g, _vehLightSkill] call LR_fnc_SetUnitSkill;
            if (random 1 >= 0.5) then { _v allowCrewInImmobile true; };

            _units append (units _g);
            _vehicles pushBack _v;
        };
    };
};

///////////////////////////////////////////////////////////
// RANDOM VEHS
///////////////////////////////////////////////////////////

if (_vehHeavyList isEqualTo []) then {
    for "_x" from 1 to (_vehHeavyMin + floor(random (_vehHeavyRand+1))) do {

        _g = createGroup _side;
        _g setGroupIdGlobal [format ["%1_vehHeavy%2", _grpPrefix, _x]];

        _rpos = [[[_center, _radius], []], ["water"], { !(_this isFlatEmpty [2,-1,0.5,1,0,false,objNull] isEqualTo []) }] call BIS_fnc_randomPos;

        if !(_rpos isEqualTo [0,0]) then {
            _v = (selectRandom _vehHeavyList) createVehicle _rpos ;
            _v lock 3;

            [_v, _g] call BIS_fnc_spawnCrew;
            [_g, _center, _radius / 2, 3 + round (random 2), "MOVE", ["AWARE", "SAFE"] select (random 1 > 0.5), ["red", "white"] select (random 1 > 0.2), ["limited", "normal"] select (random 1 > 0.5)] call CBA_fnc_taskPatrol;
            [_g, _vehHeavySkill] call LR_fnc_SetUnitSkill;
            if (random 1 >= 0.5) then { _v allowCrewInImmobile true; };

            _units append (units _g);
            _vehicles pushBack _v;
        };
    };
};

{
	if !(dynamicSimulationEnabled (group _x)) then {
		(group _x) enableDynamicSimulation true;
	};
	_x 	disableAI "AUTOCOMBAT";
} forEach _units;

{
	if !(dynamicSimulationEnabled (group _x)) then {
		(group _x) enableDynamicSimulation true;
	};
} forEach _vehicles;

{
	_x addCuratorEditableObjects [_units, false];
	_x addCuratorEditableObjects [_vehicles, true];
} forEach allCurators;

[_units, _vehicles]
