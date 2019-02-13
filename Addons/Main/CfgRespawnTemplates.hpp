class CfgRespawnTemplates
{
	class LRG_RespawnOnStartPosition
	{
		displayName = "LRG Respawn on Start Position";
		onPlayerRespawn = "z\LRG Fundamentals\addons\Main\Scripts\RespawnOnStartPosition.sqf";
		respawnDelay = 10;
		respawnOnStart = 0;
	};
	class LRG_RespawnForWarlords
	{
		displayName = "LRG Respawn for Warlords";
		onPlayerRespawn = "z\LRG Fundamentals\addons\Main\Scripts\RespawnForWarlords.sqf";
		respawnDelay = 10;
		respawnOnStart = 0;
	};	
};