/* 
	Author: 
		Assault

	Description: 
		Contains code that generates task like notifications.

	Usage:
		Init field of target:
			["Mission complete!", "SUCCEEDED"] execVM "Notification\task.sqf";
*/

params ["_msg", "_state"];

[true, ["taskNotification"], ["", _msg, ""], objNull, _state, -1, true, "", false] call BIS_fnc_taskCreate;
["taskNotification", west] call BIS_fnc_deleteTask;