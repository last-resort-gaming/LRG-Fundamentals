/*
	LRG MISSION TEMPLATE
	description_ext_common.hpp
	Author: MitchJC, Mokka
    Description: Contains common defines and settings used in all missions. 
    This file is included in the main description.ext, to allow machine-generated
    description.exts to be used without complication.
*/

class Header 
	{
		gameType = COOP;
		minPlayers = 1;	
		maxPlayers = 60;
	}; 

//------------------------- Admin

enableDebugConsole = 1;	
allowFunctionsLog = 1;

//------------------------- Misc
briefing=0;
debriefing=0;
saving=0;
disableChannels[]={{0,true,true},{1,true,true},{2,true,true},{3,true,true},{4,true,true},{5,false,true},{6,true,true}};
disabledAI = 1;	
aiKills = 0;
enableItemsDropping = 1;
joinUnassigned = 1;
showUAVFeed = 1;
showMap = 0;
showNotePad = 0;
showPad = 0;
showSquadRadar = 0;

//------------------------- Respawn

Respawn = 3;
RespawnDelay = 10;
RespawnDialog = 0;
respawnOnStart = 0;

//------------------------- Garbage collector
							
minPlayerDistance = 50;

corpseManagerMode = 1;
corpseLimit = 1;
corpseRemovalMinTime = 900;
corpseRemovalMaxTime = 1200;

wreckManagerMode = 1;
wreckLimit = 5;
wreckRemovalMinTime = 60;
wreckRemovalMaxTime = 120;
