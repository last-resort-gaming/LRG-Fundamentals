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

Author: MitchJC, Matth
*/

params [
	"_unit",
	"_Loadout"
];

private ["_Equipment"];

_Equipment = call {
	//================ RHS Loadouts

	// Standard
	if (typeof _unit IsEqualTo "rhsusf_army_ocp_squadleader") exitwith {[["rhs_uniform_cu_ocp",["FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit"]],["rhsusf_iotv_ocp_Squadleader",["rhs_mag_30Rnd_556x45_M855A1_Stanag","rhs_mag_30Rnd_556x45_M855A1_Stanag","rhs_mag_30Rnd_556x45_M855A1_Stanag","rhs_mag_30Rnd_556x45_M855A1_Stanag","rhs_mag_30Rnd_556x45_M855A1_Stanag","rhs_mag_30Rnd_556x45_M855A1_Stanag","rhs_mag_30Rnd_556x45_M855A1_Stanag","rhs_mag_30Rnd_556x45_M855A1_Stanag","rhs_mag_m67","rhs_mag_m67"]],["",[]],"rhsusf_ach_helmet_headset_ocp","G_Aviator","Binocular",["rhs_weap_m4a1_carryhandle",["","rhsusf_acc_anpeq15_top","rhsusf_acc_T1_high",""],"rhs_mag_30Rnd_556x45_M855A1_Stanag"],["",["","","",""],""],["",["","","",""],""],["ItemMap","ItemCompass","ItemWatch","ItemRadio","ItemGPS","rhsusf_ANPVS_14"],[]]};
	if (typeof _unit IsEqualTo "rhs_msv_emr_sergeant") exitwith {[["rhs_uniform_msv_emr",["FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit"]],["rhs_6b23_digi_6sh92_headset_mapcase",["rhs_mag_rgn","rhs_mag_rgn","rhs_30Rnd_545x39_7N10_AK","rhs_30Rnd_545x39_7N10_AK","rhs_30Rnd_545x39_7N10_AK","rhs_30Rnd_545x39_7N10_AK","rhs_30Rnd_545x39_7N10_AK","rhs_30Rnd_545x39_7N10_AK","rhs_30Rnd_545x39_7N10_AK","rhs_30Rnd_545x39_7N10_AK"]],["",[]],"rhs_6b27m_green","G_Aviator","Binocular",["rhs_weap_ak105_zenitco01_b33",["rhs_acc_dtk","","rhs_acc_1p87",""],"rhs_30Rnd_545x39_7N10_AK"],["",["","","",""],""],["rhs_weap_makarov_pm",["","","",""],"rhs_mag_9x18_8_57N181S"],["ItemMap","ItemCompass","ItemWatch","ItemRadio","ItemGPS","rhs_1PN138"],[]]};
	
	// Pacific
	if (typeof _unit IsEqualTo "rhsusf_usmc_marpat_wd_squadleader") exitwith {[["rhs_uniform_FROG01_wd",["FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit"]],["rhsusf_spc_squadleader",["rhs_mag_30Rnd_556x45_M855A1_Stanag","rhs_mag_30Rnd_556x45_M855A1_Stanag","rhs_mag_30Rnd_556x45_M855A1_Stanag","rhs_mag_30Rnd_556x45_M855A1_Stanag","rhs_mag_30Rnd_556x45_M855A1_Stanag","rhs_mag_30Rnd_556x45_M855A1_Stanag","rhs_mag_30Rnd_556x45_M855A1_Stanag","rhs_mag_30Rnd_556x45_M855A1_Stanag","rhs_mag_m67","rhs_mag_m67"]],["",[]],"rhsusf_lwh_helmet_marpatwd_headset","G_Aviator","Binocular",["rhs_weap_m4a1_carryhandle",["","rhsusf_acc_anpeq15_top","rhsusf_acc_T1_high",""],"rhs_mag_30Rnd_556x45_M855A1_Stanag"],["",["","","",""],""],["",["","","",""],""],["ItemMap","ItemCompass","ItemWatch","ItemRadio","ItemGPS","rhsusf_ANPVS_14"],[]]};
	if (typeof _unit IsEqualTo "rhs_vmf_flora_sergeant") exitwith {[["rhs_uniform_msv_emr",["FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit"]],["rhs_6b23_digi_6sh92_headset_mapcase",["rhs_mag_rgn","rhs_mag_rgn","rhs_30Rnd_545x39_7N10_AK","rhs_30Rnd_545x39_7N10_AK","rhs_30Rnd_545x39_7N10_AK","rhs_30Rnd_545x39_7N10_AK","rhs_30Rnd_545x39_7N10_AK","rhs_30Rnd_545x39_7N10_AK","rhs_30Rnd_545x39_7N10_AK","rhs_30Rnd_545x39_7N10_AK"]],["",[]],"rhs_6b27m_green","G_Aviator","Binocular",["rhs_weap_ak105_zenitco01_b33",["rhs_acc_dtk","","rhs_acc_1p87",""],"rhs_30Rnd_545x39_7N10_AK"],["",["","","",""],""],["rhs_weap_makarov_pm",["","","",""],"rhs_mag_9x18_8_57N181S"],["ItemMap","ItemCompass","ItemWatch","ItemRadio","ItemGPS","rhs_1PN138"],[]]};

};

if !(isnil "_Equipment") then {_unit setUnitLoadout _Equipment;} else {systemchat format ["No Default Loadout for %1. Deselect LRG Preset Loadout or change unit type.", typeof _unit]};