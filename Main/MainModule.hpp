	class LRG_ModuleMain: Module_F
	{
		scope = 1;
		displayName = "Mission Setup";
		icon = "LRG Fundamentals\Media\Images\LRG Logo.paa";
		author = "MitchJC";
		vehicleClass = "Modules";
		category = "LRG_Modules";
		function = "LR_fnc_moduleMain";
		functionPriority = 1;
		isGlobal = 1;
		isTriggerActivated = 0;
		isDisposable = 0;
		is3DEN = 0;
		class Arguments: ArgumentsBaseUnits
		{
			class LRG_Main_VehicleCrewList
			{
				displayName = "Vehicle Crew List";
				description = "Shows a list of players in a vehicle.";
				typeName = "BOOL";
				defaultValue = 1;
			};
			class LRG_Main_MapIcons
			{
				displayName = "Map Icons";
				description = "Shows player locations on the map";
				typeName = "BOOL";
				defaultValue = 1;
			};
			class PilotCheck
			{
				displayName = "Pilot Restrictions";
				description = "Enable so only those with Pilot Trait can fly.";
				typeName = "BOOL";
				defaultValue = 1;
			};			
			class ViewDistanceEnable
			{
				displayName = "CH View Distance";
				description = "Enable CHVD within LRG Fundamentals";
				typeName = "BOOL";
				defaultValue = true;
			};
			class ViewDistanceMaxDistance
			{
				displayName = "CHVD - Max View Distance";
				description = "Max distance a player can set CHVD View Distance to.";
				typeName = "NUMBER";
				defaultValue = 12000;
			};
			class ViewDistanceMaxObjectDistance
			{
				displayName = "CHVD - Max Object View Distance";
				description = "Max distance a player can set CHVD Object View Distance to.";
				typeName = "NUMBER";
				defaultValue = 12000;
			};
			class ViewDistanceNoGrass
			{
				displayName = "CHVD - Allow No Grass";
				description = "Should players be allowed to turn grass off?";
				typeName = "BOOL";
				defaultValue = false;
			};			
			class LRG_Main_ArsenalSaveLoad
			{
				displayName = "Arsenal - Save/Load";
				description = "Should a player be allowed to Save/Load Loadouts in the Arsenal?";
				typeName = "BOOL";
				defaultValue = 0;
			};
			class LRG_Main_DynamicWeather
			{
				displayName = "Dynamic Weather";
				description = "Allow randomised Weather";
				typeName = "BOOL";
				defaultValue = 0;
			};
			class LRG_Main_DynamicWeatherStart
			{
				displayName = "Dynamic Weather - Start";
				description = "If Dynamic Weather enabled, what should the starting weather be?";
				typeName = "STRING";
				class values
				{
					class DWRandom
					{
						name = "Random";
						value = "Random";
					};
					class DWClear
					{
						name = "Clear";
						value = "Clear";
						default = 1;
					};
					class DWCloudy
					{
						name = "Cloudy";
						value = "Cloudy";
					};
					class DWRain
					{
						name = "Rain";
						value = "Rain";
					};
				};
			};
			class LRG_Main_TFARTransmitRange
			{
				displayName = "TFAR - Range Multiplyer";
				description = "Increase or decrease max Transmit Range. 0.1 = poor range, 3.5 = All of Altis";
				typeName = "NUMBER";
				defaultValue = 2.5;
			};
			class LRG_Main_TFARTerrainInterference
			{
				displayName = "TFAR - Terrain Interference";
				description = "How much Terrain interferes with range. 0.1 = little impact, 2.0 = large impact.";
				typeName = "NUMBER";
				defaultValue = 1.0;
			};
			class LRG_Main_CueCards
			{
				displayName = "Cue Cards";
				description = "Show/Hide Cue Cards in ACE Self Interaction Menu";
				typeName = "BOOL";
				defaultValue = 1;
			};
			class LRG_Main_Diary
			{
				displayName = "Diary Defaults";
				description = "Show/Hide Default LRG Diary Entries.";
				typeName = "BOOL";
				defaultValue = 1;
			};			
			class LRG_Main_CreatorActions
			{
				displayName = "Creator Actions";
				description = "Show/Hide Creator Actions in ACE Self Interaction Menu";
				typeName = "BOOL";
				defaultValue = 1;
			};
			class LRG_Main_FatigueVanilla
			{
				displayName = "Fatigue (Vanilla ONLY)";
				description = "Enable/Disable Vanilla Fatigue System. Does not apply with @ACE.";
				typeName = "BOOL";
				defaultValue = 0;
			};
			class LRG_Main_FPSCounter
			{
				displayName = "FPS Counter";
				description = "Enable/Disable FPS Counter on Map";
				typeName = "BOOL";
				defaultValue = 1;
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