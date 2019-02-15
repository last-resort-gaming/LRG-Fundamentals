	class LRG_ModuleMedical: Module_F
	{
		scope = 2;
		displayName = "Medical Facility";
		icon = "\z\LRG Fundamentals\addons\media\images\icons\Medical Area.paa";
		author = "MitchJC";
		vehicleClass = "Modules";
		category = "LRG_Modules";
		function = "LR_fnc_moduleMedicalFacility";
		functionPriority = 4;
		isGlobal = 1;
		isTriggerActivated = 0;
		isDisposable = 0;
		is3DEN = 0;
		class Arguments: ArgumentsBaseUnits
		{
			class HealTime
			{
				displayName = "Heal Time";
				description = "Time to fully heal conscious patient.";
				typeName = "NUMBER";
				defaultValue = 6;
			};
			class ReviveTime
			{
				displayName = "Revive Time";
				description = "Time to reive and heal unconscious patient";
				typeName = "NUMBER";
				defaultValue = 10;
			};
		};
		class ModuleDescription: ModuleDescription
		{
			description = "LRG Fundamentals Module Description Goes Here.";
			sync[] = {"LocationArea_F"};
			class LocationArea_F
			{
				position = 0;
				optional = 0;
				duplicate = 1;
				synced[] = {"Anything"};
			};
		};
	};

