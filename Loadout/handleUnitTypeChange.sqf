// In object init: 0 = [this] execVM "handleUnitTypeChange.sqf";

_unitTypes = [
	["B_Soldier_SL_F", "Squad Leader"],
	["B_Soldier_TL_F", "Team Leader"],
	["B_Soldier_F", "Rifleman"],
	["B_Pilot_F", "Pilot"]
];

{
	_this # 0 addAction [
		format ["<t color='#FFFFFF'>%1</t>", _x # 1],
		{
			params ["_target", "_caller", "_actionId", "_arguments"];

			_i = _this # 3 # 0;

			_unitClass = _i # 0;
			_unitName = _i # 1;

			_unit = group _caller createUnit [_unitClass, position _caller, [], 0, "FORM"];

			selectPlayer _unit;

			deleteVehicle _caller;
		},
		[_x], 
		1, 
		true, 
		true, 
		"", 
		"true", 
		4
	]
} forEach _unitTypes;