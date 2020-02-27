class LRG_ModulePortableFOB: Module_F
{
	scope = 2;
	displayName = "Portable FOB";
	icon = "\z\LRG Fundamentals\addons\media\images\LRG Logo.paa";
	category = "LRG_Modules";
	function = "LR_fnc_modulePortableFOB";
	functionPriority = 2;
	isGlobal = 0;
	isTriggerActivated = 0;
	isDisposable = 0;
	is3DEN = 0;
	class Attributes: AttributesBase
	{
		class Type: Combo
  			{
				property = "LR_FOBs_Type";
				displayName = "FOB Type";
				tooltip = "Type of Portable FOB to create.";
				defaultValue = """ANY""";
				class values
				{
					class ANY							{name = "Any";									value = "ANY";};
					class ANY_CAMP						{name = "Any (Camp)";							value = "ANY_CAMP";};
					class ANY_SMALL						{name = "Any (Small)";							value = "ANY_SMALL";};
					class ANY_MEDIUM					{name = "Any (Medium)";							value = "ANY_MEDIUM";};
					class ANY_LARGE						{name = "Any (Large)";							value = "ANY_LARGE";};
					// Camps
					class Camp_1 						{name = "Camp #1";								value = "Camp_1";};
					class Camp_2 						{name = "Camp #2";								value = "Camp_2";};
					class Camp_3 						{name = "Camp #3";								value = "Camp_3";};
					class Camp_CamoNet_1 				{name = "Camp (Net) #1";						value = "Camp_CamoNet_1";};
					class Camp_CamoNet_4 				{name = "Camp (Net) #2";						value = "Camp_CamoNet_4";};
					class Camp_CamoNet_2 				{name = "Camp (Net) #3";						value = "Camp_CamoNet_2";};
					class Camp_CamoNet_3 				{name = "Camp (Net) #4";						value = "Camp_CamoNet_3";};
					// Small
					class Small_AA_Pos 					{name = "Small AA Position";					value = "Small_AA_Pos";};
					class Small_AT_Pos 					{name = "Small AT Position";					value = "Small_AT_Pos";};
					class Small_Bunker_1 				{name = "Small Bunker #1";						value = "Small_Bunker_1";};
					class Small_Bunker_2 				{name = "Small Bunker #2";						value = "Small_Bunker_2";};
					class Small_Bunker_3 				{name = "Small Bunker #3";						value = "Small_Bunker_3";};
					class Small_Bunker_4 				{name = "Small Bunker #4";						value = "Small_Bunker_4";};
					class Small_Bunker_5 				{name = "Small Bunker #5";						value = "Small_Bunker_5";};
					class Small_Bunker_Net_1 			{name = "Small Bunker (Net) #1";				value = "Small_Bunker_Net_1";};
					class Small_Bunker_Net_2 			{name = "Small Bunker (Net) #2";				value = "Small_Bunker_Net_2";};
					class Small_Bunker_Net_3 			{name = "Small Bunker (Net) #3";				value = "Small_Bunker_Net_3";};
					class Small_Bunker_Urban_1 			{name = "Small Bunker (Urban) #1";				value = "Small_Bunker_Urban_1";};
					class Small_Bunker_Wire_1 			{name = "Small Bunker (Wire) #1";				value = "Small_Bunker_Wire_1";};
					class Small_Bunker_Wire_2 			{name = "Small Bunker (Wire) #2";				value = "Small_Bunker_Wire_2";};
					class Small_Bunker_Wire_3 			{name = "Small Bunker (Wire) #3";				value = "Small_Bunker_Wire_3";};
					class Small_LZ_1 					{name = "Small LZ #1";							value = "Small_LZ_1";};
					class Small_LZ_2 					{name = "Small LZ #2";							value = "Small_LZ_2";};
					class Small_LZ_3 					{name = "Small LZ #3";							value = "Small_LZ_3";};
					class Small_RoadCheckpoint 			{name = "Small Road Checkpoint";				value = "Small_RoadCheckpoint";};
					class Small_Tank_Pos 				{name = "Small Tank Position";					value = "Small_Tank_Pos";};
				};
			};
		class ModuleDescription: ModuleDescription{};
	};
	class ModuleDescription: ModuleDescription
	{
		description[] = {
			"Place this module to turn synchronized objects into Portable FOBs.",
			"Make sure the size for the selected FOB is appropriate for the synchronized object.",
			"The option to deploy the FOB will only appear if sufficient space is around the FOB."
		};
			position = 1; // Position is taken into effect
			direction = 0; // Direction is taken into effect
			optional = 0; // Synced entity is optional
			duplicate = 1; // Multiple entities of this type can be synced
	};
};