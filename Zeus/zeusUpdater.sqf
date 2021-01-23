/*
    Author:
        Havoc
    
    Description:
        Adds units and vehicles to the zeus interface.

    Usage:
        initServer.sqf: 
            nul = [10] execVM "zeusUpdater.sqf";
    
    Parameters:
        interval - Seconds between each update.
*/

params ["_interval"];

if (isServer) then {
    [_interval] spawn {
        while {true} do {
            {
                _x addCuratorEditableObjects [allUnits, true];
                _x addCuratorEditableObjects [vehicles, true];
                _x addCuratorEditableObjects [allPlayers, true];
                
                sleep (_this select 0) select 0;
            } forEach allCurators;
        }; 
    };
};