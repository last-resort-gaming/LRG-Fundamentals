class LRG_ModuleAISpawnsWest: Module_F
{
	scope = 2;
	displayName = "AI Spawn - West";
	icon = "\z\LRG Fundamentals\addons\media\images\icons\AI WEST.paa";
	author = "MitchJC";
	vehicleClass = "Modules";
	category = "LRG_Modules";
	function = "LR_fnc_moduleAISpawns";
	functionPriority = 2;
	isGlobal = 0;
	isTriggerActivated = 0;
	isDisposable = 0;
	is3DEN = 0;
	class Arguments: ArgumentsBaseUnits
	{
		class ObjName
		{
			displayName = "Objective Name";
			description = "Name of Objective/Spawn Position";
			typeName = "STRING";
			defaultValue = "Objective 1";
		};
		class EnemyType
		{
			displayName = "Enemy Faction";
			description = "Enemy Faction Type for this Module.";
			typeName = "STRING";
			class values
			{
				class CUP_B_CZ
				{
					name = "@CUP - Army of the Czech Republic";
					value = "CUP_B_CZ";
				};
				class CUP_B_GB
				{
					name = "@CUP - British Armed Forces";
					value = "CUP_B_GB";
				};
				class CUP_B_GER
				{
					name = "@CUP - Bundeswehr";
					value = "CUP_B_GER";
				};
				class CUP_B_US_Army
				{
					name = "@CUP - United States Army";
					value = "CUP_B_US_Army";
				};
				class OPTRE_UNSC
				{
					name = "@OPTRE - UNSCDF";
					value = "OPTRE_UNSC";
				};
				class LOP_AA
				{
					name = "@Project OPFOR - Afghan National Army";
					value = "LOP_AA";
				};
				class LOP_IA
				{
					name = "@Project OPFOR - Iraqi Armed Forces";
					value = "LOP_IA";
				};
				class rhs_faction_usarmy_d
				{
					name = "@RHS USAF  - USA Army - Desert";
					value = "rhs_faction_usarmy_d";
				};
				class rhs_faction_usarmy_wd
				{
					name = "@RHS USAF  - USA Army - Woodland";
					value = "rhs_faction_usarmy_wd";
				};
				class UK3CB_BAF_Faction_Army_Arctic
				{
					name = "@3CB BAF - Army - Arctic";
					value = "UK3CB_BAF_Faction_Army_Arctic";
				};
				class UK3CB_BAF_Faction_Army_Desert
				{
					name = "@3CB BAF - Army - Desert";
					value = "UK3CB_BAF_Faction_Army_Desert";
				};
				class UK3CB_BAF_Faction_Army_MTP
				{
					name = "@3CB BAF - Army - MTP";
					value = "UK3CB_BAF_Faction_Army_MTP";
				};
				class UK3CB_BAF_Faction_Army_Temperate
				{
					name = "@3CB BAF - Army - Temperate";
					value = "UK3CB_BAF_Faction_Army_Temperate";
				};
				class UK3CB_BAF_Faction_Army_Tropical
				{
					name = "@3CB BAF - Army - Tropical";
					value = "UK3CB_BAF_Faction_Army_Tropical";
				};
				class UK3CB_BAF_Faction_Army_Woodland
				{
					name = "@3CB BAF - Army - Woodland";
					value = "UK3CB_BAF_Faction_Army_Woodland";
				};
				class BLU_F
				{
					name = "Vanilla - NATO";
					value = "BLU_F";
				};
				class BLU_T_F
				{
					name = "Vanilla - NATO (Pacific)";
					value = "BLU_T_F";
				};
			};
			defaultValue = "BLU_F";
		};
		class Radius
		{
			displayName = "Spawn Radius";
			description = "AI Spawn radius from this module";
			typeName = "NUMBER";
			defaultValue = 500;
		};
		class GarrisonedGroups
		{
			displayName = "Garrisoned Groups";
			description = "Number of Garrisoned AI Groups to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class GarrisonedGroupsMin
		{
			displayName = "Garrisoned Groups Min Radius";
			description = "The minimum radius in metres around the Spawn Position which shall be populated with garrisoned units.";
			typeName = "Number";
			defaultValue = 0;
		};
		class GarrisonedGroupsMax
		{
			displayName = "Garrisoned Groups Max Radius";
			description = "	The maximum radius in metres around the Spawn Position which shall be populated with garrisoned units.";
			typeName = "Number";
			defaultValue = 200;
		};
		class EIPatrolsMin
		{
			displayName = "Min Infantry Patrols";
			description = "Minimum Number of Infantry Patrol Groups to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class EIPatrolsMax
		{
			displayName = "Max Infantry Patrols";
			description = "Maximum Number of Infantry Patrol Groups to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class EIAAMin
		{
			displayName = "Min AA Infantry";
			description = "Minimum Number of AA Infantry Groups to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class EIAAMax
		{
			displayName = "Max AA Infantry";
			description = "Maximum Number of AA Infantry Groups to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class EIATMin
		{
			displayName = "Min AT Infantry";
			description = "Minimum Number of AT Infantry Groups to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class EIATMax
		{
			displayName = "Max AT Infantry";
			description = "Maximum Number of AT Infantry Groups to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class VehAAMin
		{
			displayName = "Min AA Vehicles";
			description = "Minimum Number of AA Vehicles to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class VehAAMax
		{
			displayName = "Max AA Vehicles";
			description = "Maximum Number of AA Vehicles to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class VehMRAPMin
		{
			displayName = "Min MRAPs";
			description = "Minimum Number of MRAPs to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class VehMRAPMax
		{
			displayName = "Max MRAPs";
			description = "Maximum Number of MRAPs to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class VehLightMin
		{
			displayName = "Min Light Vehicles";
			description = "Minimum Number of Light Vehicles to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class VehLightMax
		{
			displayName = "Max Light Vehicles";
			description = "Maximum Number of Light Vehicles to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class VehHeavyMin
		{
			displayName = "Min Heavy Vehicles";
			description = "Minimum Number of Heavy Vehicles to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class VehHeavyMax
		{
			displayName = "Max Heavy Vehicles";
			description = "Maximum Number of Heavy Vehicles to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class VehRandomMin
		{
			displayName = "Min Random Vehicles";
			description = "Minimum Number of Random Vehicles to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class VehRandomMax
		{
			displayName = "Max Random Vehicles";
			description = "Maximum Number of Random Vehicles to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
	};
	class ModuleDescription: ModuleDescription
	{
		description = "LRG Fundamentals Module Description Goes Here.";
		sync[] = {"LocationArea_F"};
		class LocationArea_F
		{
			position = 0;
			optional = 0;
			duplicate = 1;
			synced[] = {"Anything"};
		};
	};
};