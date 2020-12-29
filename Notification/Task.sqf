/* 
	Author: 
		Assault

	Description: 
		Contains code that generates task like notifications.

	Usage:
		Init field of target:
			["Mission complete!", "SUCCEEDED", player] execVM "Notification\task.sqf";
*/

params ["_msg", "_state", "_owner"];

[_owner, ["taskNotification"], ["", _msg, ""], objNull, _state, -1, true, "", false] call BIS_fnc_taskCreate;
["taskNotification", true] call BIS_fnc_deleteTask;