// not documented: module called

params [
    ["_logic",objNull,[objNull]],
    ["_groups",[],[[]]],
    "_localGroups",
    "_logic"
];

private _objects = synchronizedObjects _logic;
{

    private _trg = _x;

    if !(_trg isKindOf "EmptyDetector") then {
        private _SpawnLocation = getPosATL _x;
        private _GetObjectSize = boundingBoxReal _x;
        private _Width = (_GetObjectSize select 1) select 0;
        private _Length = (_GetObjectSize select 1) select 1;
        private _Height = ((_GetObjectSize select 1) select 2) *2;
        _trg = createTrigger ["EmptyDetector",_SpawnLocation];
        _trg setTriggerArea [_Width, _Length, getdir _trg, false, _Height];
    };

    _trg setTriggerActivation ["ANY", "PRESENT", true];
    _trg setTriggerStatements [
        "player in thislist",
        "if (player getVariable ""ACE_isUnconscious"") then {
            [format [""%1<br />is being revived at the LRG Medical Facility."", profileName], [1,-0.2], ""#ed1b2e"", 0.4] call LR_fnc_dynamicText;
            };
		[
			""You are being treated at the LRG Medical Facility"",
			[-1, 0.8],
			""#FFA500"",
			0.5,
			false
		] call LR_fnc_DynamicText;
            [
                {
                    [player] call ACE_medical_treatment_fnc_fullHealLocal;
                    [
			        ""Treatment Complete"",
			        [-1, 0.8],
			        ""#228B22"",
			        0.5,
			        false
		            ] call LR_fnc_DynamicText;
                }, [], 10
            ] call CBA_fnc_waitAndExecute;",
        ""
    ];
} foreach _objects;