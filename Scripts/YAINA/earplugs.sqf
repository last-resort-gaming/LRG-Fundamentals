/* ----------------------------------------------------------------------------
Script: earplugs.sqf
Description:
    Handle the action of a user adding/removing earplugs.
Parameters:
    _target, _caller, _id, _arguments from event action
Returns:
    None
Author:
    MartinCo
---------------------------------------------------------------------------- */

params ["_target", "_caller", "_id", "_arguments"];
private _nextAction = "Insert";
private _nextColor  = "#00FF00";

// Don't load if ACE is detected - it contains plugs
if (isClass(configFile >> "CfgPatches" >> "ace_main")) exitWith {};

// And wait for main display to be around
waitUntil {!isNull (findDisplay 46)};

// We default to plugs in
if(isNil "YAINA_PlugsIn") then { YAINA_PlugsIn = true; };

// Flip state if not spawning
if (!isNil "_target") then { YAINA_PlugsIn = YAINA_PlugsIn isEqualTo false; };

// Set the sound, and if not spawning, show the message
if (YAINA_PlugsIn isEqualTo true) then {
    ([2, 0] select isNil "_target") fadeSound 0.2;
    _nextAction = "Remove";
    _nextColor  = "#FF0000";
    if (!isNil "_target") then {
        [" <img image='media\images\plugs_in.paa' /><br/><t valign='middle' align='center' size='.4'>Earplugs Inserted</t>",0,0.6, 2,1,0,0] spawn BIS_fnc_dynamicText;
    };
} else {
    ([2, 0] select isNil "_target") fadeSound 1;
    if (!isNil "_target") then {
        ["<img image='media\images\plugs_out.paa' /><br/><t valign='middle' align='center' size='.4'>Earplugs Removed</t>",0,0.6, 2,1,0,0] spawn BIS_fnc_dynamicText;
    };
};

// Replace menu item
_aid = player getVariable "YAINA_Earplugs_AID";
if(!isNil "_aid") then { player removeAction _aid; };
_aid = player addAction [("<t color=""" + _nextColor + """>" + _nextAction + " Earplugs</t>"),"Scripts\YAINA\earplugs.sqf","",-98,false,true,"",'_target isEqualTo vehicle _this'];
player setVariable ["YAINA_Earplugs_AID", _aid];