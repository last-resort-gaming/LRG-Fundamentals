class LRG_ModuleAISpawns: Module_F
{
	scope = 2;
	displayName = "AI Spawn - East";
	icon = "\z\LRG Fundamentals\addons\media\images\icons\AI EAST.paa";
	category = "LRG_Modules";
	function = "LR_fnc_moduleAISpawns";
	functionPriority = 2;
	isGlobal = 0;
	isTriggerActivated = 0;
	isDisposable = 0;
	is3DEN = 0;
	class Attributes: AttributesBase
	{
		class ObjName: Edit
  			{
				property = "LR_AI_ObjName";
				displayName = "Objective Name";
				tooltip = "Name of Objective/Spawn Position.";
				defaultValue = """Objective 1""";
			};
		class EnemyType: Combo
  			{
				property = "LR_AI_EnemyType";
				displayName = "Enemy Faction";
				tooltip = "Enemy Faction Type for this Module.";
				defaultValue = """OPF_F""";
				class values
				{
					class TEC_CSAT 					{name = "@CSAT Mod Project - CSAT (Iran, Mediterranean)";	value = "TEC_CSAT";};
					class TEC_CSAT_Pacific 			{name = "@CSAT Mod Project - CSAT (Iran, Pacific)"; 		value = "TEC_CSAT_Pacific";};
					class CUP_O_ChDKZ 				{name = "@CUP - Chernarussian Movement of the Red Star"; 	value = "CUP_O_ChDKZ";};
					class CUP_O_RU 					{name = "@CUP - Russian Federation"; 						value = "CUP_O_RU";};
					class CUP_O_SLA 				{name = "@CUP - Sahrani Liberation Army";					value = "CUP_O_SLA";};
					class CUP_O_TK 					{name = "@CUP - Takistan Army"; 							value = "CUP_O_TK";};
					class CUP_O_TK_MILITIA 			{name = "@CUP - Takistan Militia"; 							value = "CUP_O_TK_MILITIA";};
					class LIB_RKKA		 			{name = "@IFA3 - Red Army"; 								value = "LIB_RKKA";};					
					class OPTRE_Ins 				{name = "@OPTRE - Insurrectionists"; 						value = "OPTRE_Ins";};
					class LOP_AFR_OPF 				{name = "@Project OPFOR - African Militia"; 				value = "LOP_AFR_OPF";};
					class LOP_AM_OPF 				{name = "@Project OPFOR - Middle Eastern Militia";			value = "LOP_AM_OPF";};
					class LOP_BH 					{name = "@Project OPFOR - Boko Haram";						value = "LOP_BH";};
					class LOP_ChDKZ 				{name = "@Project OPFOR - ChDKZ"; 							value = "LOP_ChDKZ";};
					class LOP_IRA 					{name = "@Project OPFOR - Irish Republican Army"; 			value = "LOP_IRA";};
					class LOP_ISTS_OPF 				{name = "@Project OPFOR - Islamic State"; 					value = "LOP_ISTS_OPF";};
					class LOP_SLA 					{name = "@Project OPFOR - Sahrani Liberation Army"; 		value = "LOP_SLA";};
					class LOP_TKA 					{name = "@Project OPFOR - Takistani Armed Forces"; 			value = "LOP_TKA";};
					class rhs_faction_msv 			{name = "@RHS AFRF - Russia - MSV"; 						value = "rhs_faction_msv";};
					class rhs_faction_vdv 			{name = "@RHS AFRF - Russia - VDV"; 						value = "rhs_faction_vdv";};
					class rhs_faction_vmf 			{name = "@RHS AFRF - Russia - VMF"; 						value = "rhs_faction_vmf";};
					class rhsgref_faction_chdkz		{name = "@RHS GREF - ChDKZ Insurgents";						value = "rhsgref_faction_chdkz";};
					class UNSUNG_E_NVA 				{name = "@UNSUNG - NVA"; 									value = "UNSUNG_E_NVA";};
					class OPF_F						{name = "Vanilla - CSAT"; 									value = "OPF_F";};
					class OPF_T_F 					{name = "Vanilla - CSAT (Pacific)"; 						value = "OPF_T_F";};
				};				
			};
		class Radius: Edit
  			{
				property = "LR_AI_Radius";
				displayName = "Spawn Radius";
				tooltip = "AI Spawn radius from this module.";
				typeName = "NUMBER";
				defaultValue = 500;
			};
		class GarrisonedGroupsMin: Edit
		{
			property = "LR_AI_GarrisonedGroupsMin";
			displayName = "Min Garrisoned Groups";
			description = "Minimum Number of Garrisoned AI Groups to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class GarrisonedGroupsMax: Edit
		{
			property = "LR_AI_GarrisonedGroupsMax";
			displayName = "Max Garrisoned Groups";
			description = "Maximum Number of Garrisoned AI Groups to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};		
		class EIPatrolsMin: Edit
		{
			property = "LR_AI_EIPatrolsMin";
			displayName = "Min Infantry Patrols";
			description = "Minimum Number of Infantry Patrol Groups to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class EIPatrolsMax: Edit
		{
			property = "LR_AI_EIPatrolsMax";
			displayName = "Max Infantry Patrols";
			description = "Maximum Number of Infantry Patrol Groups to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class EIAAMin: Edit
		{
			property = "LR_AI_EIAAMin";
			displayName = "Min AA Infantry";
			description = "Minimum Number of AA Infantry Groups to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class EIAAMax: Edit
		{
			property = "LR_AI_EIAAMax";
			displayName = "Max AA Infantry";
			description = "Maximum Number of AA Infantry Groups to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class EIATMin: Edit
		{
			property = "LR_AI_EIATMin";
			displayName = "Min AT Infantry";
			description = "Minimum Number of AT Infantry Groups to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class EIATMax: Edit
		{
			property = "LR_AI_EIATMax";
			displayName = "Max AT Infantry";
			description = "Maximum Number of AT Infantry Groups to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class VehAAMin: Edit
		{
			property = "LR_AI_VehAAMin";
			displayName = "Min AA Vehicles";
			description = "Minimum Number of AA Vehicles to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class VehAAMax: Edit
		{
			property = "LR_AI_VehAAMax";
			displayName = "Max AA Vehicles";
			description = "Maximum Number of AA Vehicles to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class VehMRAPMin: Edit
		{
			property = "LR_AI_VehMRAPMin";
			displayName = "Min MRAPs";
			description = "Minimum Number of MRAPs to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class VehMRAPMax: Edit
		{
			property = "LR_AI_VehMRAPMax";
			displayName = "Max MRAPs";
			description = "Maximum Number of MRAPs to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class VehLightMin: Edit
		{
			property = "LR_AI_VehLightMin";
			displayName = "Min Light Vehicles";
			description = "Minimum Number of Light Vehicles to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class VehLightMax: Edit
		{
			property = "LR_AI_VehLightMax";
			displayName = "Max Light Vehicles";
			description = "Maximum Number of Light Vehicles to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class VehHeavyMin: Edit
		{
			property = "LR_AI_VehHeavyMin";
			displayName = "Min Heavy Vehicles";
			description = "Minimum Number of Heavy Vehicles to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class VehHeavyMax: Edit
		{
			property = "LR_AI_VehHeavyMax";
			displayName = "Max Heavy Vehicles";
			description = "Maximum Number of Heavy Vehicles to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class VehRandomMin: Edit
		{
			property = "LR_AI_VehRandomMin";
			displayName = "Min Random Vehicles";
			description = "Minimum Number of Random Vehicles to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class VehRandomMax: Edit
		{
			property = "LR_AI_VehRandomMax";
			displayName = "Max Random Vehicles";
			description = "Maximum Number of Random Vehicles to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};			
		class ModuleDescription: ModuleDescription{};
	};
	class ModuleDescription: ModuleDescription
	{
		description[] = {
			"Place this module to spawn selected AI around module location.",
			"Multiple AI Spawn modules can be used with different settings.",
			"Ensure all Max values are greater than min values.",
			"Ensure you have the mod enabled for selected modded faction.",
			"Top Tip: Copy and Paste modules!"
		};
			position = 1; // Position is taken into effect
			direction = 0; // Direction is taken into effect
			optional = 1; // Synced entity is optional
			duplicate = 1; // Multiple entities of this type can be synced
	};
};