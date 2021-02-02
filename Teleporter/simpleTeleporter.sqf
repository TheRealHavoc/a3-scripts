// In every teleporrer object init: 0 = [this] execVM "teleporter.sqf";

// List all teleporters with their unique variable name and title. Title is not required.
_teleporters = [
	["teleporter_1", "Stratis Air Base"],
	["teleporter_2"]
];

_target = (_this # 0);

{
	_var = (_x # 0);
	_name = (_x # 1);

	if (isNil "_name") then {
		_name = text nearestLocation [(getPos (missionNamespace getVariable _var)), ""];
	};

	if (_var != str _target) then {
		_target addAction [
			format ["<t color='#FFFFFF'>Travel to %1</t>", _name],
			{
				params ["_target", "_caller", "_actionId", "_arguments"];

				_var = ((_this # 3) # 0);
				_name = ((_this # 3) # 1);

				_nextPos = (getPos (missionNamespace getVariable _var));
				_nextPos = _nextPos vectorAdd [1, 0, 0];

				titleText [format ["Welcome to %1", _name], "PLAIN", 0];

				_caller setPos _nextPos;

				sleep 4;
				titleFadeOut 2;
			},
			[_var, _name], 
			1, 
			true, 
			true, 
			"", 
			"true", 
			4
		]
	}
} forEach _teleporters;