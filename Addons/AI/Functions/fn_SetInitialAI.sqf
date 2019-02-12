// not documented: postInit function

if (!isserver) exitwith {};

if (isNil "LRG_AI_InitialAI") exitwith {};
if (not LRG_AI_InitialAI) exitWith{};
{
	_class = typeOf (_x);

	_result  = call {
		if (_class isKindOf "Man") exitWith {
			private _Group = call {
				if ((typeName _x) isEqualTo "GROUP") exitWith { _x };
				if ((typeName _x) isEqualTo "OBJECT") exitWith { group _x };
				_x;
			};

			[_Group, "LRG Default"] remoteExec ["LR_fnc_SetUnitSkill",2];
			[_Group, true] remoteExec ["enableDynamicSimulation",2];
		};

		if (_class isKindOf "AllVehicles") exitWith {
			{
				[_x, "LRG Default"] remoteExec ["LR_fnc_SetUnitSkill",2];
			} forEach crew _x;
			[group _x , true] remoteExec ["enableDynamicSimulation",2];	
		};
	};
} foreach Allunits;