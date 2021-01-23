/*
	Author:
		Havoc
	
	Description:
		Adds objects to the zeus interface.

	Usage:
		initServer.sqf: 
			nul = [] execVM "zeusUpdater.sqf";
*/

addToAllCuratorsFnc = {
	params ["_objects"];

	{
		if (isNil {_objects}) then {
			_objects = (entities "AllVehicles" - entities "Animal");
		};
		
		_x addCuratorEditableObjects [_objects, true];
	} forEach allCurators;
};

if (isServer) then {
	addMissionEventHandler ["PlayerConnected", {
		params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];

		[] spawn addToAllCuratorsFnc;
	}];

	{
		_x addEventHandler ["CuratorObjectPlaced", {
			params ["_curator", "_entity"];

			[] spawn addToAllCuratorsFnc;
		}];

		_x addEventHandler ["CuratorGroupPlaced", {
			params ["_curator", "_group"];

			[] spawn addToAllCuratorsFnc;
		}];
	} forEach allCurators;
};