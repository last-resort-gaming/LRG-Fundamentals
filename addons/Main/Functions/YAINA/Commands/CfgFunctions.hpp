class YAINA_CMD {
	tag = "YAINA_CMD";

    class Core {
        file = "LRG Fundamentals\Main\Functions\YAINA\Commands\Core";
        class postInit { postInit=1; };
		class postInitServer { postInit=1; };
        class log {};
        class exec {};
        class findPlayer {};
        class hasCommand {};
    };

    class Commands {
        file = "LRG Fundamentals\Main\Functions\YAINA\Commands\Commands";
        class help {};
        class logfps {};
        class safeZoneEnabled {};
        class safeZonePosition {};
        class safeZoneArea {};
        class sideChatDuration {};
        class TFAR_distanceMultiplier {};
        class TFAR_interceptionCoefficient {};
    };
};
