class LRG_ModuleCommsTower: Module_F
{
	scope = 2;
	displayName = "Comms Tower";
	icon = "\z\LRG Fundamentals\addons\media\images\icons\RadioTower.paa";
	category = "LRG_CommandCentre";
	function = "LR_fnc_moduleCommsTower";
	functionPriority = 4;
	isGlobal = 0;
	isTriggerActivated = 0;
	isDisposable = 0;
	is3DEN = 0;
	class Attributes: AttributesBase
	{
		class ModuleDescription: ModuleDescription{};
	};
	class ModuleDescription: ModuleDescription
	{
		description[] = {
			"Synched objects get turned into TFAR comms towers.",
			"You can sync as many objects to this module as you like, but it's likely not necessary to have more than one."
		};
			position = 0; // Position is taken into effect
			direction = 0; // Direction is taken into effect
			optional = 0; // Synced entity is optional
			duplicate = 1; // Multiple entities of this type can be synced
	};
};