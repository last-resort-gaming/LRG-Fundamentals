class LRG_ModuleIED: Module_F
{
	scope = 2;
	displayName = "Create IED";
	icon = "a3\ui_f\data\GUI\Cfg\Hints\IEDs_CA.paa"; //todo: find better icon
	category = "LRG_Modules";
	function = "LR_fnc_moduleMakeIED";
	functionPriority = 2;
	isGlobal = 1;
	isTriggerActivated = 0;
	isDisposable = 0;
	is3DEN = 0;
	class Attributes: AttributesBase
	{
		class DetTime: Edit
  			{
				property = "LR_IED_DetTime";
				displayName = "Detonation Delay";
				tooltip = "Time in seconds until the IED explodes after being triggered";
				typeName = "NUMBER";
				defaultValue = 120;
			};

		class ProxRadius: Edit
		{
			property = "LR_IED_ProxRadius";
			displayName = "Trigger Proximity Radius";
			description = "Radius in m around the IED where players will trigger the detonation timer";
			typeName = "Number";
			defaultValue = 20;
		};
        class Secondaries: Checkbox
        {
            property = "LR_IED_Secondaries";
            displayName = "Secondary Explosions";
            description = "Enable/disable random secondary explosives around the IED";
            defaultValue = true;
        };
        class Announce: Checkbox
        {
            property = "LR_IED_Announce";
            displayName = "Announcements";
            description = "Enable/disable announcements when the IED is triggered, when it explodes and in certain intervals during the detonation countdown (see Announce Interval)";
            defaultValue = false;
        };
		class AnnInterval: Edit
		{
			property = "LR_IED_AnnInterval";
			displayName = "Announce Interval";
			description = "Interval in seconds between announcements, ignore if 'Announcements' are disabled";
			typeName = "Number";
			defaultValue = 30;
		};
        class ReqDefKit: Checkbox
        {
            property = "LR_IED_ReqDefKit";
            displayName = "Require Defusal Kit";
            description = "If enabled, players require an ACE defusal kit in order to be able to defuse the IED";
            defaultValue = true;
        };

		class ModuleDescription: ModuleDescription{};
	};
	class ModuleDescription: ModuleDescription
	{
		description[] = {
			"Place this module to turn synched objects into IEDs",
			"Multiple objects can be synched to this module",
			"ACE3 is required for this system to work",
			"The IEDs can be detected using an ACE3 mine detector"
		};
			position = 0;
			direction = 0;
			optional = 1;
			duplicate = 1;
	};
};