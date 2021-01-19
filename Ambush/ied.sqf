/*
	Author:
		Havoc
	
	Description:
		Triggers an ambush event.
		
	Usage:
		Create a trigger.
		Place an IED.
		Sync IED to trigger.
		Place a spotter, this person is the one who "activates" the IED.
		Sync the spotter to trigger.
		Add the following code to the spotter so he doesn't run away:
			this disableAI "PATH";
		Activate the trigger when a player is present.
		Select "Server Only".
		On activation:
			[synchronizedObjects thisTrigger] execVM "<path to this script>";
*/

params ["_objects"];

private ["_ied", "_spotter", "_dir"];

_ied = _objects select 0;
_spotter = _objects select 1;

if (alive _spotter && !captive _spotter) then {
	_spotter setUnitPos "UP";
	_spotter doTarget _ied;
	
	sleep random [0.2, 1, 4];
	
	_dir = 180 + (_spotter getDir _ied);
	_fleeto = _spotter getRelPos [300, _dir];

	_ied setDamage 1;
	
	_spotter enableAI "PATH";
	_spotter setBehaviour "CARELESS";
	_spotter setSpeedMode "FULL";
	
	_spotter doMove _fleeto;
};