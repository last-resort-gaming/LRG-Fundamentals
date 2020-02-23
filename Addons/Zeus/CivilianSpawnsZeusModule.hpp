class LRG_Module_CivilianSpawnsZeus : Module_F
	{
	    scopeCurator = 1;
	    _generalMacro = "LRG_Module_CivilianSpawnsZeus";
	    displayName = "AI Spawn - Civilian";
	    function = "LR_fnc_moduleCivilianSpawnsZeus";

		mapSize = 1;
		author = "Mokka";
		vehicleClass = "Modules";
		category = "LRG_Modules";
		side = 7;

		scope = 1;

		icon = "\z\LRG Fundamentals\addons\media\images\Icons\AI CIV.paa";
		picture = "\z\LRG Fundamentals\addons\media\images\Icons\AI CIV.paa";
		portrait = "\z\LRG Fundamentals\addons\media\images\Icons\AI CIV.paa";

		functionPriority = 1;
		isGlobal = 2;
		isTriggerActivated = 0;
		isDisposable = 0;

		dlc = "LRG_Fundamentals";
	};