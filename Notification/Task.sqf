/* 
	Author: Assault 
	Description: Contains code that generates task like notifications.

	Usage:
	["Mission complete!", "SUCCEEDED"] execVM "Notification\Task.sqf";
*/

params ["_msg", "_state"];

[true, ["taskNotification"], ["", _msg, ""], objNull, _state, -1, true, "", false] call BIS_fnc_taskCreate;
["taskNotification", west] call BIS_fnc_deleteTask;