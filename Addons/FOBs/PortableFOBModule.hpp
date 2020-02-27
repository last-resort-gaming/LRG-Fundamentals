class LRG_ModulePortableFOB_Camp: Module_F
{
	scope = 2;
	displayName = "Portable FOB - Camp";
	icon = "\z\LRG Fundamentals\addons\media\images\LRG Logo.paa";
	category = "LRG_Modules";
	function = "LR_fnc_modulePortableFOB_Camp";
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
					class ANY							{name = "Any (Camp)";							value = "ANY_CAMP";};
					// Camps
					class Camp_1 						{name = "Camp #1";								value = "Camp_1";};
					class Camp_2 						{name = "Camp #2";								value = "Camp_2";};
					class Camp_3 						{name = "Camp #3";								value = "Camp_3";};
					class Camp_CamoNet_1 				{name = "Camp (Net) #1";						value = "Camp_CamoNet_1";};
					class Camp_CamoNet_4 				{name = "Camp (Net) #2";						value = "Camp_CamoNet_4";};
					class Camp_CamoNet_2 				{name = "Camp (Net) #3";						value = "Camp_CamoNet_2";};
					class Camp_CamoNet_3 				{name = "Camp (Net) #4";						value = "Camp_CamoNet_3";};
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

class LRG_ModulePortableFOB_Small: Module_F
{
	scope = 2;
	displayName = "Portable FOB - Small";
	icon = "\z\LRG Fundamentals\addons\media\images\LRG Logo.paa";
	category = "LRG_Modules";
	function = "LR_fnc_modulePortableFOB_Small";
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
					class ANY							{name = "Any (Small)";							value = "ANY_SMALL";};
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

class LRG_ModulePortableFOB_Medium: Module_F
{
	scope = 2;
	displayName = "Portable FOB - Medium";
	icon = "\z\LRG Fundamentals\addons\media\images\LRG Logo.paa";
	category = "LRG_Modules";
	function = "LR_fnc_modulePortableFOB_Medium";
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
					class ANY							{name = "Any Medium";							value = "ANY_Medium";};
					// Medium
					class Medium_Bunker_1	 			{name = "Medium Bunker #1";						value = "Medium_Bunker_1";};
					class Medium_Bunker_2	 			{name = "Medium Bunker #2";						value = "Medium_Bunker_2";};
					class Medium_Bunker_Dual_1	 		{name = "Medium Bunker (Dual) #1";				value = "Medium_Bunker_Dual_1";};
					class Medium_Bunker_HBarrier_1	 	{name = "Medium Bunker (H-Barrier) #1";			value = "Medium_Bunker_HBarrier_1";};
					class Medium_Bunker_HBarrier_2	 	{name = "Medium Bunker (H-Barrier) #2";			value = "Medium_Bunker_HBarrier_2";};
					class Medium_Bunker_HBarrier_3	 	{name = "Medium Bunker (H-Barrier) #3";			value = "Medium_Bunker_HBarrier_3";};
					class Medium_Bunker_HBarrier_4	 	{name = "Medium Bunker (H-Barrier) #4";			value = "Medium_Bunker_HBarrier_4";};
					class Medium_Bunker_HBarrier_5	 	{name = "Medium Bunker (H-Barrier) #5";			value = "Medium_Bunker_HBarrier_5";};
					class Medium_Bunker_Tower_1	 		{name = "Medium Bunker (Tower) #1";				value = "Medium_Bunker_Tower_1";};
					class Medium_Bunker_Tower_2	 		{name = "Medium Bunker (Tower) #2";				value = "Medium_Bunker_Tower_2";};
					class Medium_Checkpoint_1	 		{name = "Medium Checkpoint #1";					value = "Medium_Checkpoint_1";};
					class Medium_Checkpoint_2	 		{name = "Medium Checkpoint #2";					value = "Medium_Checkpoint_2";};
					class Medium_Checkpoint_3	 		{name = "Medium Checkpoint #3";					value = "Medium_Checkpoint_3";};
					class Medium_CommsTower_1	 		{name = "Medium Comms Tower #1";				value = "Medium_CommsTower_1";};
					class Medium_CommsTower_2	 		{name = "Medium Comms Tower #2";				value = "Medium_CommsTower_2";};
					class Medium_FieldCommand_1	 		{name = "Medium Field Command #1";				value = "Medium_FieldCommand_1";};
					class Medium_FieldHospital_1	 	{name = "Medium Field Hospital #1";				value = "Medium_FieldHospital_1";};
					class Medium_FieldHospital_2	 	{name = "Medium Field Hospital #2";				value = "Medium_FieldHospital_2";};
					class Medium_FieldHospital_3	 	{name = "Medium Field Hospital #3";				value = "Medium_FieldHospital_3";};
					class Medium_FieldLZ_1	 			{name = "Medium Field LZ #1";					value = "Medium_FieldLZ_1";};
					class Medium_Net_1	 				{name = "Medium Net Emplacement #1";			value = "Medium_Net_1";};
					class Medium_Net_2	 				{name = "Medium Net Emplacement #2";			value = "Medium_Net_2";};
					class Medium_Net_3	 				{name = "Medium Net Emplacement #3";			value = "Medium_Net_3";};
					class Medium_Net_4	 				{name = "Medium Net Emplacement #4";			value = "Medium_Net_4";};
					class Medium_VehicleWorkshop_1		{name = "Medium Vehicle Workshop #1";			value = "Medium_VehicleWorkshop_1";};
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

class LRG_ModulePortableFOB_Large: Module_F
{
	scope = 2;
	displayName = "Portable FOB - Large";
	icon = "\z\LRG Fundamentals\addons\media\images\LRG Logo.paa";
	category = "LRG_Modules";
	function = "LR_fnc_modulePortableFOB_Large";
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
					class ANY							{name = "Any Large";							value = "ANY_LARGE";};
					//Large
					class Large_Bunker_1 				{name = "Large Bunker #1";						value = "Large_Bunker_1";};
					class Large_Bunker_2 				{name = "Large Bunker #2";						value = "Large_Bunker_2";};
					class Large_Bunker_3 				{name = "Large Bunker #3";						value = "Large_Bunker_3";};
					class Large_Bunker_4 				{name = "Large Bunker #4";						value = "Large_Bunker_4";};
					class Large_Bunker_Tower_1 			{name = "Large Bunker (Tower) #1";				value = "Large_Bunker_Tower_1";};
					class Large_Bunker_Vehicle_1 		{name = "Large Vehicle Bunker #2";				value = "Large_Bunker_Vehicle_1";};
					class Large_Checkpoint_1 			{name = "Large Checkpoint #1";					value = "Large_Checkpoint_1";};
					class Large_Checkpoint_2 			{name = "Large Checkpoint #2";					value = "Large_Checkpoint_2";};
					class Large_Checkpoint_3 			{name = "Large Checkpoint #3";					value = "Large_Checkpoint_3";};
					class Large_Checkpoint_Vehicle_1 	{name = "Large Checkpoint (Vehicle) #1";		value = "Large_Checkpoint_Vehicle_1";};
					class Large_CommsPost_1 			{name = "Large Comms Post #1";					value = "Large_CommsPost_1";};
					class Large_FieldHospital_1 	 	{name = "Large Field Hospital #1";				value = "Large_FieldHospital_1";};
					class Large_FieldHospital_2 	 	{name = "Large Field Hospital #2";				value = "Large_FieldHospital_2";};
					class Large_FieldHospital_3 	 	{name = "Large Field Hospital #3";				value = "Large_FieldHospital_3";};
					class Large_FieldHQ_1 				{name = "Large Field HQ #1";					value = "Large_FieldHQ_1";};
					class Large_FieldHQ_2 				{name = "Large Field HQ #2";					value = "Large_FieldHQ_2";};
					class Large_FieldHQ_3 				{name = "Large Field HQ #3";					value = "Large_FieldHQ_3";};
					class Large_FieldHQ_4 				{name = "Large Field HQ #4";					value = "Large_FieldHQ_4";};
					class Large_FieldHQ_5 				{name = "Large Field HQ #5";					value = "Large_FieldHQ_5";};
					class Large_FieldHQ_6 				{name = "Large Field HQ #6";					value = "Large_FieldHQ_6";};
					class Large_FieldHQ_LZ_1 			{name = "Large Field HQ (with LZ) #1";			value = "Large_FieldHQ_LZ_1";};
					class Large_FieldHQ_Tent_1 			{name = "Large Field HQ (in Tent) #1";			value = "Large_FieldHQ_Tent_1";};
					class Large_FieldLZ_1 				{name = "Large Field LZ #1";					value = "Large_FieldLZ_1";};
					class Large_ReconPost_1 			{name = "Large Recon Post #1";					value = "Large_ReconPost_1";};
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