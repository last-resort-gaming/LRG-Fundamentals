/*
Function: LR_fnc_initCivilianGestures

Description:
    Initializes the Civilian Interactions through Gestures System (CIGS).
	Called through the CBA setting, should not be called directly!

Arguments:
    None

Return Value:
    None

Example:
    (begin example)
        call LR_fnc_initCivilianGestures;
    (end)

Author:
	Mokka
*/

// do not re-add the EH if the system was disabled temporarily
if !(isNil "LRG_Civilians_CIGSInitialized") exitWith {};

LRG_Civilians_CIGSInitialized = true;

//["LRG_Civilians_"] call CBA_settings_fnc_get;

// adapted from https://github.com/2bnb/2bnb-essentials/blob/master/addons/core/XEH_postInit.sqf

/**
 * Interact with civilians using gestures
 *
 * Possible gestures:
 * - Freeze:		`ace_gestures_Freeze`
 * - Cover:			`ace_gestures_Cover`
 * - Forward:		`ace_gestures_Forward`
 * - Regroup:		`ace_gestures_Regroup`
 * - Engage:		`ace_gestures_Engage`
 * - Point:			`ace_gestures_Point`
 * - Hold:			`ace_gestures_Hold`
 * - Warning:		`ace_gestures_Warning`
 *
 * - Go:			`gestureGo`
 * - Advance:		`gestureAdvance`
 * - Follow:		`gestureFollow`
 * - Up:			`gestureUp`
 * - Stop:			`gestureFreeze`
 * - Cease Fire:	`gestureCeaseFire`
 *
 * All gestures with `ace_gestures_[x]` have a second stance
 * `ace_gestures_[x]StandLowered` for when the player is standing with a
 * lowered weapon, or without one!
 */
