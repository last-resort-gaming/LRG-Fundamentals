/*
Function: LR_fnc_Loadouts

Description:
    Applies a specified loadout to the given unit. Loadouts are currently hardcoded, but will be
	replaced with config data later down the line.

Arguments:
    _unit - Unit to apply given loadout to <UNIT>
	_Loadout - Type of loadout to apply, currently unused <STRING>

Return Value:
    None

Example:
	Nothing to see here

Author: MitchJC
*/

params [
	"_unit",
	"_Loadout"
];

private _Equipment = call {
	//================ Warlords Loadouts

	// Vanilla Standard
	If (!(isnil "BIS_WL_sidesPool") && (typeof _unit) isequalto "B_T_Soldier_SL_F") exitwith {[["arifle_MX_khk_F","","acc_pointer_IR","optic_ERCO_khk_F",["30Rnd_65x39_caseless_mag",30],[],""],[],["hgun_P07_F","","","",["16Rnd_9x21_Mag",16],[],""],["U_B_T_Soldier_F",[["FirstAidKit",4]]],["V_PlateCarrier2_tna_F",[["HandGrenade",2,1],["30Rnd_65x39_caseless_mag",6,30],["SmokeShell",2,1]]],[],"H_HelmetB_tna_F","",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","ItemRadio","ItemCompass","ItemWatch","NVGoggles_tna_F"]];};
	If (!(isnil "BIS_WL_sidesPool") && (typeof _unit) isequalto "O_T_Soldier_SL_F") exitwith {[["arifle_CTAR_ghex_F","","acc_pointer_IR","optic_Arco_ghex_F",["30Rnd_580x42_Mag_F",30],[],""],[],["hgun_Rook40_F","","","",["16Rnd_9x21_Mag",16],[],""],["U_O_T_Soldier_F",[["FirstAidKit",4]]],["V_HarnessO_ghex_F",[["HandGrenade",2,1],["SmokeShell",2,1],["30Rnd_580x42_Mag_F",6,30]]],[],"H_HelmetLeaderO_ghex_F","",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","ItemRadio","ItemCompass","ItemWatch","O_NVGoggles_ghex_F"]];};
	// Vanilla Tanoa	
	If (!(isnil "BIS_WL_sidesPool") && (typeof _unit) isequalto "B_Soldier_SL_F") exitwith {[["arifle_MX_F","","acc_pointer_IR","optic_Hamr",["30Rnd_65x39_caseless_mag",30],[],""],[],["hgun_P07_F","","","",["16Rnd_9x21_Mag",16],[],""],["U_B_CombatUniform_mcam",[["FirstAidKit",4]]],["V_PlateCarrierH_CTRG",[["HandGrenade",2,1],["SmokeShell",2,1],["30Rnd_65x39_caseless_mag",6,30]]],[],"H_HelmetSpecB_paint2","",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","ItemRadio","ItemCompass","ItemWatch","NVGoggles"]];};
	If (!(isnil "BIS_WL_sidesPool") && (typeof _unit) isequalto "O_Soldier_SL_F") exitwith {[["arifle_Katiba_F","","acc_pointer_IR","optic_Arco_blk_F",["30Rnd_65x39_caseless_green",30],[],""],[],["hgun_Rook40_F","","","",["16Rnd_9x21_Mag",16],[],""],["U_O_CombatUniform_ocamo",[["FirstAidKit",4]]],["V_TacVest_khk",[["30Rnd_65x39_caseless_green",6,30],["HandGrenade",2,1],["SmokeShell",2,1]]],[],"H_HelmetLeaderO_ocamo","",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","ItemRadio","ItemCompass","ItemWatch","NVGoggles_OPFOR"]];};
	// RHS Standard
	If (!(isnil "BIS_WL_sidesPool") && (typeof _unit) isequalto "rhsusf_army_ocp_squadleader") exitwith {[["rhs_weap_m4a1_carryhandle","","rhsusf_acc_anpeq15_top","rhsusf_acc_T1_high",["rhs_mag_30Rnd_556x45_M855A1_Stanag",30],[],""],[],[],["rhs_uniform_cu_ocp",[["FirstAidKit",4]]],["rhsusf_iotv_ocp_Squadleader",[["rhs_mag_30Rnd_556x45_M855A1_Stanag",8,30],["rhs_mag_m67",2,1]]],[],"rhsusf_ach_helmet_headset_ocp","",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","ItemRadio","ItemCompass","ItemWatch","rhsusf_ANPVS_14"]];};
	If (!(isnil "BIS_WL_sidesPool") && (typeof _unit) isequalto "rhs_msv_emr_sergeant") exitwith {[["rhs_weap_ak105_zenitco01_b33","rhs_acc_dtk","","rhs_acc_1p87",["rhs_30Rnd_545x39_7N10_AK",30],[],""],[],["rhs_weap_makarov_pm","","","",["rhs_mag_9x18_8_57N181S",8],[],""],["rhs_uniform_msv_emr",[["FirstAidKit",4]]],["rhs_6b23_digi_6sh92_headset_mapcase",[["rhs_mag_rgn",2,1],["rhs_30Rnd_545x39_7N10_AK",8,30]]],[],"rhs_6b27m_green","",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","ItemRadio","ItemCompass","ItemWatch","rhs_1PN138"]];};
	// RHS Tanoa
	If (!(isnil "BIS_WL_sidesPool") && (typeof _unit) isequalto "rhsusf_usmc_marpat_wd_squadleader") exitwith {[["rhs_weap_m4a1_carryhandle","","rhsusf_acc_anpeq15_top","rhsusf_acc_T1_high",["rhs_mag_30Rnd_556x45_M855A1_Stanag",30],[],""],[],[],["rhs_uniform_cu_ocp",[["FirstAidKit",4]]],["rhsusf_iotv_ocp_Squadleader",[["rhs_mag_30Rnd_556x45_M855A1_Stanag",8,30],["rhs_mag_m67",2,1]]],[],"rhsusf_ach_helmet_headset_ocp","",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","ItemRadio","ItemCompass","ItemWatch","rhsusf_ANPVS_14"]];};
	If (!(isnil "BIS_WL_sidesPool") && (typeof _unit) isequalto "rhs_vmf_flora_sergeant") exitwith {[["rhs_weap_ak105_zenitco01_b33","rhs_acc_dtk","","rhs_acc_1p87",["rhs_30Rnd_545x39_7N10_AK",30],[],""],[],["rhs_weap_makarov_pm","","","",["rhs_mag_9x18_8_57N181S",8],[],""],["rhs_uniform_msv_emr",[["FirstAidKit",4]]],["rhs_6b23_digi_6sh92_headset_mapcase",[["rhs_mag_rgn",2,1],["rhs_30Rnd_545x39_7N10_AK",8,30]]],[],"rhs_6b27m_green","",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","ItemRadio","ItemCompass","ItemWatch","rhs_1PN138"]];};

	//================ 3CB Loadouts

		// Operational Loadouts
	if (typeof _unit IsEqualTo "UK3CB_BAF_Officer_MTP") exitwith {[["UK3CB_BAF_L119A1_UKUGL","UK3CB_BAF_SFFH","UK3CB_BAF_LLM_IR_Black","RKSL_optic_LDS",["UK3CB_BAF_556_30Rnd_T",30],["UK3CB_BAF_1Rnd_HEDP_Grenade_Shell",1],""],[],["UK3CB_BAF_L131A1","","UK3CB_BAF_Flashlight_L131A1","",["UK3CB_BAF_9_17Rnd",17],[],""],["UK3CB_BAF_U_CombatUniform_MTP",[["ACE_EarPlugs",1],["ACE_CableTie",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["UK3CB_BAF_SmokeShell",5,1],["UK3CB_BAF_9_17Rnd",1,17],["Laserbatteries",1,1]]],["UK3CB_BAF_V_Osprey_Rifleman_C",[["ACE_IR_Strobe_Item",2],["HandGrenade",2,1],["SmokeShellBlue",2,1],["SmokeShellGreen",2,1],["ACE_Chemlight_IR",2,1],["Chemlight_green",2,1],["UK3CB_BAF_556_30Rnd_T",9,30]]],["UK3CB_BAF_B_Bergen_MTP_Radio_L_B",[["ACE_elasticBandage",15],["ACE_packingBandage",10],["ACE_quikclot",15],["ACE_epinephrine",5],["ACE_morphine",5],["ACE_tourniquet",6],["UK3CB_BAF_HMNVS",1],["UK3CB_BAF_Silencer_L85",1],["Laserbatteries",2,1],["UK3CB_BAF_1Rnd_HEDP_Grenade_Shell",10,1]]],"UK3CB_BAF_H_Mk7_Net_A","",["UK3CB_BAF_Soflam_Laserdesignator","","","",["Laserbatteries",1],[],""],["ItemMap","B_UavTerminal","tf_anprc152","ItemCompass","tf_microdagr",""]];};
	if (typeof _unit IsEqualTo "UK3CB_BAF_FAC_MTP_REC") exitwith {[["UK3CB_BAF_L119A1_UKUGL","UK3CB_BAF_SFFH","UK3CB_BAF_LLM_IR_Black","RKSL_optic_LDS",["UK3CB_BAF_556_30Rnd_T",30],["UK3CB_BAF_1Rnd_HEDP_Grenade_Shell",1],""],[],["UK3CB_BAF_L131A1","","UK3CB_BAF_Flashlight_L131A1","",["UK3CB_BAF_9_17Rnd",17],[],""],["UK3CB_BAF_U_CombatUniform_MTP",[["ACE_EarPlugs",1],["ACE_CableTie",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["UK3CB_BAF_SmokeShell",5,1],["UK3CB_BAF_9_17Rnd",1,17],["Laserbatteries",1,1]]],["UK3CB_BAF_V_Osprey_Rifleman_C",[["ACE_IR_Strobe_Item",2],["HandGrenade",2,1],["SmokeShellBlue",2,1],["SmokeShellGreen",2,1],["ACE_Chemlight_IR",2,1],["Chemlight_green",2,1],["UK3CB_BAF_556_30Rnd_T",9,30]]],["UK3CB_BAF_B_Bergen_MTP_Radio_L_B",[["ACE_elasticBandage",15],["ACE_packingBandage",10],["ACE_quikclot",15],["ACE_epinephrine",5],["ACE_morphine",5],["ACE_tourniquet",6],["UK3CB_BAF_HMNVS",1],["UK3CB_BAF_Silencer_L85",1],["Laserbatteries",2,1],["UK3CB_BAF_1Rnd_HEDP_Grenade_Shell",10,1]]],"UK3CB_BAF_H_Mk7_Net_A","",["UK3CB_BAF_Soflam_Laserdesignator","","","",["Laserbatteries",1],[],""],["ItemMap","B_UavTerminal","tf_anprc152","ItemCompass","tf_microdagr",""]];};
	if (typeof _unit IsEqualTo "UK3CB_BAF_SC_MTP") exitwith {[["UK3CB_BAF_L119A1_UKUGL","UK3CB_BAF_SFFH","UK3CB_BAF_LLM_IR_Black","RKSL_optic_LDS",["UK3CB_BAF_556_30Rnd_T",30],["UK3CB_BAF_1Rnd_HEDP_Grenade_Shell",1],""],[],["UK3CB_BAF_L131A1","","UK3CB_BAF_Flashlight_L131A1","",["UK3CB_BAF_9_17Rnd",17],[],""],["UK3CB_BAF_U_CombatUniform_MTP_ShortSleeve",[["ACE_EarPlugs",1],["ACE_CableTie",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["UK3CB_BAF_SmokeShell",5,1],["UK3CB_BAF_9_17Rnd",1,17]]],["UK3CB_BAF_V_Osprey_Rifleman_C",[["ACE_IR_Strobe_Item",2],["HandGrenade",2,1],["SmokeShellBlue",2,1],["SmokeShellGreen",2,1],["ACE_Chemlight_HiWhite",2,1],["ACE_Chemlight_IR",2,1],["UK3CB_BAF_556_30Rnd_T",9,30]]],["UK3CB_BAF_B_Bergen_MTP_Radio_L_B",[["ACE_elasticBandage",15],["ACE_packingBandage",10],["ACE_quikclot",15],["ACE_epinephrine",5],["ACE_morphine",5],["ACE_tourniquet",6],["UK3CB_BAF_HMNVS",1],["UK3CB_BAF_Silencer_L85",1],["Laserbatteries",2,1],["UK3CB_BAF_1Rnd_HEDP_Grenade_Shell",4,1],["B_IR_Grenade",2,1]]],"UK3CB_BAF_H_Mk7_Net_ESS_A","",["UK3CB_BAF_Soflam_Laserdesignator","","","",["Laserbatteries",1],[],""],["ItemMap","ItemGPS","tf_anprc152","ItemCompass","tf_microdagr",""]];};
	if (typeof _unit IsEqualTo "UK3CB_BAF_Engineer_MTP") exitwith {[["UK3CB_BAF_L119A1_FG","UK3CB_BAF_SFFH","UK3CB_BAF_LLM_IR_Black","RKSL_optic_LDS",["UK3CB_BAF_556_30Rnd_T",30],[],""],[],["ACE_VMH3","","","",[],[],""],["UK3CB_BAF_U_CombatUniform_MTP_ShortSleeve",[["ACE_CableTie",1],["ACE_EarPlugs",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["UK3CB_BAF_SmokeShell",5,1]]],["UK3CB_BAF_V_Osprey_SL_C",[["UK3CB_BAF_SmokeShell",5,1],["UK3CB_BAF_556_30Rnd_T",10,30]]],["UK3CB_BAF_B_Bergen_MTP_Sapper_L_A",[["ACE_Clacker",1],["ToolKit",1],["ACE_elasticBandage",15],["ACE_quikclot",15],["ACE_epinephrine",5],["ACE_morphine",5],["ACE_packingBandage",10],["ACE_tourniquet",6],["UK3CB_BAF_HMNVS",1],["ACE_DefusalKit",1],["ACE_IR_Strobe_Item",2],["UK3CB_BAF_Silencer_L85",1],["DemoCharge_Remote_Mag",3,1],["ACE_Chemlight_HiWhite",2,1],["ACE_Chemlight_IR",2,1]]],"UK3CB_BAF_H_Mk7_Net_CESS_B","",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","tf_anprc152","ItemCompass","tf_microdagr",""]];};
	if (typeof _unit IsEqualTo "UK3CB_BAF_MGLMG_MTP") exitwith {[["UK3CB_BAF_L110A2RIS","UK3CB_BAF_SFFH","UK3CB_BAF_LLM_IR_Black","RKSL_optic_LDS",["UK3CB_BAF_556_200Rnd_T",200],[],""],[],["UK3CB_BAF_L131A1","","","",["UK3CB_BAF_9_17Rnd",17],[],""],["UK3CB_BAF_U_CombatUniform_MTP_ShortSleeve",[["ACE_EarPlugs",1],["ACE_CableTie",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["UK3CB_BAF_SmokeShell",5,1]]],["UK3CB_BAF_V_Osprey_MG_A",[["HandGrenade",2,1],["UK3CB_BAF_9_17Rnd",2,17],["UK3CB_BAF_556_200Rnd_T",1,200],["UK3CB_BAF_556_100Rnd_T",1,100]]],["UK3CB_BAF_B_Bergen_MTP_Rifleman_L_B",[["ACE_elasticBandage",15],["ACE_quikclot",15],["ACE_epinephrine",5],["ACE_morphine",4],["ACE_packingBandage",10],["UK3CB_BAF_HMNVS",1],["UK3CB_BAF_Silencer_L110",1],["ACE_tourniquet",6],["ACE_IR_Strobe_Item",2],["ACE_Chemlight_HiWhite",2,1],["ACE_Chemlight_IR",2,1],["SmokeShellBlue",2,1],["SmokeShellGreen",2,1],["UK3CB_BAF_556_200Rnd_T",1,200]]],"UK3CB_BAF_H_Mk7_Net_C","",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","tf_anprc152","ItemCompass","tf_microdagr",""]];};
	if (typeof _unit IsEqualTo "UK3CB_BAF_RO_MTP") exitwith {[["UK3CB_BAF_L129A1","","UK3CB_BAF_LLM_IR_Black","UK3CB_BAF_TA648_308",["UK3CB_BAF_762_L42A1_20Rnd_T",20],[],"UK3CB_underbarrel_acc_fgrip_bipod"],[],["UK3CB_BAF_L131A1","","","",["UK3CB_BAF_9_17Rnd",17],[],""],["UK3CB_BAF_U_CombatUniform_MTP_ShortSleeve",[["ACE_CableTie",1],["ACE_EarPlugs",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["UK3CB_BAF_SmokeShell",5,1]]],["UK3CB_BAF_V_Osprey_Marksman_A",[["UK3CB_BAF_762_L42A1_20Rnd_T",10,20],["HandGrenade",2,1]]],["UK3CB_BAF_B_Bergen_MTP_Radio_L_B",[["ACE_elasticBandage",15],["ACE_quikclot",15],["ACE_epinephrine",5],["ACE_morphine",5],["ACE_packingBandage",10],["ACE_tourniquet",6],["UK3CB_BAF_Silencer_L115A3",1],["UK3CB_BAF_HMNVS",1],["ACE_IR_Strobe_Item",2],["ACE_RangeCard",1],["ACE_Chemlight_HiWhite",2,1],["ACE_Chemlight_IR",2,1],["SmokeShellBlue",2,1],["SmokeShellGreen",2,1],["Laserbatteries",2,1],["UK3CB_BAF_556_100Rnd_T",1,100]]],"UK3CB_BAF_H_Mk7_Scrim_D","",["UK3CB_BAF_Soflam_Laserdesignator","","","",["Laserbatteries",1],[],""],["ItemMap","ItemGPS","tf_anprc152","ItemCompass","tf_microdagr",""]];};
	if (typeof _unit IsEqualTo "UK3CB_BAF_Medic_MTP") exitwith {[["UK3CB_BAF_L85A2_RIS_Tan","UK3CB_BAF_SFFH","UK3CB_BAF_LLM_IR_Black","RKSL_optic_LDS",["UK3CB_BAF_556_30Rnd_T",30],[],""],[],["UK3CB_BAF_L131A1","","","",["UK3CB_BAF_9_17Rnd",17],[],""],["UK3CB_BAF_U_CombatUniform_MTP_ShortSleeve",[["ACE_CableTie",1],["ACE_EarPlugs",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["UK3CB_BAF_9_17Rnd",2,17],["UK3CB_BAF_SmokeShell",4,1]]],["UK3CB_BAF_V_Osprey_SL_A",[["UK3CB_BAF_556_30Rnd_T",10,30],["HandGrenade",2,1],["SmokeShellBlue",2,1],["SmokeShellGreen",2,1]]],["UK3CB_BAF_B_Bergen_MTP_Medic_L_A",[["ACE_fieldDressing",10],["ACE_elasticBandage",25],["ACE_quikclot",25],["ACE_epinephrine",10],["ACE_morphine",10],["ACE_packingBandage",20],["ACE_surgicalKit",1],["ACE_tourniquet",8],["ACE_bloodIV_500",10],["UK3CB_BAF_HMNVS",1],["UK3CB_BAF_Silencer_L85",1],["ACE_IR_Strobe_Item",2],["ACE_Chemlight_HiWhite",2,1],["ACE_Chemlight_IR",2,1]]],"UK3CB_BAF_H_Mk7_Net_C","",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","tf_anprc152","ItemCompass","tf_microdagr",""]];};
	if (typeof _unit IsEqualTo "UK3CB_BAF_FT_MTP") exitwith {[["UK3CB_BAF_L119A1_UKUGL","UK3CB_BAF_SFFH","UK3CB_BAF_LLM_IR_Black","RKSL_optic_LDS",["UK3CB_BAF_556_30Rnd_T",30],["UK3CB_BAF_1Rnd_HEDP_Grenade_Shell",1],""],[],["UK3CB_BAF_L131A1","","UK3CB_BAF_Flashlight_L131A1","",["UK3CB_BAF_9_17Rnd",17],[],""],["UK3CB_BAF_U_CombatUniform_MTP_ShortSleeve",[["ACE_EarPlugs",1],["ACE_CableTie",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["UK3CB_BAF_SmokeShell",5,1],["UK3CB_BAF_9_17Rnd",1,17]]],["UK3CB_BAF_V_Osprey_Rifleman_C",[["ACE_IR_Strobe_Item",2],["HandGrenade",2,1],["SmokeShellBlue",2,1],["SmokeShellGreen",2,1],["ACE_Chemlight_HiWhite",2,1],["ACE_Chemlight_IR",2,1],["UK3CB_BAF_556_30Rnd_T",9,30]]],["UK3CB_BAF_B_Bergen_MTP_Radio_L_B",[["ACE_elasticBandage",15],["ACE_packingBandage",10],["ACE_quikclot",15],["ACE_epinephrine",5],["ACE_morphine",5],["ACE_tourniquet",6],["UK3CB_BAF_HMNVS",1],["UK3CB_BAF_Silencer_L85",1],["Laserbatteries",2,1],["UK3CB_BAF_1Rnd_HEDP_Grenade_Shell",4,1],["B_IR_Grenade",2,1]]],"UK3CB_BAF_H_Mk7_Camo_C","",["UK3CB_BAF_Soflam_Laserdesignator","","","",["Laserbatteries",1],[],""],["ItemMap","ItemGPS","tf_anprc152","ItemCompass","tf_microdagr",""]];};
	if (typeof _unit IsEqualTo "UK3CB_BAF_Marksman_MTP") exitwith {[["UK3CB_BAF_L129A1","","UK3CB_BAF_LLM_IR_Black","UK3CB_BAF_TA648_308",["UK3CB_BAF_762_L42A1_20Rnd_T",20],[],"UK3CB_underbarrel_acc_fgrip_bipod"],[],["UK3CB_BAF_L131A1","","","",["UK3CB_BAF_9_17Rnd",17],[],""],["UK3CB_BAF_U_CombatUniform_MTP_ShortSleeve",[["ACE_CableTie",1],["ACE_EarPlugs",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["UK3CB_BAF_SmokeShell",5,1]]],["UK3CB_BAF_V_Osprey_Marksman_A",[["UK3CB_BAF_762_L42A1_20Rnd_T",10,20],["HandGrenade",2,1]]],["UK3CB_BAF_B_Bergen_MTP_Rifleman_L_D",[["ACE_elasticBandage",15],["ACE_quikclot",15],["ACE_epinephrine",5],["ACE_morphine",5],["ACE_packingBandage",10],["ACE_tourniquet",6],["UK3CB_BAF_Silencer_L115A3",1],["UK3CB_BAF_HMNVS",1],["ACE_IR_Strobe_Item",2],["ACE_wirecutter",1],["ACE_EntrenchingTool",1],["ACE_RangeCard",1],["ACE_Chemlight_HiWhite",2,1],["ACE_Chemlight_IR",2,1],["SmokeShellBlue",2,1],["SmokeShellGreen",2,1],["UK3CB_BAF_556_100Rnd_T",2,100]]],"UK3CB_BAF_H_Mk7_Scrim_C","",["ACE_Vector","","","",[],[],""],["ItemMap","ItemGPS","tf_anprc152","ItemCompass","tf_microdagr",""]];};
	if (typeof _unit IsEqualTo "UK3CB_BAF_HeliPilot_Army_MTP") exitwith {[["UK3CB_BAF_L22","UK3CB_BAF_SFFH","","RKSL_optic_LDS",["UK3CB_BAF_556_30Rnd_T",30],[],""],[],["UK3CB_BAF_L131A1","","","",["UK3CB_BAF_9_17Rnd",17],[],""],["UK3CB_BAF_U_HeliPilotCoveralls_RAF",[["ACE_CableTie",1],["ACE_EarPlugs",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1]]],["UK3CB_BAF_V_Pilot_A",[["ACE_fieldDressing",10],["ACE_elasticBandage",10],["ACE_quikclot",10],["ACE_morphine",2],["ACE_packingBandage",10],["ACE_tourniquet",4],["ACE_epinephrine",5],["UK3CB_BAF_HMNVS",1],["UK3CB_BAF_556_30Rnd_T",4,30],["UK3CB_BAF_9_17Rnd",2,17],["B_IR_Grenade",2,1],["SmokeShellBlue",2,1],["UK3CB_BAF_SmokeShell",1,1]]],["UK3CB_BAF_B_Bergen_OLI_SL_A",[]],"UK3CB_BAF_H_PilotHelmetHeli_A","",["ACE_Yardage450","","","",[],[],""],["ItemMap","ItemGPS","tf_anprc152","ItemCompass","ItemWatch",""]];};
	if (typeof _unit IsEqualTo "UK3CB_BAF_HeliCrew_MTP") exitwith {[["UK3CB_BAF_L119A1_CQB","UK3CB_BAF_SFFH","","RKSL_optic_LDS",["UK3CB_BAF_556_30Rnd_T",30],[],""],[],["UK3CB_BAF_L131A1","","","",["UK3CB_BAF_9_17Rnd",17],[],""],["UK3CB_BAF_U_CombatUniform_MTP_ShortSleeve",[["ACE_CableTie",1],["ACE_EarPlugs",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACE_RangeTable_82mm",1]]],["UK3CB_BAF_V_Osprey_SL_A",[["UK3CB_BAF_SmokeShell",2,1],["HandGrenade",2,1],["UK3CB_BAF_9_17Rnd",2,17],["UK3CB_BAF_556_30Rnd_T",9,30]]],["UK3CB_BAF_B_Bergen_MTP_Radio_L_A",[["ACE_elasticBandage",20],["ACE_quikclot",20],["ACE_epinephrine",7],["ACE_morphine",10],["ACE_packingBandage",20],["ACE_surgicalKit",1],["ACE_tourniquet",8],["UK3CB_BAF_HMNVS",1],["UK3CB_BAF_Silencer_L85",1],["adv_aceCPR_AED",1],["ACE_bloodIV",5],["UK3CB_BAF_SmokeShellGreen",1,1],["UK3CB_BAF_SmokeShellBlue",1,1]]],"UK3CB_BAF_H_PilotHelmetHeli_A","",["Binocular","","","",[],[],""],["ItemMap","B_UavTerminal","tf_anprc152","ItemCompass","tf_microdagr",""]];};
	if (typeof _unit IsEqualTo "UK3CB_BAF_Sniper_MTP_Ghillie_L115") exitwith {[["UK3CB_BAF_L115A3_BL_Ghillie","UK3CB_BAF_Silencer_L115A3","","RKSL_optic_PMII_525",["UK3CB_BAF_338_5Rnd_Tracer",5],[],""],[],["UK3CB_BAF_L131A1","","","",["UK3CB_BAF_9_17Rnd",17],[],""],["UK3CB_BAF_U_CombatUniform_MTP_Ghillie_RM",[["ACE_EarPlugs",1],["ACE_CableTie",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["UK3CB_BAF_SmokeShell",5,1]]],["UK3CB_BAF_V_Osprey",[["HandGrenade",2,1],["UK3CB_BAF_9_17Rnd",2,17],["UK3CB_BAF_338_5Rnd_Tracer",10,5]]],["UK3CB_BAF_B_Bergen_MTP_Rifleman_L_B",[["ACE_elasticBandage",15],["ACE_quikclot",15],["ACE_epinephrine",5],["ACE_morphine",4],["ACE_packingBandage",10],["UK3CB_BAF_HMNVS",1],["UK3CB_BAF_Silencer_L110",1],["ACE_tourniquet",4],["ACE_IR_Strobe_Item",2],["ACE_Tripod",1],["ACE_wirecutter",1],["ACE_ATragMX",1],["ACE_DAGR",1],["ACE_Kestrel4500",1],["ACE_RangeCard",1],["ACE_Chemlight_HiWhite",2,1],["ACE_Chemlight_IR",2,1],["SmokeShellBlue",2,1],["SmokeShellGreen",2,1]]],"UK3CB_BAF_H_Mk7_Net_C","",["ACE_Vector","","","",[],[],""],["ItemMap","ItemGPS","tf_anprc152","ItemCompass","tf_microdagr",""]];};
	if (typeof _unit IsEqualTo "UK3CB_BAF_Spotter_MTP_Ghillie_L129") exitwith {[["UK3CB_BAF_L129A1","UK3CB_BAF_Silencer_L115A3","UK3CB_BAF_LLM_IR_Black","RKSL_optic_PMII_312",["UK3CB_BAF_762_L42A1_20Rnd_T",20],[],"UK3CB_underbarrel_acc_fgrip_bipod"],[],["UK3CB_BAF_L131A1","","","",["UK3CB_BAF_9_17Rnd",17],[],""],["UK3CB_BAF_U_CombatUniform_MTP_Ghillie_RM",[["ACE_CableTie",1],["ACE_EarPlugs",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["UK3CB_BAF_SmokeShell",5,1]]],["UK3CB_BAF_V_Osprey_Marksman_A",[["UK3CB_BAF_762_L42A1_20Rnd_T",8,20],["HandGrenade",2,1]]],["UK3CB_BAF_B_Bergen_MTP_Radio_L_A",[["ACE_elasticBandage",15],["ACE_quikclot",15],["ACE_epinephrine",5],["ACE_morphine",5],["ACE_packingBandage",10],["ACE_tourniquet",4],["UK3CB_BAF_HMNVS",1],["ACE_IR_Strobe_Item",2],["ACE_EntrenchingTool",1],["ACE_Kestrel4500",1],["ACE_SpottingScope",1],["ACE_microDAGR",1],["ACE_RangeCard",1],["ACE_ATragMX",1],["ACE_Chemlight_HiWhite",2,1],["ACE_Chemlight_IR",2,1],["SmokeShellBlue",2,1],["SmokeShellGreen",2,1]]],"UK3CB_BAF_H_Mk7_Scrim_C","",["ACE_Vector","","","",[],[],""],["ItemMap","ItemGPS","tf_anprc152","ItemCompass","tf_microdagr",""]];};

		// Training Loadouts
	if (typeof _unit IsEqualTo "UK3CB_BAF_Rifleman_MTP") exitwith {[["UK3CB_BAF_L85A2_RIS_Tan","","UK3CB_BAF_LLM_IR_Black","RKSL_optic_LDS",["UK3CB_BAF_556_30Rnd_T",30],[],""],[],["UK3CB_BAF_L131A1","","","",["UK3CB_BAF_9_17Rnd",17],[],""],["UK3CB_BAF_U_CombatUniform_MTP_ShortSleeve",[["ACE_EarPlugs",1],["ACE_CableTie",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["UK3CB_BAF_SmokeShell",5,1]]],["UK3CB_BAF_V_Osprey_Rifleman_C",[["UK3CB_BAF_556_30Rnd_T",11,30],["HandGrenade",2,1]]],["UK3CB_BAF_B_Bergen_MTP_Rifleman_L_D",[["ACE_elasticBandage",15],["ACE_packingBandage",10],["ACE_quikclot",15],["ACE_epinephrine",1],["ACE_morphine",4],["ACE_tourniquet",4],["UK3CB_BAF_HMNVS",1],["UK3CB_BAF_Silencer_L85",1],["ACE_surgicalKit",1],["ACE_bloodIV_500",2]]],"UK3CB_BAF_H_Mk7_Camo_ESS_B","",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","tf_anprc152","ItemCompass","tf_microdagr",""]];};
	if (typeof _unit IsEqualTo "UK3CB_BAF_Recruit_MTP") exitwith {[["UK3CB_BAF_L85A2_RIS","UK3CB_BAF_BFA_L85","UK3CB_BAF_LLM_Flashlight_Black","RKSL_optic_LDS",["UK3CB_BAF_556_30Rnd_Blank",30],[],""],[],["ACE_VMH3","","","",[],[],""],["UK3CB_BAF_U_CombatUniform_MTP",[["ACE_fieldDressing",2],["ACE_elasticBandage",5],["ACE_quikclot",5],["ACE_bloodIV_250",1],["ACE_CableTie",1],["ACE_EarPlugs",1],["ACE_microDAGR",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ACE_morphine",2],["ACE_packingBandage",5],["ACE_tourniquet",2]]],["UK3CB_BAF_V_Osprey_Lite",[["ACE_epinephrine",5],["ACE_elasticBandage",10],["ACE_quikclot",10],["UK3CB_BAF_556_30Rnd_T",5,30],["UK3CB_BAF_556_30Rnd_Blank",4,30]]],["UK3CB_BAF_B_Kitbag_MTP",[["UK3CB_BAF_HMNVS",1],["ACE_surgicalKit",1],["ACE_wirecutter",1],["ACE_Clacker",1],["ACE_EntrenchingTool",1],["ACE_DefusalKit",1],["ACE_CableTie",1],["ToolKit",1],["ACE_IR_Strobe_Item",1],["adv_aceCPR_AED",1],["ACE_bloodIV_500",5],["DemoCharge_Remote_Mag",2,1],["UK3CB_BAF_SmokeShell",5,1],["UK3CB_BAF_HandGrenade_Blank",2,1]]],"UK3CB_BAF_H_Mk7_Camo_A","",["ACE_VectorDay","","","",[],[],""],["ItemMap","ItemGPS","tf_anprc152","ItemCompass","ItemWatch",""]];};

	//================ RHS Loadouts

		//Operational Loadouts
	if (typeof _unit IsEqualTo "rhsusf_usmc_marpat_d_officer") exitwith {[["rhs_weap_hk416d10_LMT","rhsusf_acc_nt4_black","rhsusf_acc_anpeq15_bk_light","rhsusf_acc_SpecterDR_A",["rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red",30],[],""],[],["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_FMJ",17],[],""],["rhs_uniform_FROG01_d",[["ACE_EarPlugs",1],["ACE_CableTie",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["SmokeShell",4,1],["rhsusf_mag_17Rnd_9x19_FMJ",2,17],["ACE_M84",2,1]]],["rhsusf_spc_patchless_radio",[["ACE_IR_Strobe_Item",2],["rhs_mag_m67",2,1],["SmokeShellBlue",2,1],["SmokeShellGreen",2,1],["ACE_Chemlight_HiWhite",2,1],["ACE_Chemlight_IR",2,1],["rhsusf_mag_17Rnd_9x19_FMJ",1,17],["rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red",9,30]]],["tfw_ilbe_blade_coy",[["ACE_elasticBandage",15],["ACE_packingBandage",10],["ACE_quikclot",15],["ACE_epinephrine",1],["ACE_morphine",5],["ACE_tourniquet",4],["B_IR_Grenade",2,1],["rhs_mag_M441_HE",6,1],["rhs_mag_m714_White",5,1]]],"rhsusf_opscore_aor1_pelt_nsw","rhsusf_shemagh_gogg_od",["Laserdesignator_03","","","",["Laserbatteries",1],[],""],["ItemMap","ItemGPS","tf_anprc152","ItemCompass","ItemWatch","rhsusf_ANPVS_14"]]};
	if (typeof _unit IsEqualTo "rhsusf_usmc_marpat_d_fso") exitwith {[["rhs_weap_hk416d10_LMT","rhsusf_acc_nt4_black","rhsusf_acc_anpeq15_bk_light","rhsusf_acc_SpecterDR_A",["rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red",30],[],""],[],["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_FMJ",17],[],""],["rhs_uniform_FROG01_d",[["ACE_EarPlugs",1],["ACE_CableTie",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["SmokeShell",4,1],["rhsusf_mag_17Rnd_9x19_FMJ",2,17],["ACE_M84",2,1]]],["rhsusf_spc_patchless_radio",[["ACE_IR_Strobe_Item",2],["rhs_mag_m67",2,1],["SmokeShellBlue",2,1],["SmokeShellGreen",2,1],["ACE_Chemlight_HiWhite",2,1],["ACE_Chemlight_IR",2,1],["rhsusf_mag_17Rnd_9x19_FMJ",1,17],["rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red",9,30]]],["tfw_ilbe_blade_coy",[["ACE_elasticBandage",15],["ACE_packingBandage",10],["ACE_quikclot",15],["ACE_epinephrine",1],["ACE_morphine",5],["ACE_tourniquet",4],["B_IR_Grenade",2,1],["rhs_mag_M441_HE",6,1],["rhs_mag_m714_White",5,1]]],"rhsusf_opscore_aor1_pelt_nsw","rhsusf_shemagh_gogg_od",["Laserdesignator_03","","","",["Laserbatteries",1],[],""],["ItemMap","ItemGPS","tf_anprc152","ItemCompass","ItemWatch","rhsusf_ANPVS_14"]]};
	if (typeof _unit IsEqualTo "rhsusf_usmc_marpat_d_squadleader") exitwith {[["rhs_weap_hk416d10_m320","rhsusf_acc_nt4_black","rhsusf_acc_anpeq15_bk_light","rhsusf_acc_SpecterDR_A",["rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red",30],["rhs_mag_M441_HE",1],""],[],["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_FMJ",17],[],""],["rhs_uniform_FROG01_d",[["ACE_EarPlugs",1],["ACE_CableTie",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["SmokeShell",4,1],["rhsusf_mag_17Rnd_9x19_FMJ",1,17],["ACE_M84",2,1]]],["rhsusf_spc_patchless_radio",[["ACE_IR_Strobe_Item",2],["rhs_mag_m67",2,1],["SmokeShellBlue",2,1],["SmokeShellGreen",2,1],["ACE_Chemlight_HiWhite",2,1],["ACE_Chemlight_IR",2,1],["rhsusf_mag_17Rnd_9x19_FMJ",1,17],["rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red",9,30]]],["tfw_ilbe_blade_coy",[["ACE_elasticBandage",15],["ACE_packingBandage",10],["ACE_quikclot",15],["ACE_epinephrine",1],["ACE_morphine",5],["ACE_tourniquet",4],["rhs_mag_M441_HE",4,1],["rhs_mag_m714_White",5,1]]],"rhsusf_opscore_aor1_pelt_nsw","rhs_ess_black",["Laserdesignator_03","","","",["Laserbatteries",1],[],""],["ItemMap","ItemGPS","tf_anprc152","ItemCompass","ItemWatch","rhsusf_ANPVS_14"]]};
	if (typeof _unit IsEqualTo "rhsusf_usmc_marpat_d_teamleader") exitwith {[["rhs_weap_hk416d10_m320","rhsusf_acc_nt4_black","rhsusf_acc_anpeq15_bk_light","rhsusf_acc_SpecterDR_A",["rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red",30],["rhs_mag_M441_HE",1],""],[],["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_FMJ",17],[],""],["rhs_uniform_FROG01_d",[["ACE_EarPlugs",1],["ACE_CableTie",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["SmokeShell",4,1],["rhsusf_mag_17Rnd_9x19_FMJ",1,17],["ACE_M84",2,1]]],["rhsusf_spc_patchless_radio",[["ACE_IR_Strobe_Item",2],["rhs_mag_m67",2,1],["SmokeShellBlue",2,1],["SmokeShellGreen",2,1],["ACE_Chemlight_HiWhite",2,1],["ACE_Chemlight_IR",2,1],["rhsusf_mag_17Rnd_9x19_FMJ",1,17],["rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red",9,30]]],["tfw_ilbe_dd_coy",[["ACE_elasticBandage",15],["ACE_packingBandage",10],["ACE_quikclot",15],["ACE_epinephrine",1],["ACE_morphine",5],["ACE_tourniquet",4],["rhs_mag_M441_HE",4,1],["rhs_mag_m714_White",5,1]]],"rhsusf_opscore_aor1_pelt_nsw","rhs_ess_black",["Laserdesignator_03","","","",["Laserbatteries",1],[],""],["ItemMap","ItemGPS","tf_anprc152","ItemCompass","ItemWatch","rhsusf_ANPVS_14"]]};
	if (typeof _unit IsEqualTo "rhsusf_usmc_marpat_d_jfo") exitwith {[["rhs_weap_sr25_ec","rhsusf_acc_SR25S","rhsusf_acc_anpeq15side_bk","rhsusf_acc_premier_low",["rhsusf_20Rnd_762x51_m62_Mag",20],[],"rhsusf_acc_harris_bipod"],[],["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_FMJ",17],[],""],["rhs_uniform_FROG01_d",[["ACE_EarPlugs",1],["ACE_CableTie",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["SmokeShell",4,1],["rhsusf_mag_17Rnd_9x19_FMJ",1,17],["ACE_M84",2,1]]],["rhsusf_spc_patchless_radio",[["ACE_IR_Strobe_Item",2],["rhs_mag_m67",2,1],["SmokeShellBlue",2,1],["SmokeShellGreen",2,1],["ACE_Chemlight_HiWhite",2,1],["ACE_Chemlight_IR",2,1],["rhsusf_mag_17Rnd_9x19_FMJ",1,17],["rhsusf_20Rnd_762x51_m62_Mag",5,20]]],["tfw_ilbe_coy",[["ACE_elasticBandage",15],["ACE_packingBandage",10],["ACE_quikclot",15],["ACE_epinephrine",1],["ACE_morphine",5],["ACE_tourniquet",4],["B_IR_Grenade",2,1],["rhsusf_20Rnd_762x51_m62_Mag",5,20]]],"rhsusf_opscore_aor1_pelt_nsw","rhsusf_shemagh_tan",["Laserdesignator_03","","","",["Laserbatteries",1],[],""],["ItemMap","ItemGPS","tf_anprc152","ItemCompass","ItemWatch","rhsusf_ANPVS_14"]]};
	if (typeof _unit IsEqualTo "rhsusf_usmc_marpat_d_autorifleman_m249") exitwith {[["rhs_weap_m249_pip_S_para","rhsusf_acc_nt4_black","rhsusf_acc_anpeq15side_bk","rhsusf_acc_SpecterDR_A",["rhs_200rnd_556x45_T_SAW",200],[],""],[],["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_FMJ",17],[],""],["rhs_uniform_FROG01_d",[["ACE_EarPlugs",1],["ACE_CableTie",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["SmokeShell",4,1],["ACE_M84",2,1],["rhsusf_mag_17Rnd_9x19_FMJ",2,17]]],["rhsusf_spc_patchless_radio",[["ACE_IR_Strobe_Item",2],["rhs_mag_m67",2,1],["SmokeShellBlue",2,1],["SmokeShellGreen",2,1],["ACE_Chemlight_HiWhite",2,1],["ACE_Chemlight_IR",2,1],["rhs_200rnd_556x45_T_SAW",2,200]]],["rhsusf_falconii_coy",[["ACE_elasticBandage",15],["ACE_packingBandage",10],["ACE_quikclot",15],["ACE_epinephrine",1],["ACE_morphine",5],["ACE_tourniquet",4],["B_IR_Grenade",2,1],["rhs_200rnd_556x45_T_SAW",2,200]]],"rhsusf_opscore_aor1_pelt_nsw","rhsusf_shemagh2_gogg_tan",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","tf_anprc152","ItemCompass","ItemWatch","rhsusf_ANPVS_14"]]};
	if (typeof _unit IsEqualTo "rhsusf_navy_marpat_d_medic") exitwith {[["rhs_weap_hk416d10_LMT","rhsusf_acc_nt4_black","rhsusf_acc_anpeq15_bk","rhsusf_acc_SpecterDR_A",["rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red",30],[],"rhsusf_acc_grip1"],[],["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_FMJ",17],[],""],["rhs_uniform_FROG01_d",[["ACE_EarPlugs",1],["ACE_CableTie",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["SmokeShell",4,1],["ACE_M84",2,1],["rhsusf_mag_17Rnd_9x19_FMJ",2,17]]],["rhsusf_spc_patchless_radio",[["ACE_IR_Strobe_Item",2],["SmokeShellBlue",2,1],["SmokeShellGreen",2,1],["ACE_Chemlight_HiWhite",2,1],["ACE_Chemlight_IR",2,1],["rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red",10,30],["rhs_mag_m67",1,1],["B_IR_Grenade",1,1]]],["rhsusf_falconii_coy",[["ACE_elasticBandage",20],["ACE_packingBandage",20],["ACE_quikclot",20],["ACE_epinephrine",10],["ACE_morphine",10],["ACE_tourniquet",8],["ACE_surgicalKit",1],["ACE_bloodIV_500",10]]],"rhsusf_opscore_aor1_pelt_nsw","rhsusf_shemagh_gogg_od",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","tf_anprc152","ItemCompass","ItemWatch","rhsusf_ANPVS_14"]]};
	if (typeof _unit IsEqualTo "rhsusf_usmc_marpat_d_riflemanat") exitwith {[["rhs_weap_hk416d10_LMT","rhsusf_acc_nt4_black","rhsusf_acc_anpeq15_bk","rhsusf_acc_SpecterDR_A",["rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red",30],[],"rhsusf_acc_grip1"],["rhs_weap_M136_hedp","","rhs_acc_at4_handler","",[],[],""],["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_FMJ",17],[],""],["rhs_uniform_FROG01_d",[["ACE_EarPlugs",1],["ACE_CableTie",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["SmokeShell",4,1],["ACE_M84",2,1],["rhsusf_mag_17Rnd_9x19_FMJ",2,17]]],["rhsusf_spc_patchless_radio",[["ACE_IR_Strobe_Item",2],["rhs_mag_m67",2,1],["SmokeShellBlue",2,1],["SmokeShellGreen",2,1],["ACE_Chemlight_HiWhite",2,1],["ACE_Chemlight_IR",2,1],["rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red",10,30]]],["rhsusf_falconii_coy",[["ACE_elasticBandage",15],["ACE_packingBandage",10],["ACE_quikclot",15],["ACE_epinephrine",1],["ACE_morphine",5],["ACE_tourniquet",4],["B_IR_Grenade",2,1],["rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red",2,30],["rhs_mag_maaws_HEDP",1,1]]],"rhsusf_opscore_aor1_pelt_nsw","rhsusf_shemagh_gogg_tan",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","tf_anprc152","ItemCompass","ItemWatch","rhsusf_ANPVS_14"]]};
	if (typeof _unit IsEqualTo "rhsusf_usmc_marpat_d_explosives") exitwith {[["rhs_weap_hk416d10_LMT","rhsusf_acc_nt4_black","rhsusf_acc_anpeq15_bk","rhsusf_acc_SpecterDR_A",["rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red",30],[],"rhsusf_acc_grip1"],[],["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_FMJ",17],[],""],["rhs_uniform_FROG01_d",[["ACE_EarPlugs",1],["ACE_CableTie",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["SmokeShell",4,1],["ACE_M84",2,1],["rhsusf_mag_17Rnd_9x19_FMJ",2,17]]],["rhsusf_spc_patchless_radio",[["ACE_IR_Strobe_Item",2],["rhs_mag_m67",2,1],["SmokeShellBlue",2,1],["SmokeShellGreen",2,1],["ACE_Chemlight_HiWhite",2,1],["ACE_Chemlight_IR",2,1],["rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red",10,30]]],["rhsusf_falconii_coy",[["ACE_elasticBandage",15],["ACE_packingBandage",10],["ACE_quikclot",15],["ACE_epinephrine",1],["ACE_morphine",5],["ACE_tourniquet",4],["ACE_Clacker",1],["ACE_DefusalKit",1],["B_IR_Grenade",2,1],["DemoCharge_Remote_Mag",2,1],["rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red",2,30]]],"rhsusf_opscore_aor1_pelt_nsw","rhsusf_shemagh_gogg_tan",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","tf_anprc152","ItemCompass","ItemWatch","rhsusf_ANPVS_14"]]};
	if (typeof _unit IsEqualTo "rhsusf_usmc_marpat_d_machinegunner") exitwith {[["rhs_weap_m240B_CAP","rhsusf_acc_ARDEC_M240","rhsusf_acc_anpeq15side_bk","rhsusf_acc_SpecterDR_A",["rhsusf_100Rnd_762x51_m62_tracer",100],[],""],[],["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_FMJ",17],[],""],["rhs_uniform_FROG01_d",[["ACE_EarPlugs",1],["ACE_CableTie",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["SmokeShell",4,1],["ACE_M84",2,1],["rhsusf_mag_17Rnd_9x19_FMJ",2,17]]],["rhsusf_spc_patchless_radio",[["ACE_IR_Strobe_Item",2],["ACE_morphine",5],["ACE_tourniquet",4],["rhs_mag_m67",2,1],["SmokeShellBlue",2,1],["SmokeShellGreen",2,1],["ACE_Chemlight_HiWhite",2,1],["ACE_Chemlight_IR",2,1],["rhsusf_100Rnd_762x51_m62_tracer",2,100]]],["rhsusf_falconii_coy",[["ACE_elasticBandage",15],["ACE_packingBandage",10],["ACE_quikclot",15],["ACE_epinephrine",1],["B_IR_Grenade",2,1],["rhsusf_100Rnd_762x51_m62_tracer",3,100]]],"rhsusf_opscore_aor1_pelt_nsw","rhsusf_shemagh2_gogg_tan",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","tf_anprc152","ItemCompass","ItemWatch","rhsusf_ANPVS_14"]]};
	if (typeof _unit IsEqualTo "rhsusf_usmc_marpat_d_smaw") exitwith {[["rhs_weap_hk416d10_LMT","rhsusf_acc_nt4_black","rhsusf_acc_anpeq15_bk","rhsusf_acc_SpecterDR_A",["rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red",30],[],"rhsusf_acc_grip1"],["rhs_weap_maaws","","","rhs_optic_maaws",["rhs_mag_maaws_HEDP",1],[],""],["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_FMJ",17],[],""],["rhs_uniform_FROG01_d",[["ACE_EarPlugs",1],["ACE_CableTie",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["SmokeShell",4,1],["ACE_M84",2,1],["rhsusf_mag_17Rnd_9x19_FMJ",2,17]]],["rhsusf_spc_patchless_radio",[["ACE_IR_Strobe_Item",2],["rhs_mag_m67",2,1],["SmokeShellBlue",2,1],["SmokeShellGreen",2,1],["ACE_Chemlight_HiWhite",2,1],["ACE_Chemlight_IR",2,1],["rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red",10,30]]],["rhsusf_falconii_coy",[["ACE_elasticBandage",15],["ACE_packingBandage",10],["ACE_quikclot",15],["ACE_epinephrine",1],["ACE_morphine",5],["ACE_tourniquet",4],["B_IR_Grenade",2,1],["rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red",2,30],["rhs_mag_maaws_HEDP",1,1]]],"rhsusf_opscore_aor1_pelt_nsw","rhsusf_shemagh2_gogg_od",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","tf_anprc152","ItemCompass","ItemWatch","rhsusf_ANPVS_14"]]};
	if (typeof _unit IsEqualTo "rhsusf_usmc_marpat_d_helipilot") exitwith {[[],[],["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],["rhs_uniform_FROG01_d",[["ACE_EarPlugs",1],["ACE_Flashlight_XL50",1],["ACE_CableTie",1],["SmokeShell",5,1]]],["rhsusf_spc_crewman",[["ACE_IR_Strobe_Item",2],["ACE_HandFlare_Green",2,1],["ACE_HandFlare_Yellow",2,1],["ACE_HandFlare_Red",2,1],["SmokeShellGreen",2,1],["SmokeShellBlue",2,1],["B_IR_Grenade",2,1],["rhsusf_mag_17Rnd_9x19_FMJ",3,17]]],["tfw_ilbe_dd_coy",[]],"rhsusf_hgu56p_visor_black","",[],["ItemMap","ItemGPS","tf_anprc152","ItemCompass","ItemWatch","rhsusf_ANPVS_15"]]};
	if (typeof _unit IsEqualTo "rhsusf_usmc_marpat_d_helicrew") exitwith {[[],[],["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_FMJ",17],[],""],["rhs_uniform_FROG01_d",[["ACE_EarPlugs",1],["ACE_CableTie",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["SmokeShell",5,1],["rhsusf_mag_17Rnd_9x19_FMJ",2,17]]],["rhsusf_spc_light",[["ACE_IR_Strobe_Item",2],["ACE_bloodIV_500",10],["SmokeShellBlue",2,1],["SmokeShellGreen",2,1],["ACE_HandFlare_Green",2,1],["ACE_HandFlare_Yellow",2,1],["B_IR_Grenade",2,1]]],["rhsusf_falconii_coy",[["ACE_elasticBandage",20],["ACE_quikclot",20],["ACE_epinephrine",15],["ACE_morphine",15],["ACE_packingBandage",20],["adv_aceCPR_AED",1],["ACE_bloodIV_500",8]]],"rhsusf_hgu56p_visor_mask_Empire_black","",[],["ItemMap","B_UavTerminal","tf_anprc152","ItemCompass","ItemWatch","rhsusf_ANPVS_15"]]};

};

if !(isnil "_Equipment") then {_unit setUnitLoadout _Equipment;} else {systemchat format ["No Default Loadout for %1. Deselect LRG Preset Loadout or change unit type.", typeof _unit]};