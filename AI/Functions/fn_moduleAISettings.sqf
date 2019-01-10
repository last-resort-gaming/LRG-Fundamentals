if !(isserver) exitwith {};

params [
    ["_logic",objNull,[objNull]],
    ["_groups",[],[[]]],
    "_localGroups",
    "_logic"
];

_InitialAI = _logic getVariable ["InitialAI", true];
ZeusAI = _logic getVariable ["ZeusAI", true];
LRGaimingAccuracy = _logic getVariable ["LRGaimingAccuracy", 0.10 + random 0.20];
LRGaimingShake = _logic getVariable ["LRGaimingShake", 0.45 + random 0.30];
LRGaimingSpeed = _logic getVariable ["LRGaimingSpeed", 0.30 + random 0.20];
LRGcommanding = _logic getVariable ["LRGcommanding", 1];
LRGcourage = _logic getVariable ["LRGcourage", 1];
LRGgeneral = _logic getVariable ["LRGgeneral", 1];
LRGreloadSpeed = _logic getVariable ["LRGreloadSpeed", 0.50 + random 0.50];
LRGspotDistance = _logic getVariable ["LRGspotDistance", 0.40 + random 0.30];
LRGspotTime = _logic getVariable ["LRGspotTime", 0.20 + random 0.40];

if (_InitialAI) then { call LR_fnc_SetInitialAI;};