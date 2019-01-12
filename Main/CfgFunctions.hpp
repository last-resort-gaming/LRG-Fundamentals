
class LRG_Main {

	tag = "LR";
	class Main {

		file = "LRG Fundamentals\Main\Functions\LRG";
		class AddCueCards {PostInit = 1;};
		class ArsenalLoadSave {PostInit = 1;};
		class Diary {PostInit = 1;};
		class InitCreatorActions {PostInit = 1;};
		class ModuleMain {};
		class PilotCheck {PostInit = 1;};
		class RealWeather {PostInit = 1;};
	};
};

class CHVD
{
	tag = "CHVD";
	class script
	{
		file = "LRG Fundamentals\Main\Functions\CHVD";
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
