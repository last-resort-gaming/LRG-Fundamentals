class LRG_ModuleSingleScreen: Module_F
{
	scope = 2;
	displayName = "Setup Single Screen";
	icon = "\z\LRG Fundamentals\addons\media\images\icons\SingleScreen.paa";
	category = "LRG_CommandCentre";
	function = "LR_fnc_moduleSingleScreen";
	functionPriority = 4;
	isGlobal = 0;
	isTriggerActivated = 0;
	isDisposable = 0;
	is3DEN = 0;
	class Attributes: AttributesBase
	{
		class SingleScreenCam: Checkbox
  		{
				property = "LR_SingleScreenCam";
				displayName = "Allow Helmet Cams";
				tooltip = "Allow/Disallow viewing Helmet Cams through the screen.";
				typeName = "BOOL";
				defaultValue = true;
		};
		class SingleScreenDrone: Checkbox
  		{
				property = "LR_SingleScreenDrone";
				displayName = "Allow Drone Cams";
				tooltip = "Allow/Disallow viewing Drone Cams through the screen.";
				typeName = "BOOL";
				defaultValue = true;
		};
		class SingleScreenSat: Checkbox
  		{
				property = "LR_SingleScreenSat";
				displayName = "Allow Satellite View";
				tooltip = "Allow/Disallow viewing Satellite Imagery through the screen.";
				typeName = "BOOL";
				defaultValue = true;
		};
		class SingleScreenSelection: Edit
  		{
				property = "LR_SingleScreenSelection";
				displayName = "Screen Texture Selection";
				tooltip = "Texture Selection of the screen, usually '0', at least for vanilla screens.";
				typeName = "NUMBER";
				defaultValue = 0;
		};
		class ModuleDescription: ModuleDescription{};
	};
	class ModuleDescription: ModuleDescription
	{
		description[] = {
			"Sync screens to this module to turn them into Command Centre screen.",
			"You can select which modules of the command centre can be viewed on the screen.",
			"You can sync as many screens to this module as you like."
		};
			position = 0; // Position is taken into effect
			direction = 0; // Direction is taken into effect
			optional = 0; // Synced entity is optional
			duplicate = 1; // Multiple entities of this type can be synced
	};
};