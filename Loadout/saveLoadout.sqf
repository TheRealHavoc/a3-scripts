/* 
	Author: Assault 
	Description: Contains code that generates task like notifications.

	Usage:
	["Mission complete!", "SUCCEEDED"] execVM "Notification\task.sqf";
*/ 

_this select 0 addAction [
    "<t color='#FFFFFF'>Save loadout</t>",
    {
        params ["_target", "_caller", "_actionId", "_arguments"];  

        _caller setVariable ['PlayerLoadout', (getUnitLoadout player)];

        hint "Loadout saved. Your current gear will be restored on next respawn.";
    },
    [], 
    1, 
    true, 
    true, 
    "", 
    "true", 
    4
];