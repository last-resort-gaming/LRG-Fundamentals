class LRG_ModuleMultiScreen: Module_F
{
	scope = 2;
	displayName = "Setup Multi Screen";
	icon = "\z\LRG Fundamentals\addons\media\images\icons\MultiScreen.paa";
	category = "LRG_CommandCentre";
	function = "LR_fnc_moduleMultiScreen";
	functionPriority = 4;
	isGlobal = 0;
	isTriggerActivated = 0;
	isDisposable = 0;
	is3DEN = 0;
	class Attributes: AttributesBase
	{
		class MultiScreenCam: Checkbox
  		{
				property = "LR_MultiScreenCam";
				displayName = "Allow Helmet Cams";
				tooltip = "Allow/Disallow viewing Helmet Cams through the screen.";
				typeName = "BOOL";
				defaultValue = true;
		};
		class MultiScreenDrone: Checkbox
  		{
				property = "LR_MultiScreenDrone";
				displayName = "Allow Drone Cams";
				tooltip = "Allow/Disallow viewing Drone Cams through the screen.";
				typeName = "BOOL";
				defaultValue = true;
		};
		class MultiScreenSat: Checkbox
  		{
				property = "LR_MultiScreenSat";
				displayName = "Allow Satellite View";
				tooltip = "Allow/Disallow viewing Satellite Imagery through the screen.";
				typeName = "BOOL";
				defaultValue = true;
		};
		class MultiScreenSelections: Edit
  		{
				property = "LR_MultiScreenSelections";
				displayName = "Screen Texture Selections";
				tooltip = "Texture Selections of the multiple screens. Enter as comma-separated list, eg: '1,2,3'";
				defaultValue = """1,2,3""";
		};
		class ModuleDescription: ModuleDescription{};
	};
	class ModuleDescription: ModuleDescription
	{
		description[] = {
			"Sync multi-screen objects to this module to turn them into Command Centre screens.",
			"You can select which modules of the command centre can be viewed on the screen.",
			"You can sync as many screens to this module as you like."
		};
			position = 0; // Position is taken into effect
			direction = 0; // Direction is taken into effect
			optional = 0; // Synced entity is optional
			duplicate = 1; // Multiple entities of this type can be synced
	};
};