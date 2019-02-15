// not documented: module called

params [
    ["_logic",objNull,[objNull]],
    ["_groups",[],[[]]],
    "_localGroups",
    "_logic"
];

//private _Area = _logic getVariable ["ServicingArea", 10];
//private _Height = _logic getVariable ["ServicingHeight", 6];

/* Future Stuff
private _Rearm = _logic getVariable ["ServicingRearm", 20];
private _Refuel = _logic getVariable ["ServicingRefuel", 20];
private _Repair = _logic getVariable ["ServicingRepair", 20];
private _GroundVehicles = _logic getVariable ["ServicingGroundVehicles", 0];
private _Helicopters = _logic getVariable ["ServicingHelicopters", 0];
private _Planes = _logic getVariable ["ServicingPlanes", 0];
private _Drones = _logic getVariable ["ServicingDrones", 0];

private _ServiceTypes = [];

call {

    if (_GroundVehicles) then {_ServiceTypes pushback "LandVehicle"};
    if (_Helicopters) then {_ServiceTypes pushback "Helicopter"};
    if (_Planes) then {_ServiceTypes pushback "Plane"};
    if (_Drones) then {_ServiceTypes pushback "UAV"};
};
systemchat format ["%1", _ServiceTypes];
*/

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
        "_v = (thislist select 0); { _v isKindOf _x } count [""UAV"", ""Plane"", ""Helicopter"", ""LandVehicle""] > 0 && { speed _v < 1 } && { isTouchingGround _v };",
        "call { _v = (thisList select 0); if (_v isKindOf ""UAV"") exitWith { [_v] execVM ""z\LRG Fundamentals\Addons\Vehicles\Scripts\uav.sqf""; }; _type = { if (_v isKindOf _x) exitWith { _x } ; nil } count [""UAV"", ""Plane"", ""Helicopter"", ""LandVehicle""];if (_type isEqualTo 0) exitWith {};[_type, _v, 30, 30] execVM ""z\LRG Fundamentals\Addons\Vehicles\Scripts\general.sqf"";};",
        ""
    ];
} foreach _objects;