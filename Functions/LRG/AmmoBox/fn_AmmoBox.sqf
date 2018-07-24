/*
	LRG MISSION TEMPLATE
	fn_AmmoBox.sqf
	Author: MitchJC
	Description: Fills Ammoboxes with predefined equipment dependent on ArsenalType.
*/

if (EnableAmmoBox) then {

        {
                _box = missionNamespace getVariable[_x, objNull];

                if (isServer) then {
                        ["AmmoboxInit", [_box, true]] call BIS_fnc_arsenal;
                };

                [_box, [true], false] call BIS_fnc_removeVirtualItemCargo;
                [_box, [true], false] call BIS_fnc_removeVirtualWeaponCargo;
                [_box, [true], false] call BIS_fnc_removeVirtualBackpackCargo;
                [_box, [true], false] call BIS_fnc_removeVirtualMagazineCargo;
        }
        foreach AmmoBoxName;

_AvailableAmmoHeadGear = [];
_AvailableAmmoGoggles = [];
_AvailableAmmoUniforms = [];
_AvailableAmmoVests = [];
_AvailableAmmoItems = [];
_AvailableAmmoAttachments = [];
_AvailableAmmoWeapons = [];
_AvailableAmmoBackpacks = [];
_AvailableAmmoMagazines = [];

switch (ArsenalType) do {

    case "VANILLA": {
	
			_AvailableAmmoItems = [
				"ItemWatch", 
				"ItemCompass", 
				"ItemGPS", 
				"ItemRadio", 
				"ItemMap", 
				"NVGoggles", 
				"FirstAidKit",
				"Medikit",
				"ToolKit",
				"MineDetector",
				"B_UavTerminal"
			];

			_AvailableAmmoMagazines = [
				"Laserbatteries",
				"30Rnd_545x39_Mag_Tracer_F", 
				"30Rnd_556x45_Stanag_red", 
				"150Rnd_556x45_Drum_Mag_Tracer_F", 
				"200Rnd_556x45_Box_Tracer_Red_F", 
				"20Rnd_650x39_Cased_Mag_F", 
				"30Rnd_65x39_caseless_mag_Tracer", 
				"200Rnd_65x39_cased_Box_Tracer", 
				"10Rnd_762x54_Mag", 
				"20Rnd_762x51_Mag", 
				"30Rnd_762x39_Mag_Tracer_Green_F", 
				"150Rnd_762x51_Box", 
				"130Rnd_338_Mag", 
				"10Rnd_338_Mag", 
				"30Rnd_9x21_Mag_SMG_02_Tracer_Red", 
				"10Rnd_93x64_DMR_05_Mag", 
				"5Rnd_127x108_Mag", 
				"7Rnd_408_Mag", 
				"HandGrenade", 
				"SmokeShell", 
				"SmokeShellGreen",
				"1Rnd_HE_Grenade_shell", 
				"3Rnd_HE_Grenade_shell",
				"DemoCharge_Remote_Mag", 
				"SatchelCharge_Remote_Mag",
				"RPG32_HE_F",
				"Titan_AT",
				"Titan_AA"		
			];
	
	};
	
    case "3CB": {
	
	        _AvailableAmmoItems = [
                "ACE_elasticBandage",
                "ACE_packingBandage",
                "ACE_quikclot",
                "ACE_bloodIV_500",
                "ACE_epinephrine",
                "ACE_morphine",
                "ACE_tourniquet",
                "ACE_CableTie",
                "ACE_IR_Strobe_Item",
                "optic_NVS"
        ];

			_AvailableAmmoMagazines = [
                "UK3CB_BAF_SmokeShell",
                "HandGrenade",
                "DemoCharge_Remote_Mag",
                "UK3CB_BAF_556_30Rnd_T",
                "UK3CB_BAF_556_200Rnd_T",
                "UK3CB_BAF_762_L42A1_20Rnd_T",
                "UK3CB_BAF_1Rnd_HEDP_Grenade_Shell",
                "UK3CB_BAF_1Rnd_60mm_Mo_Shells",
                "Laserbatteries"

			];

			_AvailableAmmoWeapons = [
				"ACE_VMH3",
				"ACE_VMM3",			
                "UK3CB_BAF_M6",
                "UK3CB_BAF_Javelin_Slung_Tube",
                "UK3CB_BAF_NLAW_Launcher",
                "UK3CB_BAF_AT4_CS_AT_Launcher",
                "UK3CB_BAF_Javelin_CLU"
			];
	
	};
	
    case "RHS": {
	
	        _AvailableAmmoItems = [
                "ACE_elasticBandage",
                "ACE_packingBandage",
                "ACE_quikclot",
                "ACE_bloodIV_500",
                "ACE_epinephrine",
                "ACE_morphine",
                "ACE_tourniquet",
                "ACE_CableTie",
                "ACE_IR_Strobe_Item",
                "optic_NVS"
			];
			
							
				_AvailableAmmoMagazines = [

				"rhs_mag_an_m8hc",
				"rhs_mag_m18_green",
				"rhs_mag_m18_purple",
				"rhs_mag_m18_red",
				"rhs_mag_m18_yellow",
				"rhs_mag_m67",
				"Chemlight_blue",
				"Chemlight_green",
				"ACE_Chemlight_HiOrange",
				"ACE_Chemlight_HiRed",
				"ACE_Chemlight_HiWhite",
				"ACE_Chemlight_HiYellow",
				"ACE_Chemlight_IR",
				"ACE_Chemlight_Orange",
				"Chemlight_red",
				"ACE_Chemlight_White",
				"Chemlight_yellow",
				"B_IR_Grenade",
				"rhs_mine_M19_mag",
				"rhsusf_mine_m14_mag",
				"rhsusf_m112x4_mag",
				"rhsusf_m112_mag",
				"Laserbatteries",
				"rhsusf_20Rnd_762x51_m118_special_Mag",
				"rhsusf_20Rnd_762x51_m993_Mag",
				"30Rnd_556x45_Stanag",
				"30Rnd_556x45_Stanag_Tracer_Green",
				"30Rnd_556x45_Stanag_Tracer_Red",
				"30Rnd_556x45_Stanag_Tracer_Yellow",
				"rhsusf_5Rnd_300winmag_xm2010",
				"10Rnd_RHS_50BMG_Box",
				"rhsusf_10Rnd_STD_50BMG_M107",
				"rhs_200rnd_556x45_M_SAW",
				"rhs_200rnd_556x45_T_SAW",
				"rhs_200rnd_556x45_B_SAW",
				"rhsusf_50Rnd_762x51",
				"rhsusf_50Rnd_762x51_m61_ap",
				"rhsusf_50Rnd_762x51_m62_tracer",
				"rhsusf_50Rnd_762x51_m80a1epr",
				"rhsusf_100Rnd_762x51",
				"rhsusf_100Rnd_762x51_m61_ap",
				"rhsusf_100Rnd_762x51_m62_tracer",
				"rhsusf_100Rnd_762x51_m80a1epr",
				"rhsusf_50Rnd_762x51_m993",
				"rhsusf_100Rnd_762x51_m993",
				"rhsusf_mag_6Rnd_M441_HE",
				"rhsusf_mag_6Rnd_M433_HEDP",
				"rhsusf_mag_6Rnd_M714_white",
				"rhsusf_mag_6Rnd_M576_Buckshot",
				"rhsusf_m112_mag",
				"rhsusf_m112x4_mag",
				"rhs_mag_m18_green",
				"rhs_mag_m18_purple",
				"rhs_mag_m18_red",
				"rhs_mag_m18_yellow",
				"rhsusf_5Rnd_00Buck",
				"rhsusf_8Rnd_00Buck",
				"rhsusf_5Rnd_Slug",
				"rhsusf_8Rnd_Slug",
				"rhsusf_5Rnd_HE",
				"rhsusf_8Rnd_HE",
				"rhsusf_5Rnd_FRAG",
				"rhsusf_8Rnd_FRAG",
				"rhsusf_5Rnd_doomsday_Buck",
				"rhsusf_8Rnd_doomsday_Buck",
				"rhs_m136_mag",
				"rhs_m136_hedp_mag",
				"rhs_m136_hp_mag",
				"rhs_fim92_mag",
				"rhs_fgm148_magazine_AT",
				"rhs_mag_smaw_HEAA",
				"rhs_mag_smaw_HEDP",
				"rhs_mag_smaw_SR",
				"rhsusf_mag_7x45acp_MHP",
				"rhsusf_mag_17Rnd_9x19_FMJ",
				"rhsusf_mag_17Rnd_9x19_JHP",
				"rhsusf_mag_15Rnd_9x19_FMJ",
				"rhsusf_mag_15Rnd_9x19_JHP"
			];
				
				_AvailableAmmoWeapons = [				
				"rhs_weap_fgm148",
				"rhs_weap_fim92",
				"rhs_weap_M136",
				"rhs_weap_M136_hedp",
				"rhs_weap_M136_hp",
				"rhs_weap_maaws",
				"rhs_weap_m72a7",
				"rhs_weap_smaw",
				"rhs_weap_smaw_green"
			
			];
	};

	};

        {

                _box = missionNamespace getVariable[_x, objNull];

                [_box, _AvailableAmmoHeadGear, false] call BIS_fnc_addVirtualItemCargo;


                [_box, _AvailableAmmoGoggles, false] call BIS_fnc_addVirtualItemCargo;


                [_box, _AvailableAmmoUniforms, false] call BIS_fnc_addVirtualItemCargo;


                [_box, _AvailableAmmoVests, false] call BIS_fnc_addVirtualItemCargo;


                [_box, _AvailableAmmoItems, false] call BIS_fnc_addVirtualItemCargo;


                [_box, _AvailableAmmoAttachments, false] call BIS_fnc_addVirtualItemCargo;


                [_box, _AvailableAmmoWeapons, false] call BIS_fnc_addVirtualWeaponCargo;


                [_box, _AvailableAmmoBackpacks, false] call BIS_fnc_addVirtualBackpackCargo;


                [_box, _AvailableAmmoMagazines, false] call BIS_fnc_addVirtualMagazineCargo;
				
				{_x addCuratorEditableObjects [[_box], false];} ForEach allcurators;

        }
        foreach AmmoBoxName;


};