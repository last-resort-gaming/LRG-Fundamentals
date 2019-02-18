class LRG_ModuleAISpawnsWest: Module_F
{
	scope = 2;
	displayName = "AI Spawn - West";
	icon = "\z\LRG Fundamentals\addons\media\images\icons\AI WEST.paa";
	category = "LRG_Modules";
	function = "LR_fnc_moduleAISpawns";
	functionPriority = 2;
	isGlobal = 0;
	isTriggerActivated = 0;
	isDisposable = 0;
	is3DEN = 0;
	class Attributes: AttributesBase
	{
		class ObjName: Edit
  			{
				property = "LR_AI_ObjName";
				displayName = "Objective Name";
				tooltip = "Name of Objective/Spawn Position.";
				defaultValue = """Objective 1""";
			};
		class EnemyType: Combo
  			{
				property = "LR_AI_EnemyType";
				displayName = "Enemy Faction";
				tooltip = "Enemy Faction Type for this Module.";
				defaultValue = """BLU_F""";
				class values
				{
					class CUP_B_CZ 							{name = "@CUP - Army of the Czech Republic";		value = "CUP_B_CZ";};
					class CUP_B_GB 							{name = "@CUP - British Armed Forces"; 				value = "CUP_B_GB";};
					class CUP_B_GER 						{name = "@CUP - Bundeswehr"; 						value = "CUP_B_GER";};
					class CUP_B_US_Army 					{name = "@CUP - United States Army"; 				value = "CUP_B_US_Army";};
					class OPTRE_UNSC 						{name = "@OPTRE - UNSCDF";							value = "OPTRE_UNSC";};
					class LOP_AA 							{name = "@Project OPFOR - Afghan National Army";	value = "LOP_AA";};
					class LOP_IA 							{name = "@Project OPFOR - Iraqi Armed Forces";		value = "LOP_IA";};
					class rhs_faction_usarmy_d 				{name = "@RHS USAF  - USA Army - Desert"; 			value = "rhs_faction_usarmy_d";};
					class rhs_faction_usarmy_wd 			{name = "@RHS USAF  - USA Army - Woodland"; 		value = "rhs_faction_usarmy_wd";};
					class UK3CB_BAF_Faction_Army_Arctic		{name = "@3CB BAF - Army - Arctic";					value = "UK3CB_BAF_Faction_Army_Arctic";};
					class UK3CB_BAF_Faction_Army_Desert 	{name = "@3CB BAF - Army - Desert";					value = "UK3CB_BAF_Faction_Army_Desert";};
					class UK3CB_BAF_Faction_Army_MTP 		{name = "@3CB BAF - Army - MTP"; 					value = "UK3CB_BAF_Faction_Army_MTP";};
					class UK3CB_BAF_Faction_Army_Temperate	{name = "@3CB BAF - Army - Temperate"; 				value = "UK3CB_BAF_Faction_Army_Temperate";};
					class UK3CB_BAF_Faction_Army_Tropical 	{name = "@3CB BAF - Army - Tropical"; 				value = "UK3CB_BAF_Faction_Army_Tropical";};
					class UK3CB_BAF_Faction_Army_Woodland	{name = "@3CB BAF - Army - Woodland"; 				value = "UK3CB_BAF_Faction_Army_Woodland";};
					class BLU_F 							{name = "Vanilla - NATO"; 							value = "BLU_F";};
					class BLU_T_F							{name = "Vanilla - NATO (Pacific)"; 				value = "BLU_T_F";};
				};				
			};
		class Radius: Edit
  			{
				property = "LR_AI_Radius";
				displayName = "Spawn Radius";
				tooltip = "AI Spawn radius from this module.";
				typeName = "NUMBER";
				defaultValue = 500;
			};
		class GarrisonedGroupsMin: Edit
		{
			property = "LR_AI_GarrisonedGroupsMin";
			displayName = "Min Garrisoned Groups";
			description = "Minimum Number of Garrisoned AI Groups to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class GarrisonedGroupsMax: Edit
		{
			property = "LR_AI_GarrisonedGroupsMax";
			displayName = "Max Garrisoned Groups";
			description = "Maximum Number of Garrisoned AI Groups to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class EIPatrolsMin: Edit
		{
			property = "LR_AI_EIPatrolsMin";
			displayName = "Min Infantry Patrols";
			description = "Minimum Number of Infantry Patrol Groups to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class EIPatrolsMax: Edit
		{
			property = "LR_AI_EIPatrolsMax";
			displayName = "Max Infantry Patrols";
			description = "Maximum Number of Infantry Patrol Groups to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class EIAAMin: Edit
		{
			property = "LR_AI_EIAAMin";
			displayName = "Min AA Infantry";
			description = "Minimum Number of AA Infantry Groups to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class EIAAMax: Edit
		{
			property = "LR_AI_EIAAMax";
			displayName = "Max AA Infantry";
			description = "Maximum Number of AA Infantry Groups to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class EIATMin: Edit
		{
			property = "LR_AI_EIATMin";
			displayName = "Min AT Infantry";
			description = "Minimum Number of AT Infantry Groups to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class EIATMax: Edit
		{
			property = "LR_AI_EIATMax";
			displayName = "Max AT Infantry";
			description = "Maximum Number of AT Infantry Groups to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class VehAAMin: Edit
		{
			property = "LR_AI_VehAAMin";
			displayName = "Min AA Vehicles";
			description = "Minimum Number of AA Vehicles to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class VehAAMax: Edit
		{
			property = "LR_AI_VehAAMax";
			displayName = "Max AA Vehicles";
			description = "Maximum Number of AA Vehicles to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class VehMRAPMin: Edit
		{
			property = "LR_AI_VehMRAPMin";
			displayName = "Min MRAPs";
			description = "Minimum Number of MRAPs to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class VehMRAPMax: Edit
		{
			property = "LR_AI_VehMRAPMax";
			displayName = "Max MRAPs";
			description = "Maximum Number of MRAPs to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class VehLightMin: Edit
		{
			property = "LR_AI_VehLightMin";
			displayName = "Min Light Vehicles";
			description = "Minimum Number of Light Vehicles to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class VehLightMax: Edit
		{
			property = "LR_AI_VehLightMax";
			displayName = "Max Light Vehicles";
			description = "Maximum Number of Light Vehicles to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class VehHeavyMin: Edit
		{
			property = "LR_AI_VehHeavyMin";
			displayName = "Min Heavy Vehicles";
			description = "Minimum Number of Heavy Vehicles to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class VehHeavyMax: Edit
		{
			property = "LR_AI_VehHeavyMax";
			displayName = "Max Heavy Vehicles";
			description = "Maximum Number of Heavy Vehicles to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class VehRandomMin: Edit
		{
			property = "LR_AI_VehRandomMin";
			displayName = "Min Random Vehicles";
			description = "Minimum Number of Random Vehicles to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class VehRandomMax: Edit
		{
			property = "LR_AI_VehRandomMax";
			displayName = "Max Random Vehicles";
			description = "Maximum Number of Random Vehicles to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};			
		class ModuleDescription: ModuleDescription{};
	};
	class ModuleDescription: ModuleDescription
	{
		description[] = {
			"Place this module to spawn selected AI around module location.",
			"Multiple AI Spawn modules can be used with different settings.",
			"Ensure all Max values are greater than min values.",
			"Ensure you have the mod enabled for selected modded faction.",
			"Top Tip: Copy and Paste modules!"
		};
			position = 1; // Position is taken into effect
			direction = 0; // Direction is taken into effect
			optional = 1; // Synced entity is optional
			duplicate = 1; // Multiple entities of this type can be synced
	};
};