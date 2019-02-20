
class LRG_Main {

	tag = "LR";
	class Main {

		file = "z\LRG Fundamentals\Addons\Main\Functions\LRG";
		class AddCueCards {PostInit = 1;};
		class ArsenalLoadSave {PostInit = 1;};
		class Diary {PostInit = 1;};
		class DynamicSim {};
		class DynamicGroups {PostInit = 1;};
		class Earplugs {PostInit = 1;};
		class Logs {PostInit = 1;};
		class PilotCheck {PostInit = 1;};
		class TFARSettings {PostInit = 1;};
		class VanillaFatigue {PostInit = 1;};
		class FindReplaceString {};
		class clientRepackMagazines {};
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
		class init {postinit = 1;};
	};
};

class YAINA {
	tag = "YAINA";

	class General {
		file = "z\LRG Fundamentals\Addons\Main\Functions\YAINA\General";
		class crewNames {postInit = 1;};
		class formatDuration {};
		class showFPS {postInit = 1;};
		class log {};
		class hintC {};
    };
};