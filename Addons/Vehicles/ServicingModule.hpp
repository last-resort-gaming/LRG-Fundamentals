	class LRG_ModuleServicing: Module_F
	{
		scope = 2;
		displayName = "Vehicle Servicing";
		icon = "\z\LRG Fundamentals\addons\media\images\icons\Vehicle Service.paa";
		author = "MitchJC";
		vehicleClass = "Modules";
		category = "LRG_Modules";
		function = "LR_fnc_moduleServicing";
		functionPriority = 4;
		isGlobal = 1;
		isTriggerActivated = 0;
		isDisposable = 0;
		is3DEN = 0;
		class Arguments: ArgumentsBaseUnits
		{
			class ServicingArea
			{
				displayName = "Servicing Area";
				description = "2D Servicing Area Size around this module.";
				typeName = "NUMBER";
				defaultValue = 10;
			};
			class ServicingHeight
			{
				displayName = "Servicing Height";
				description = "Max Height this area can be activated.";
				typeName = "NUMBER";
				defaultValue = 6;
			};
/*			class ServicingRearm
			{
				displayName = "Rearm Time";
				description = "How long to Rearm at this module.";
				typeName = "NUMBER";
				defaultValue = 20;
			};
			class ServicingRefuel
			{
				displayName = "Refuel Time";
				description = "How long to Refuel at this module.";
				typeName = "NUMBER";
				defaultValue = 20;
			};
			class ServicingRepair
			{
				displayName = "Repair Time";
				description = "How long to Repair at this module.";
				typeName = "NUMBER";
				defaultValue = 20;
			};					
			class ServicingGroundVehicles
			{
				displayName = "Ground Vehicles";
				description = "Can Ground Vehicles be Serviced here?";
				typeName = "BOOL";
				defaultValue = 0;
			};
			class ServicingHelicopters
			{
				displayName = "Helicopters";
				description = "Can Helicopters be Serviced here?";
				typeName = "BOOL";
				defaultValue = 0;
			};
			class ServicingPlanes
			{
				displayName = "Planes";
				description = "Can Planes be Serviced here?";
				typeName = "BOOL";
				defaultValue = 0;
			};
			class ServicingDrones
			{
				displayName = "Drones";
				description = "Can Drones be Serviced here?";
				typeName = "BOOL";
				defaultValue = 0;
			};*/
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

