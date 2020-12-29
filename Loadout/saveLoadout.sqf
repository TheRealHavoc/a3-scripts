/* 
	Author:
        Assault 

	Description:
        Creates an action for the player to save their current loadout.

	Usage:
        Init field of target:
	        execVM "Loadout\saveLoadout.sqf";

        onPlayerRespawn.sqf:
            if (!isNil {player getVariable "PlayerLoadout"}) then {
                player setUnitLoadout [player getVariable "PlayerLoadout", true];
            };
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