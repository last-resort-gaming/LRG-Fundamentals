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
					class ANY				{name = "Any";								value = "ANY";};
					class ANY_CAMP			{name = "Any (Camp)";						value = "ANY_CAMP";};
					class ANY_SMALL			{name = "Any (Small)";						value = "ANY_SMALL";};
					class ANY_MEDIUM		{name = "Any (Medium)";						value = "ANY_MEDIUM";};
					class ANY_LARGE			{name = "Any (Large)";						value = "ANY_LARGE";};
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