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
					class UK3CB_CCM_O 				{name = "@3CB Factions - Chernarus Communist Militia";		value = "UK3CB_CCM_O";};
					class UK3CB_TKA_O 				{name = "@3CB Factions - Takistan National Army";			value = "UK3CB_TKA_O";};	
					class UK3CB_TKM_O 				{name = "@3CB Factions - Takistan Insurgents";				value = "UK3CB_TKM_O";};	
					class UK3CB_TKP_O 				{name = "@3CB Factions - Takistan National Police";			value = "UK3CB_TKP_O";};
					class CFP_O_ABUSAYYAF 			{name = "@CFP - Abu Sayyaf Group";							value = "CFP_O_ABUSAYYAF";};
					class CFP_O_ALQAEDA 			{name = "@CFP - Al Qaeda";									value = "CFP_O_ALQAEDA";};
					class CFP_O_ALSHABAAB 			{name = "@CFP - Al-Shabaab";								value = "CFP_O_ALSHABAAB";};
					class CFP_O_ANSARALLAH 			{name = "@CFP - Ansar Allah (Houthis)";						value = "CFP_O_ANSARALLAH";};
					class CFP_O_BOKOHARAM 			{name = "@CFP - Boko Haram";								value = "CFP_O_BOKOHARAM";};
					class CFP_O_CFRebels 			{name = "@CFP - Central African Rebels";					value = "CFP_O_CFRebels";};
					class CFP_O_CHDKZ_SNW 			{name = "@CFP - Chernarussian Movement of the Red Star Winter";	value = "CFP_O_CHDKZ_SNW";};
					class CFP_O_HAMAS 				{name = "@CFP - Hamas Al Qassam Brigades";					value = "CFP_O_HAMAS";};
					class CFP_O_HEZBOLLAH 			{name = "@CFP - Hezbollah";									value = "CFP_O_HEZBOLLAH";};
					class CFP_O_IQARMY 				{name = "@CFP - Iraqi Army (Hussein Regime)";				value = "CFP_O_IQARMY";};
					class CFP_O_IRARMY 				{name = "@CFP - Islamic Republic of Iran Army";				value = "CFP_O_IRARMY";};
					class CFP_O_IS 					{name = "@CFP - Islamic State";								value = "CFP_O_IS";};
					class CFP_O_NKARMY 				{name = "@CFP - Korean People's Army";						value = "CFP_O_NKARMY";};
					class CFP_O_RUARMY_DES 			{name = "@CFP - Russian Ground Forces (Arid / Desert)";		value = "CFP_O_RUARMY_DES";};
					class CFP_O_RUMVD 				{name = "@CFP - Russian National Guard";					value = "CFP_O_RUMVD";};
					class CFP_O_SDARMY 				{name = "@CFP - Sudanese Armed Forces";						value = "CFP_O_SDARMY";};
					class CFP_O_SDMilitia 			{name = "@CFP - Sudan Rapid Support Forces / Janjaweed";	value = "CFP_O_SDMilitia";};
					class CFP_O_SOREBEL 			{name = "@CFP - Somali Rebels";								value = "CFP_O_SOREBEL";};
					class CFP_O_SSREBELS			{name = "@CFP - Sudan People's Liberation Movement";		value = "CFP_O_SSREBELS";};
					class CFP_O_SYARMY 				{name = "@CFP - Syrian Arab Army";							value = "CFP_O_SYARMY";};
					class CFP_O_TBAN 				{name = "@CFP - Taliban Insurgents";						value = "CFP_O_TBAN";};																									
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

		class GarrRadius: Edit
  			{
				property = "LR_AI_GarRadius";
				displayName = "Garrison Radius";
				tooltip = "AI Garrison radius from this module.";
				typeName = "NUMBER";
				defaultValue = 100;
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
		
		class PatrolMethod: Combo
  			{
				property = "LR_AI_PatrolMethod";
				displayName = "Patrol Method";
				tooltip = "Method to use for plotting patrol paths";
				defaultValue = """RANDOM""";
				class values
				{
					class RANDOM 				{name = "Random";		value = "RANDOM";};
					class ROAD	 				{name = "Along Roads";	value = "ROAD";};
				};
			};
		class Radius: Edit
  			{
				property = "LR_AI_Radius";
				displayName = "Patrol Radius";
				tooltip = "AI Patrol radius from this module.";
				typeName = "NUMBER";
				defaultValue = 500;
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
		class SniperMin: Edit
		{
			property = "LR_AI_SniperMin";
			displayName = "Min Sniper Teams";
			description = "Minimum Number of Sniper Teams to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class SniperMax: Edit
		{
			property = "LR_AI_SniperMax";
			displayName = "Max Sniper Teams";
			description = "Maximum Number of Sniper Teams to Spawn";
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