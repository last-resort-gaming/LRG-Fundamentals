
class LRG_Main {

	tag = "LR";
	class Main {

		file = "z\LRG Fundamentals\Addons\Main\Functions\LRG";
		class AddCueCards {};
		class ArsenalLoadSave {};
		class Diary {};
		class DynamicSim {};
		class DynamicGroups {};
		class Earplugs {};
		class FlipVehicle {};
		class LockCamVehicle {};
		class Logs {};
		class PilotCheck {};
		class QSRepackMags {};
		class TFARSettings {};
		class VanillaFatigue {};
		class FindReplaceString {};
		class FindInArrayMap {};
		class voyagerCompass {};
		class clientRepackMagazines {};
		class SafePos {};
		class GetKeys {};
		class GetValues {};
	};
};

class CHVD
{
	tag = "CHVD";
	class script
	{
		file = "z\LRG Fundamentals\Addons\Main\Functions\CHVD";
		class onSliderChange {};
		class onLBSelChanged {};
		class onLBSelChanged_syncmode {};
		class onEBinput {};
		class onEBterrainInput {};
		class onEBinput_syncmode {};
		class selTerrainQuality {};
		class updateTerrain {};
		class updateSettings {};
		class updateVehType {};
		class fovViewDistance {};
		class UAVstatus {};
		class openDialog {};
		class localize {};
		class trueZoom {};
		class keyDown {};
		class keyDownTerrain {};
		class init {};
	};
};

class YAINA_F {
	tag = "YAINA_F";

	class General {
		file = "z\LRG Fundamentals\Addons\Main\Functions\YAINA\General";
		class crewNames {};
		class formatDuration {};
		class showFPS {};
		class log {};
		class hintC {};
		class hideTerrainObjects {};
    };
};
class AIS_Core {
	tag = "AIS_Core";
	
	class Core {
		file = "z\LRG Fundamentals\Addons\Main\Functions\AIS\Core";
		class preInit { preInit = 1; };
		class postInit { postInit = 1; };
		class addAction;
		class aisInitHost;
		class aisInitPlayer;
		class bindEventHandler;
		class createLocalMarker;
		class dynamicText;
		class initEvents;
		class inRange;
		class interaction_Loop;
		class isPlayable;
		class onEachFrame;
		class onNextFrame;
		class progress_ShowBar;
		class progress_ShowBarText;
		class removeonEachFrame;
		class setPosAGLS;
		class setVariables;
		class triggerEvent;
		class waitUntilAndExecute;
		class handleDisconnect;
		class resetOnTeamSwitch;
		class addMedicStation;
	};
};	
class AIS_Damage {
	tag = "AIS_Damage";
	
	class Damage {
		file = "z\LRG Fundamentals\Addons\Main\Functions\AIS\Damage";
		class exitDamageHandler;
		class getHitIndexValue;
		class goToDead;
		class handleDamage;
		class verifyDamageType;
	};
};

class AIS_Effects {
	tag = "AIS_Effects";
	
	class Effects {
		file = "z\LRG Fundamentals\Addons\Main\Functions\AIS\Effects";
		class preInit { preInit = 1; };
		class bleeding;
		class BloodSplatterScreen;
		class bulletImpact;
		class deleteBloodSplatterScreen;
		class draw3D;
		class garbage;
		class helpScream;
		class injuredMarker;
		class medEquip;
		class removeInjuredMarker;
		class scream;
		class stabil;
		class toggleRadio;
		class posUpdateInjuredMarker;
	};
};	

class AIS_System {
	tag = "AIS_System";
	
	class System {
		file = "z\LRG Fundamentals\Addons\Main\Functions\AIS\System";
		class postInit { postInit = 1; };
		class addMedEvacObj;
		class AIselfCheck;
		class allowCarry;
		class allowDrag;
		class allowPullIn;
		class allowPullOut;
		class allowRevive;
		class allowStabilize;
		class bloodloss;
		class bloodlossAI;
		class calculateLifeTime;
		class calculateReviveTime;
		class calculateStabilizeTime;
		class callHelp;
		class carry;
		class checkLauncher;
		class checkUnload;
		class diary;
		class disableRespawnButton;
		class drag;
		class findAIHelper;
		class forceRevivePlayer;
		class getCargoIndex;
		class getFAKs;
		class getOutMan;
		class handleHeal;
		class isMedic;
		class keyHandler;
		class killed;
		class loadAIS;
		class loadAISlocalToPlayer;
		class loadInjured;
		class medEvacArea;
		class moveAIHelper;
		class moveCargoRemote;
		class overrideHealAction;
		class release;
		class removeFaks;
		class respawn;
		class restoreFaks;
		class reveal;
		class Revive;
		class ReviveAI;
		class secondsToString;
		class setUnconscious;
		class stabilize;
		class unconcsiousRemote;
		class unconsciousAI;
		class unconsciousPlayer;
		class unloadInjured;
		class mobileMedicStation;
	};
};