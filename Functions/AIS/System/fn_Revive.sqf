/*
 * Author: Psycho
 
 * Handle Revive actions from a PLAYER
 
 * Arguments:
	0: Healer Unit (Object)
	1: Injured Unit (Object)
 
 * Return value:
	Nothing
*/

params [
	["_healer", player, [player]],
	"_injured"
];

// Ensure we aren't going to attachTo a building etc. which can happen due to the addActions, so we reevaluate the statement that lead here
if !(_injured isKindOf 'CAManBase' && {_injured getVariable ['ais_unconscious',false]} && {_injured call AIS_System_fnc_allowRevive}) exitWith {};

// Before we start, if expecting to consume FAKs, make sure we have some,
// If we have one left in our BP and someone takes it during the heal, then
// so be it, since we aren't taking it here, because if they abort then we
// would need even more logic to re-add it, so KISS.

_fakSource   = _healer;
_fakCount    = 0;
_medKitCount = 0;

// If in range of mobile medic station, this becomes the source of FAK consumption
_mobileStation = [_healer] call AIS_System_fnc_mobileMedicStation;

if !(_mobileStation isEqualTo objNull) then {
    _fakSource = _mobileStation;
};

if(_fakSource isEqualTo _healer) then {
    _fakCount     = count (items _healer select { _x isEqualTo "FirstAidKit"; });
    _medKitCount = count (items _healer select { _x isEqualTo "Medikit"; });
} else {
    // we force the medikit count to 1 when it's a mobile medic staiton
    _fakCount     = count (itemCargo _fakSource select { _x isEqualTo "FirstAidKit" });
    _medKitCount = count (itemCargo _fakSource select { _x isEqualTo "Medikit" });
};

// If no FAKs, Bail
if((AIS_CONSUME_FAKS && !(_fakSource getVariable ["AIS_NO_CONSUME_FAKS", false])) && _fakCount isEqualTo 0) exitWith {
    ["You have no First Aid Kits to administer"] remoteExecCall ["AIS_Core_fnc_dynamicText", _healer, false];
};

// If no MedKit Bail, unless excluded
if(AIS_REQUIRE_MEDIKIT && (_medKitCount isEqualTo 0 && _fakSource getVariable ["AIS_REQUIRE_MEDIKIT", true])) exitWith {
    ["You have no Medi Kit"] remoteExecCall ["AIS_Core_fnc_dynamicText", _healer, false];
};


_injured setVariable ["ais_hasHelper", _healer, true];

//_injured playMove "AinjPpneMstpSnonWrflDnon_rolltoback";	// from AIS fsm
[_injured, "AinjPpneMstpSnonWrflDnon_rolltoback"] remoteExec ["playMove", 0];

// switch to primary weapon if possible. Small delay for handling is needed.
if (primaryWeapon _healer != "") then {
	_healer switchmove "amovpercmstpsraswrfldnon";
	_healer selectWeapon (primaryWeapon _healer);
};

_healer playAction "medicStart";

// full heal anim only with primary weapon possible. 
ais_animChangeEVH = _healer addEventhandler ["AnimChanged", {
	params ["_healer","_anim"];
	if (primaryWeapon _healer isEqualTo "") then {
		if (_anim in ["amovpknlmstpsnonwnondnon","amovpknlmstpsraswlnrdnon"]) then {
			_healer playActionNow "medicStart";
		};
	};
}];

_offset = [0,0,0]; _dir = 0;
_relpos = _healer worldToModel position _injured;
if (((_healer getDir _injured) - (_injured getDir _healer)) < 0) then {_offset = [-0.2,0.7,0]; _dir = 90} else {_offset = [0.2,0.7,0]; _dir = 270};

_injured attachTo [_healer, _offset];
[_injured, _dir] remoteExec ["setDir", 0, false];

[_healer, _injured] call AIS_Effects_fnc_medEquip;
private _duration = [_healer, _injured] call AIS_System_fnc_calculateReviveTime;
//hint format ["Revive Time Duration: %1", _duration];	// debug

