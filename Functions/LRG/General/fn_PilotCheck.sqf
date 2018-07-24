/*
	LRG MISSION TEMPLATE
	fn_PilotCheck.sqf
	Author: MitchJC
	Description: Allows only Pilots to fly aircraft.
*/


if (!hasInterface) exitwith {};

private ["_vehicle"];

player addEventHandler ["GetInMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];
		
	_PlayerVehRole   = assignedVehicleRole player;
	if(_PlayerVehRole isEqualTo []) exitWith {};
	_playerPos = _PlayerVehRole select 0;
		
	if ((_vehicle isKindOf "Air") && !(_vehicle isKindOf "ParachuteBase")) then {
		
		if (_vehicle isKindOf "Helicopter") then {
				_HeliActions =  _vehicle getVariable ["HeliAddActions","false"];
			
			if (_HeliActions == "false") then {
			    
			[_vehicle, false] remoteExec ["enableCopilot", 0];
			_vehicle addAction ["<t color='#00FFFF'>Authorise Co-Pilot</t>", {params ["_target", "_caller", "_actionId", "_arguments"]; [_target, true] remoteExec ["enableCopilot", 0]}, "", 9, false, true, "", '(driver _target isEqualTo _this) && (not isCopilotEnabled _target)'];
			_vehicle addAction [ "<t color='#B33A3A'>Unauthorise Co-Pilot</t>"   , {params ["_target", "_caller", "_actionId", "_arguments"]; [_target, false] remoteExec ["enableCopilot", 0]}, "", 10, false, true, "", '(driver _target isEqualTo _this) && (isCopilotEnabled _target)'];
         
			_vehicle setVariable ["HeliAddActions", "True", false];
			};
		};
		
		
		if ((_playerPos isEqualTo "driver") && !(player getUnitTrait "Pilot")) exitwith {
		    moveOut _unit;
			["<t color='#FFBB00' size = '.5'>You're not a Pilot.</t>",-1,0.8,5,2,0,789] spawn BIS_fnc_dynamicText;
		};
	};		
}];

player addEventHandler ["SeatSwitchedMan", {
	params ["_unit1", "_unit2", "_vehicle"];
	
	_PlayerVehRole   = assignedVehicleRole player;
	 if(_PlayerVehRole isEqualTo []) exitWith {};
	_playerPos = _PlayerVehRole select 0;
		
	if ((_vehicle isKindOf "Air") && !(_vehicle isKindOf "ParachuteBase")) then {
		if ((_playerPos isEqualTo "driver") && !(player getUnitTrait "Pilot")) exitwith {
	    moveOut _unit1;
		};
	};	
}];




