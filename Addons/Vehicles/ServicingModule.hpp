class LRG_ModuleServicing: Module_F
{
	scope = 2;
	displayName = "Vehicle Servicing";
	icon = "\z\LRG Fundamentals\addons\media\images\icons\Vehicle Service.paa";
	category = "LRG_Modules";
	function = "LR_fnc_moduleServicing";
	functionPriority = 4;
	isGlobal = 1;
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
			"Sync this module to an object to create a Repair Facility within that location.",
			"The module will repair, refuel and rearm any vehicle after a set time delay.",
			"This module is best used with Helipads/Parachute targets.",
			"This Module can be synced to multiple objects or multiple modules can be used."
		};
			position = 0; // Position is taken into effect
			direction = 0; // Direction is taken into effect
			optional = 1; // Synced entity is optional
			duplicate = 1; // Multiple entities of this type can be synced
	};
};