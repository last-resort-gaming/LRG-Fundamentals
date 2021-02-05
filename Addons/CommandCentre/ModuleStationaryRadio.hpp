class LRG_ModuleStationaryRadio: Module_F
{
	scope = 2;
	displayName = "Setup Stationary Radio";
	icon = "\z\LRG Fundamentals\addons\media\images\icons\StationaryRadio.paa"; //todo: proper icon
	category = "LRG_CommandCentre";
	function = "LR_fnc_moduleStationaryRadio";
	functionPriority = 4;
	isGlobal = 0;
	isTriggerActivated = 0;
	isDisposable = 0;
	is3DEN = 0;
	class Attributes: AttributesBase
	{
		class StationaryRadioOn: Checkbox
  		{
				property = "LR_StationaryRadioOn";
				displayName = "Turn Radio On";
				tooltip = "If enabled, the radio will be turned on on Mission Start.";
				typeName = "BOOL";
				defaultValue = true;
		};
		class StationaryRadioCh1: Edit
  		{
				property = "LR_StationaryRadioCh1";
				displayName = "Channel 1 Freq.";
				tooltip = "Default frequency for Channel 1. Can be changed later.";
				typeName = "NUMBER";
				defaultValue = 30;
		};
		class StationaryRadioCh2: Edit
  		{
				property = "LR_StationaryRadioCh2";
				displayName = "Channel 2 Freq.";
				tooltip = "Default frequency for Channel 2. Can be changed later.";
				typeName = "NUMBER";
				defaultValue = 40;
		};
		class StationaryRadioVol: Edit
  		{
				property = "LR_StationaryRadioVol";
				displayName = "Speaker Volume";
				tooltip = "Default volume of the Radio. Can be changed later. Value between 1 and 10.";
				typeName = "NUMBER";
				defaultValue = 7;
		};
		class StationaryRadioClass: Edit
  		{
				property = "LR_StationaryRadioClass";
				displayName = "Radio Class Name";
				tooltip = "Classname of the radio to spawn in, only change this when you want the radio to work with non-BLUFOR nets.";
				defaultValue = """TFAR_anarc210""";
		};
		class StationaryRadioCode: Edit
  		{
				property = "LR_StationaryRadioCode";
				displayName = "Radio Encryption Code";
				tooltip = "Encryption code of the radio. Only change this if you know what you're doing.";
				defaultValue = """_bluefor""";
		};
		class ModuleDescription: ModuleDescription{};
	};
	class ModuleDescription: ModuleDescription
	{
		description[] = {
			"Synched objects will turn into a stationary radio which allows monitoring frequencies over speaker.",
			"You can set the starting parameters for the radio, but they can be changed later.",
			"You can sync multiple objects to this module."
		};
			position = 0; // Position is taken into effect
			direction = 0; // Direction is taken into effect
			optional = 0; // Synced entity is optional
			duplicate = 1; // Multiple entities of this type can be synced
	};
};