class LRG_ModuleAISettings: Module_F
{
	scope = 1;
	displayName = "AI Difficulty Settings";
	icon = "LRG Fundamentals\Media\Images\LRG Logo.paa";
	author = "MitchJC";
	vehicleClass = "Modules";
	category = "LRG_Modules";
	function = "LR_fnc_moduleAISettings";
	functionPriority = 1;
	isGlobal = 0;
	isTriggerActivated = 0;
	isDisposable = 0;
	is3DEN = 0;
	class Arguments: ArgumentsBaseUnits
	{
		class InitialAI
		{
			displayName = "Include Initial AI";
			description = "This Module will automatically apply to AI Spawns and Zeus placed AI. If enabled it will also apply to any Editor placed AI at mission start.";
			typeName = "BOOL";
			defaultValue = 1;
		};	
		class LRGAimingAccuracy
		{
			displayName = "Min Aiming Accuracy";
			description = "Higher value means the AI will be more likely to hit the target.";
			typeName = "Number";
			defaultValue = 0.10;
		};
		class LRGAimingShake
		{
			displayName = "Min Aiming Shake";
			description = "Higher value means the AI will be more precise.";
			typeName = "Number";
			defaultValue = 0.45;
		};
		class LRGAimingSpeed
		{
			displayName = "Min Aiming Speed";
			description = "Higher value means the AI can rotate and stabilize its aim faster.";
			typeName = "Number";
			defaultValue = 0.30;
		};
		class LRGCommanding
		{
			displayName = "Commanding";
			description = "Higher value means the AI can report targets faster.";
			typeName = "Number";
			defaultValue = 1;
		};
		class LRGCourage
		{
			displayName = "Courage";
			description = "Higher value means the AI has got more courage.";
			typeName = "Number";
			defaultValue = 1;
		};
		class LRGGeneral
		{
			displayName = "General";
			description = "Higher value improves the AI's decision making.";
			typeName = "Number";
			defaultValue = 1;
		};
		class LRGReloadSpeed
		{
			displayName = "Min Reload Speed";
			description = "Higher value means the AI can switch or reload weapons faster.";
			typeName = "Number";
			defaultValue = 0.50;
		};
		class LRGSpotDistance
		{
			displayName = "Min Spot Distance";
			description = "Higher value means the AI is better at spotting targets.";
			typeName = "Number";
			defaultValue = 0.40;
		};
		class LRGSpotTime
		{
			displayName = "Min Spot Time";
			description = "Higher value means the AI will react faster to death, damage or enemies.";
			typeName = "Number";
			defaultValue = 0.20;
		};
																																																			
	};
	class ModuleDescription: ModuleDescription
	{
		description = "Short module description";
		sync[] = {"LocationArea_F"};
		class LocationArea_F
		{
			position = 0;
			optional = 0;
			duplicate = 1;
			synced[] = {"Anything"};
		description[] = {
			"When this Module is placed, all AI placed by Zeus wil use these difficulty settings.",
			"This Module also applies a + random amount to any Min named value to add a bit of variation."
			};
		};
	};
};