[
    "Applying First Aid", 
    _duration,
    {
		params ["_injured", "_healer", "_fakSource"];

		_injured setVariable ["ais_unconscious", false, true];
		
		_healer removeEventHandler ["AnimChanged", ais_animChangeEVH];
		detach _healer;
		detach _injured;

		_healer playAction "medicStop";

		_injured setVariable ["ais_hasHelper", ObjNull, true];
		call AIS_Effects_fnc_garbage;
		
		// healing if enabled
		if (AIS_REVIVE_HEAL) then {
			_injured setDamage 0;
			_injured setVariable ["ais_fireDamage", 0];
		} else {
			// make sure the unit can walk after revive
			if ((_injured getHitIndex 10) > 0.49) then {
				[{(_this select 0) setHitIndex [10, 0.49]}, [_injured]] call AIS_Core_fnc_onNextFrame;
			};
		};
		
		[_injured] remoteExecCall ["AIS_System_fnc_restoreFaks", _injured, false];
		
		_injured stop false;
		{_injured enableAI _x; nil} count ["MOVE","TARGET","AUTOTARGET","ANIM","AUTOCOMBAT"];
		[_injured, false] remoteExecCall ["AIS_System_fnc_unconcsiousRemote", 0, false]; 
		[_injured, false] remoteExec ["setCaptive", 0, false];

		// And lastly, remove a FAK from somewhere if required
		if(AIS_CONSUME_FAKS && !(_fakSource getVariable ["AIS_NO_CONSUME_FAKS", false])) then {
		    if (_fakSource isEqualTo _healer) then {
		        _fakLoadout = [_healer] call AIS_System_fnc_getFAKs;
                for "_i" from 0 to count _fakLoadout do {
                    _c = _fakLoadout select _i;
                    if (!(_c isEqualTo 0)) exitWith {
                        if (_i isEqualTo 0) then { _healer removeItemFromUniform "FirstAidKit";  };
                        if (_i isEqualTo 1) then { _healer removeItemFromVest "FirstAidKit";  };
                        if (_i isEqualTo 2) then { _healer removeItemFromBackpack "FirstAidKit";  };
                    };
                };
		    } else {
		        // This is a little lame, we have to clear all, and add less one
		        _fakSourceCargo = getItemCargo _fakSource;
		        _fakIdx = (_fakSourceCargo select 0) find "FirstAidKit";
		        if !(_fakIdx isEqualTo -1) then {
		            _fakCount = (_fakSourceCargo select 1) select _fakIdx;
		            if (_fakCount isEqualTo 1) then {
		                (_fakSourceCargo select 0) deleteAt _fakIdx;
                        (_fakSourceCargo select 1) deleteAt _fakIdx;
                    } else {
                        (_fakSourceCargo select 1) set [_fakIdx, _fakCount - 1];
                    };
                    clearItemCargoGlobal _fakSource;
                    { _fakSource addItemCargoGlobal [_x, (_fakSourceCargo select 1) select _forEachIndex]; } forEach (_fakSourceCargo select 0);
		        };
		    };
		};

		["GetOutMan"] remoteExec ["removeAllEventHandlers", _injured, false];
    },
    [_injured, _healer, _fakSource],
	{
		params ["_injured", "_healer"];
		
		_injured setVariable ["ais_hasHelper", ObjNull, true];
		
		_healer removeEventHandler ["AnimChanged", ais_animChangeEVH];
		detach _healer;
		detach _injured;
		
		call AIS_Effects_fnc_garbage;
		
		if (alive _healer) then {
			_healer playActionNow "medicStop";
		};
		if (!alive _injured) then {["He is not with us anymore."] call AIS_Core_fnc_dynamicText};
	},
	(!alive _injured || _healer getVariable ["ais_unconscious",false])
] call AIS_Core_fnc_Progress_ShowBar;