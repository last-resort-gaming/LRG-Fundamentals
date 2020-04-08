class AIS_Core {
	tag = "AIS_Core";
	
	class Core {
		file = "z\LRG Fundamentals\Addons\AIS Revive\Functions\Core";
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
		file = "z\LRG Fundamentals\Addons\AIS Revive\Functions\Damage";
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
		file = "z\LRG Fundamentals\Addons\AIS Revive\Functions\Effects";
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
		file = "z\LRG Fundamentals\Addons\AIS Revive\Functions\System";
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