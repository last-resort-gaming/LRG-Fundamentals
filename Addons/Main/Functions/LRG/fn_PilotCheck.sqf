// not documented: postInit

if (!hasInterface) exitwith {};

private ["_vehicle", "_fnc_checkAccess"];

switch (LRG_Main_MaydayAccess) do {
	case 0: { _fnc_checkAccess = {false}; };
	case 1: { _fnc_checkAccess = {(_this getVariable ["LRG_Section", -1]) isEqualTo "909 EAW"}; };
	case 2: { _fnc_checkAccess = {true}; };
	default { _fnc_checkAccess = {true}; };
};

[player,"GetInMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];
	_thisArgs params ["_fnc_checkAccess"];

	_PlayerVehRole   = assignedVehicleRole player;
	if(_PlayerVehRole isEqualTo []) exitWith {};
	_playerPos = _PlayerVehRole select 0;

	if ((_vehicle isKindOf "Air") && !(_vehicle isKindOf "ParachuteBase")) then {

		if (_vehicle isKindOf "Helicopter") then {
			_HeliActions =  _vehicle getVariable ["HeliAddActions", false];

			if (not _HeliActions) then {
				[_vehicle, false] remoteExec ["enableCopilot", 0];
				_vehicle addAction ["<t color='#00FFFF'>Authorise Co-Pilot</t>", {params ["_target", "_caller", "_actionId", "_arguments"]; [_target, true] remoteExec ["enableCopilot", 0]}, "", 9, false, true, "", '(driver _target isEqualTo _this) && (not isCopilotEnabled _target)'];
				_vehicle addAction [ "<t color='#B33A3A'>Unauthorise Co-Pilot</t>"   , {params ["_target", "_caller", "_actionId", "_arguments"]; [_target, false] remoteExec ["enableCopilot", 0]}, "", 10, false, true, "", '(driver _target isEqualTo _this) && (isCopilotEnabled _target)'];

				_vehicle setVariable ["HeliAddActions", true, false];
			};

			if (_unit call _fnc_checkAccess) then {

				// check for emergency takeover of controls
				private _handle = [
					{
						params ["_args", "_handle"];
						_args params ["_unit", "_vehicle"];

						// check if pilot still active
						if ([_vehicle] call LR_fnc_isPilotDown) exitWith {
							// check if vehicle moving/on the ground
							if ((round (speed _vehicle) != 0) || (((getPos _vehicle) select 2) > 1)) then {
								// check if player is copilot
								if (_unit in ([_vehicle] call LR_fnc_getCopilots)) then {
									_unit action ["TakeVehicleControl", _vehicle];
									[_vehicle, true] remoteExec ["enableCopilot", 0];

									[
										"<t color='#ff0000' size='0.5'>Emergency Controls Enabled!</t>",
										-1, 0.8, 2,
										0, 0, 789
									] spawn BIS_fnc_dynamicText;
								};
							};
						};
					},
					1,
					[_unit, _vehicle]
				] call CBA_fnc_addPerFrameHandler;

				_vehicle setVariable ["LRG_MaydayHandle", _handle, false];
			};
		};

		if ((_playerPos isEqualTo "driver") && !(player getUnitTrait "Pilot")) exitwith {
			moveOut _unit;
			playSound "Denied";
			["<t color='#FFBB00' size = '.5'>You're not a Pilot.</t>",-1,0.8,5,0.5,0,789] spawn BIS_fnc_dynamicText;
		};
	};
}, [_fnc_checkAccess]] call CBA_fnc_addBISEventHandler;

player addEventHandler [
	"SeatSwitchedMan", {
		params ["_unit1", "_unit2", "_vehicle"];

		_PlayerVehRole   = assignedVehicleRole player;
		if(_PlayerVehRole isEqualTo []) exitWith {};
		_playerPos = _PlayerVehRole select 0;

		if ((_vehicle isKindOf "Air") && !(_vehicle isKindOf "ParachuteBase")) then {
			if ((_playerPos isEqualTo "driver") && !(player getUnitTrait "Pilot")) exitwith {
	    		moveOut _unit1;
				playSound "Denied";
			};
		};
	}
];

player addEventHandler ["GetOutMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];

	// remove the mayday check
	_handle = _vehicle getVariable ["LRG_MaydayHandle", -1];

	if (_handle != -1) then {
		[_handle] call CBA_fnc_removePerFrameHandler;
	};
}];