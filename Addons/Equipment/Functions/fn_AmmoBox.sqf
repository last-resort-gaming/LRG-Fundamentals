/*
Function: LR_fnc_Ammobox

Description:
	Fills an Ammobox with predefined equipment dependent on _Type. Each Ammobox can be a
	different type and have a different duration.  This function is almost identical to
	LR_fnc_Arsenal, only the items in the container change.

Arguments:
	_object - Object the Ammobox is applied to.  <OBJECT>
	_type- Type of Ammobox, can be "VANILLA", "RHS" or "3CB". <STRING>
	_Duration- How long in minutes until the Ammobox is removed. 0 makes it permanent. <SCALAR>

Examples:
	--- Code
		[this] call LR_fnc_Ammobox;
		[this, "3CB", 50] call LR_fnc_Ammobox;
		[this, "VANILLA"] call LR_fnc_Ammobox;
		[MyAmmoCrate, "RHS", 0] call LR_fnc_Ammobox;
	---

Author: MitchJC
*/

if (!isServer) exitwith {};

params [
	"_object",
	["_Type", "Vanilla"],
	["_Duration", 0]
];

call {
	if (_Type isEqualto 0) exitwith {_Type = "Vanilla"};
	if (_Type isEqualto 1) exitwith {_Type = "3CB"};
	if (_Type isEqualto 2) exitwith {_Type = "RHS"};
};

if (isClass (configFile >> "CfgPatches" >> "ace_main")) then {
	[_object, false] call ace_arsenal_fnc_initBox;
} else {
	["AmmoboxInit", [_object, false]] call BIS_fnc_arsenal;
};

private [
	"_AvailableItems", "_AvailableHeadgear", "_AvailableGoggles",
	"_AvailableUniforms", "_AvailableVests", "_AvailableBackpacks",
	"_AvailableAttachments", "_AvailableMagazines", "_AvailableWeapons"
];

call {
	if (_Type isEqualTo "Vanilla") exitwith {
		_AvailableItems = [
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

		_AvailableMagazines = [
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

		_AvailableHeadGear = [];
		_AvailableGoggles = [];
		_AvailableUniforms = [];
		_AvailableVests = [];
		_AvailableAttachments = [];
		_AvailableWeapons = [];
		_AvailableBackpacks = [];
	};

if (_Type isEqualTo "ACETFAR") exitwith {
		_AvailableItems = [
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
			"B_UavTerminal",
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

		_AvailableMagazines = [
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

		_AvailableHeadGear = [];
		_AvailableGoggles = [];
		_AvailableUniforms = [];
		_AvailableVests = [];
		_AvailableAttachments = [];
		_AvailableWeapons = [
			"ACE_VMH3",
			"ACE_VMM3"
		];
		_AvailableBackpacks = [];
	};

	if (_type isEqualTo "3CB") exitwith {
	    _AvailableItems = [
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

		_AvailableMagazines = [
            "UK3CB_BAF_SmokeShell",
            "HandGrenade",
            "DemoCharge_Remote_Mag",
            "UK3CB_BAF_556_30Rnd_T",
            "UK3CB_BAF_556_200Rnd_T",
            "UK3CB_BAF_762_L42A1_20Rnd_T",
            "UK3CB_BAF_1Rnd_HEDP_Grenade_Shell",
            "UK3CB_BAF_1Rnd_60mm_Mo_Shells",
			"UK3CB_BAF_9_13Rnd",
			"UK3CB_BAF_9_15Rnd",
			"UK3CB_BAF_9_17Rnd",
            "Laserbatteries",
			"ACE_Chemlight_HiOrange",
			"ACE_Chemlight_HiRed",
			"ACE_Chemlight_HiWhite",
			"ACE_Chemlight_HiYellow",
			"ACE_Chemlight_IR",
			"ACE_Chemlight_Orange",
			"Chemlight_red",
			"ACE_Chemlight_White",
			"Chemlight_yellow"
		];

		_AvailableWeapons = [
			"ACE_VMH3",
			"ACE_VMM3",
            "UK3CB_BAF_M6",
            "UK3CB_BAF_Javelin_Slung_Tube",
            "UK3CB_BAF_NLAW_Launcher",
            "UK3CB_BAF_AT4_CS_AT_Launcher",
            "UK3CB_BAF_Javelin_CLU"
		];

		_AvailableHeadGear = [];
		_AvailableGoggles = [];
		_AvailableUniforms = [];
		_AvailableVests = [];
		_AvailableAttachments = [];
		_AvailableBackpacks = [];
	};

	if (_type isEqualTo "RHS") exitwith {
	    _AvailableItems = [
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


		_AvailableMagazines = [
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

		_AvailableWeapons = [
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

		_AvailableHeadGear = [];
		_AvailableGoggles = [];
		_AvailableUniforms = [];
		_AvailableVests = [];
		_AvailableAttachments = [];
		_AvailableWeapons = [];
		_AvailableBackpacks = [];
	};
};


if (isClass (configFile >> "CfgPatches" >> "ace_main")) then {
	[_object, _AvailableHeadGear, true] call ace_arsenal_fnc_addVirtualItems;
	[_object, _AvailableGoggles, true] call ace_arsenal_fnc_addVirtualItems;
	[_object, _AvailableUniforms, true] call ace_arsenal_fnc_addVirtualItems;
	[_object, _AvailableVests, true] call ace_arsenal_fnc_addVirtualItems;
	[_object, _AvailableItems, true] call ace_arsenal_fnc_addVirtualItems;
	[_object, _AvailableAttachments, true] call ace_arsenal_fnc_addVirtualItems;
	[_object, _AvailableWeapons, true] call ace_arsenal_fnc_addVirtualItems;
	[_object, _AvailableBackpacks, true] call ace_arsenal_fnc_addVirtualItems;
	[_object, _AvailableMagazines, true] call ace_arsenal_fnc_addVirtualItems;
} else {
	[_object, _AvailableHeadGear, true] call BIS_fnc_addVirtualItemCargo;
	[_object, _AvailableGoggles, true] call BIS_fnc_addVirtualItemCargo;
	[_object, _AvailableUniforms, true] call BIS_fnc_addVirtualItemCargo;
	[_object, _AvailableVests, true] call BIS_fnc_addVirtualItemCargo;
	[_object, _AvailableItems, true] call BIS_fnc_addVirtualItemCargo;
	[_object, _AvailableAttachments, true] call BIS_fnc_addVirtualItemCargo;
	[_object, _AvailableWeapons, true] call BIS_fnc_addVirtualWeaponCargo;
	[_object, _AvailableBackpacks, true] call BIS_fnc_addVirtualBackpackCargo;
	[_object, _AvailableMagazines, true] call BIS_fnc_addVirtualMagazineCargo;
};

{
	_x addCuratorEditableObjects [[_object], false];
} forEach allCurators;



_handle = [
	{
		(_this select 0) params ["_object", "_duration"];

		if (_duration == 0) exitwith {
			[_handle] call CBA_fnc_removePerFrameHandler;
		};

		if (time > (_duration * 60)) exitwith {
			deletevehicle _object;
			[_handle] call CBA_fnc_removePerFrameHandler;
		};

	}, 60, [_object, _duration]
] call CBA_fnc_addPerFrameHandler;
