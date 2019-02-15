// not documented: module called

params [
    ["_logic",objNull,[objNull]],
    ["_groups",[],[[]]],
    "_localGroups",
    "_logic"
];

//private _HealTime = _logic getVariable ["HealTime", 10];
//private _ReviveTime = _logic getVariable ["ReviveTime", 6];

private _objects = synchronizedObjects _logic;
{
    private _SpawnLocation = getPosATL _x;
    private _GetObjectSize = boundingBoxReal _x;
    private _Width = (_GetObjectSize select 1) select 0;
    private _Length = (_GetObjectSize select 1) select 1;
    private _Height = ((_GetObjectSize select 1) select 2) *2;   
    
    _trg = createTrigger ["EmptyDetector",_SpawnLocation];
    _trg setTriggerArea [_Width, _Length, getdir _x, false, _Height];
    _trg setTriggerActivation ["ANY", "PRESENT", true];
    _trg setTriggerStatements [
        "player in thislist",
        "if (player getVariable ""ACE_isUnconscious"") then {
            [format [""%1<br />is being revived at the LRG Medical Facility."", profileName], [1,-0.2], ""#ed1b2e"", 0.4] call LR_fnc_dynamicText;
            [
                {
                    [objNull, player] call ACE_medical_fnc_treatmentAdvanced_fullHealLocal;
                }, [], 10
            ] call CBA_fnc_waitAndExecute;
        } else {
            [
                {
                    [objNull, player] call ACE_medical_fnc_treatmentAdvanced_fullHealLocal;
                }, [], 5
            ] call CBA_fnc_waitAndExecute;

        };",
        ""
    ];
} foreach _objects;