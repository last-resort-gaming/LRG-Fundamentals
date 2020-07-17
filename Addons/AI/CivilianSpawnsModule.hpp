class LRG_ModuleCivilianSpawns: Module_F
{
	scope = 2;
	displayName = "AI Spawn - Civilian";
	icon = "\z\LRG Fundamentals\addons\media\images\Icons\AI CIV.paa";
	category = "LRG_Modules";
	function = "LR_fnc_moduleCivilianSpawns";
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
		class Type: Combo
  			{
				property = "LR_AI_Type";
				displayName = "Civilian Faction";
				tooltip = "Civilian Faction Type for this Module.";
				defaultValue = """CIV_F""";
				class values
				{
					class CIV_F					{name = "Default Civilians (Altis)";						value = "CIV_F";};
					class UK3CB_CHC_C			{name = "@3CB Factions - Civilians (Chernarus)";			value = "UK3CB_CHC_C";};
					class UK3CB_TKC_C			{name = "@3CB Factions - Civilians (Takustan)";				value = "UK3CB_TKC_C";};
					class CFP_C_AFG 			{name = "@CFP - Civilians (Afghanistan)";					value = "CFP_C_AFG";};
					class CFP_C_AFRCHRISTIAN 	{name = "@CFP - Civilians (African Christian)";				value = "CFP_C_AFRCHRISTIAN";};
					class CFP_C_AFRISLAMIC 		{name = "@CFP - Civilians (African Islamic)";				value = "CFP_C_AFRISLAMIC";};
					class CFP_C_ASIA 			{name = "@CFP - Civilians (Asian)";							value = "CFP_C_ASIA";};
					class CUP_C_CHERNARUS 		{name = "@CUP - Civilians (Chernarus)";						value = "CUP_C_CHERNARUS";};
					class CUP_C_SAHRANI 		{name = "@CUP - Civilians (Middle Eastern)";				value = "CUP_C_SAHRANI";};
					class CUP_C_RU 				{name = "@CUP - Civilians (Russian)";						value = "CUP_C_R";};
					class CUP_C_TK 				{name = "@CUP - Civilians (Takistan)";						value = "CUP_C_TK";};
				};
			};
		class Side: Combo
  			{
				property = "LR_AI_Side";
				displayName = "Civilian Side";
				tooltip = "Side to spawn the Civilians on.";
				defaultValue = """CIVILIAN""";
				class values
				{
					class CIVILIAN		{name = "Civilian";								value = "civilian";};
					/*class WEST  		{name = "Blufor";								value = "west";};
					class EAST  		{name = "Opfor";								value = "east";};
					class INDEPENDENT  	{name = "Independent";							value = "independent";};*/ // TODO: make this work
				};
			};

		class GarrRadius: Edit
  			{
				property = "LR_AI_GarRadius";
				displayName = "Garrison Radius";
				tooltip = "AI Garrison radius from this module.";
				typeName = "NUMBER";
				defaultValue = 200;
			};

		class GarrisonedUnitsMin: Edit
		{
			property = "LR_AI_GarrisonedUnitsMin";
			displayName = "Min Garrisoned Units";
			description = "Minimum Number of Garrisoned Civilians to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class GarrisonedUnitsMax: Edit
		{
			property = "LR_AI_GarrisonedUnitsMax";
			displayName = "Max Garrisoned Units";
			description = "Maximum Number of Garrisoned Civilians to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};

		class Radius: Edit
  			{
				property = "LR_AI_Radius";
				displayName = "Patrol Radius";
				tooltip = "Civilian Spawn radius from this module.";
				typeName = "NUMBER";
				defaultValue = 500;
			};

		class CivPedPatrolsMin: Edit
		{
			property = "LR_AI_CivPedPatrolsMin";
			displayName = "Min Pedestrian Patrols";
			description = "Minimum Number of Pedestrians to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class CivPedPatrolsMax: Edit
		{
			property = "LR_AI_CivPedPatrolsMax";
			displayName = "Max Pedestrian Patrols";
			description = "Maximum Number of Pedestrians to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class CivVehPatrolsMin: Edit
		{
			property = "LR_AI_CivVehPatrolsMin";
			displayName = "Min Vehicle Patrols";
			description = "Minimum Number of Vehicle Patrols to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class CivVehPatrolsMax: Edit
		{
			property = "LR_AI_CivVehPatrolsMax";
			displayName = "Max Vehicle Patrols";
			description = "Maximum Number of Vehicle Patrols to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class CivVehParkedMin: Edit
		{
			property = "LR_AI_CivVehParkedMin";
			displayName = "Min Parked Vehicles";
			description = "Minimum Number of Parked Vehicles to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class CivVehParkedMax: Edit
		{
			property = "LR_AI_CivVehPaarkedMax";
			displayName = "Max Parked Vehicle";
			description = "Maximum Number of Parked Vehicles to Spawn";
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