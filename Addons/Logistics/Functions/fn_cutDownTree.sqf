/*
*   Original function from ace_logistics_wirecutter by gpgpgpgp, edited by commy2, PabstMirror
*   Adapted for grad_axe by McDiod, modified for LRG Fundamentals by Mokka
*/
#define SOUND_CLIP_TIME_SPACING    1.2

params ["_unit", "_treeObject"];

if (_unit != ACE_player) exitWith {};

private _boundingBoxTree = boundingBox _treeObject;
private _treeSize = (_boundingBoxTree select 0) distance (_boundingBoxTree select 1);
private _specialistFactor = [1, 0.8] select ([_unit] call ACE_common_fnc_isEngineer);
private _timeToCut = (_treeSize * _specialistFactor * (["LRG_Logistics_axeTimeFactor"] call CBA_settings_fnc_get)) min (["LRG_Logistics_axeMaxTime"] call CBA_settings_fnc_get) max 5;

if !(_unit call ace_common_fnc_isSwimming) then {
	[_unit, "Acts_Executioner_Forehand", 0] call ACE_common_fnc_doAnimation;
};

private _onCompletion = {
	(_this select 0) params ["_treeObject", "", "_unit"];
	_treeObject setDamage 1;
	[_treeObject] call LR_fnc_checkCutDown;
	if !(_unit call ACE_common_fnc_isSwimming) then {
		[_unit, "AmovPknlMstpSrasWrflDnon", 1] call ACE_common_fnc_doAnimation;
	};
};

private _onFail = {
    (_this select 0) params ["", "", "_unit"];
    if !(_unit call ace_common_fnc_isSwimming) then {
        [_unit, "AmovPknlMstpSrasWrflDnon", 1] call ace_common_fnc_doAnimation;
    };
};

private _progressCheck = {
	params ["_args", "_passedTime"];
	_args params ["_treeObject", "_lastSoundEffectTime", "_unit"];

	if (_passedTime > (_lastSoundEffectTime + SOUND_CLIP_TIME_SPACING + (random 1))) then {
		playSound3D [format ["z\LRG Fundamentals\addons\Logistics\sounds\chop_%1.ogg", (round (random 25)) + 1], objNull, false, (getPosAsl _unit), 3, 1, 80];
		_args set [1, _passedTime];
	};

	((!isNull _treeObject) && {(damage _treeObject) < 1} && {("LRG_axe" in (items _unit))})
};

[_timeToCut, [_treeObject,0,_unit], _onCompletion, _onFail, "Chopping...", _progressCheck, ["isNotSwimming"]] call ace_common_fnc_progressBar;

["LRG_treeChoppingStarted", [_unit, _treeObject]] call CBA_fnc_globalEvent;