["ace_common_playActionNow", {
	params ["_player", "_gesture"];

	// If it's not a player, don't do anything
	if !(isPlayer _player) exitWith {};

	// If the system's been disabled in the mean-time, ignore
	if !(LRG_Civilians_enableGestures) exitWith {};

	// The percentage chance a civilian will listen
	private _chance = [LRG_Civilians_successChance_armed, LRG_Civilians_successChance_unarmed] select (count weapons _player > 0);
	private _acceptedGestures = [];

// Commands affecting units within angle sector

	// Stop!
	_acceptedGestures = [
		"gestureFreeze",
		"ace_gestures_Hold",
		"ace_gestures_HoldStandLowered",
		"ace_gestures_Freeze",
		"ace_gestures_FreezeStandLowered"
	];

	if ((LRG_Civilians_enableStopGestures) && ({_x == _gesture} count _acceptedGestures > 0)) then {
		{
			if !(_x isEqualTo _player) then {
				if (count weapons _x == 0 && {random 1 < _chance}) then {
					if ([position _player, getDir _player, 30, position _x] call BIS_fnc_inAngleSector) then {
						if (vehicle _x == _x) then {
							// In case unit is following someone
							_x setVariable ["lrg_is_following", nil, true];

							[format["%1 told %2 to stop with a %3 gesture", _player, _x, _gesture]] call YAINA_F_fnc_log;
							doStop _x;
							false;
						} else {
							[format["%1 detected %2 in a vehicle for stop gesture", _player, _x, _gesture]] call YAINA_F_fnc_log;
							if (effectiveCommander (vehicle _x) isEqualTo _x) then {
								// In case unit is following someone
								_x setVariable ["lrg_is_following", nil, true];

								[format["%1 told %2 to stop with a %3 gesture", _player, _x, _gesture]] call YAINA_F_fnc_log;
								doStop _x;
								false;
							};
						};
					};
				};
			};
		} count ((entities [["Man"], [], true, true]) inAreaArray [position _player, 50, 50]);
	};

	// Go away!
	_acceptedGestures = [
		"gestureGo",
		"gestureAdvance",
		"ace_gestures_Forward",
		"ace_gestures_ForwardStandLowered",
		"ace_gestures_Engage",
		"ace_gestures_EngageStandLowered"
	];

	if ((LRG_Civilians_enableGoAwayGestures) && ({_x == _gesture} count _acceptedGestures > 0)) then {
		// Source: https://github.com/acemod/ACE3/blob/master/addons/interaction/functions/fnc_sendAway.sqf
		// Extracted from source to avoid an infinite loop caused by line 23 in source
		{
			if (count weapons _x == 0 && {random 1 < _chance}) then {
				if ([position _player, getDir _player, 40, position _x] call BIS_fnc_inAngleSector) then {
					[format["%1 told %2 to go away with a %3 gesture", _player, _x, _gesture]] call YAINA_F_fnc_log;
					// In case unit is following someone
					_x setVariable ["lrg_is_following", nil, true];

					private _position = getPosASL _player vectorAdd (eyeDirection _player vectorMultiply 50);
					_position set [2, 0];

					["ace_interaction_sendAway", [_x, _position], [_x]] call CBA_fnc_targetEvent;
				};
			};
			false;
		} count (_player nearEntities ["Man", 10]);
	};

	// Get down!
	_acceptedGestures = [
		"ace_gestures_Cover",
		"ace_gestures_CoverStandLowered"
	];

	if ((LRG_Civilians_enableGetDownGestures) && ({_x == _gesture} count _acceptedGestures > 0)) then {
		// Source: https://github.com/acemod/ACE3/blob/master/addons/interaction/functions/fnc_sendAway.sqf
		// Extracted from source to avoid an infinite loop caused by line 23 in source
		{
			if (count weapons _x == 0 && {random 1 < _chance}) then {
				if ([position _player, getDir _player, 40, position _x] call BIS_fnc_inAngleSector) then {
					[format["%1 told %2 to get down with a %3 gesture", _player, _x, _gesture]] call YAINA_F_fnc_log;
					// In case unit is following someone
					_x setVariable ["lrg_is_following", nil, true];

					["ace_interaction_getDown", [_x], [_x]] call CBA_fnc_targetEvent;
				};
			};
			false;
		} count (_player nearEntities ["Man", 10]);
	};

// Commands affecting units only under cursor
	private _target = cursorTarget;
	if !(_target isKindOf "Man") exitWith {};

	// Follow!
	_acceptedGestures = ["gestureFollow"];

	if ((LRG_Civilians_enableFollowGestures) && ({_x == _gesture} count _acceptedGestures > 0) && (_player distance _target < 10)) then {

		if (count weapons _target == 0 && {random 1 < _chance}) then {
		[format["%1 told %2 to follow using a %3 gesture", _player, _target, _gesture]] call YAINA_F_fnc_log;

			private _following = [_target, _player] spawn {
				params ["_target", "_player"];
				_target setVariable ["lrg_is_following", _player, true];

				[format["%1 about to move to %2 (%3)", _target, _player, _target getVariable ["lrg_is_following", "nothing"]]] call YAINA_F_fnc_log;
				private _playerPosition = [];
				private _index = 0;

				while {(_target getVariable ["lrg_is_following", false]) isEqualTo _player} do {
					if (_index > 30) exitWith {
						_target setVariable ["lrg_is_following", nil, true];
					};

					if !(_playerPosition isEqualTo (getPosASL _player)) then {
						[format["%1 moving", _target]] call YAINA_F_fnc_log;
						_target doMove (getPosASL _player vectorDiff (vectorDir _player vectorMultiply 4));
						_playerPosition = getPosASL _player;
					};

					sleep 2;
					_index = 1 + _index;
				};
			};
		};
	};


	// Hi there!
	_acceptedGestures = [
		"ace_gestures_Warning",
		"ace_gestures_WarningStandLowered"
	];

	if ((LRG_Civilians_enableGreetingGestures) && ({_x == _gesture} count _acceptedGestures > 0)) then {
		if (
			[position _target, getDir _target, 120, position _player] call BIS_fnc_inAngleSector
			&& ((side group _target) getFriend (side group _player)) > 0.6 // Is friendly-ish?
		) then {
			[format["%1 waved at %2 with a %3 gesture", _player, _target, _gesture]] call YAINA_F_fnc_log;
			[_target, _player] spawn {
				_target = _this select 0;
				sleep 1;
				[_target, "ace_gestures_WarningStandLowered"] call ace_common_fnc_doGesture;
			};
		};
	};
}] call CBA_fnc_addEventHandler;