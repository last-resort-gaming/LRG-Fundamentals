/*
	LRG MISSION TEMPLATE
	fn_TimedArsenal.sqf
	Author: MitchJC
	Description: Arsenal will be removed after ArsenalDuration unless set to -1.
*/

if ((!EnableArsenal) || (!isServer)) exitwith {};
_handle = [
{
	if (ArsenalDuration == -1) exitwith {};
	
if ((time > (ArsenalDuration * 60)) || (!EnableArsenal)) exitwith {

		{
		deletevehicle(missionNamespace getVariable[_x, objNull]);
		}
		forEach ArsenalName;

		[format ["<t color='#d60007' size = '.5'>Arsenal Removed</t>"],1,-0.2,10,0,0,789] remoteExec ["BIS_fnc_dynamicText",0,false];		

		[_handle] call CBA_fnc_removePerFrameHandler;
		};

		[format ["<t color='#336B87' size = '.5'>Arsenal<br />%1 minutes remaining.</t>",round (((ArsenalDuration * 60) - round time) /60)],1,-0.2,10,2,0,789] remoteExec ["BIS_fnc_dynamicText",0,false];
		
}, 60, []] call CBA_fnc_addPerFrameHandler;
