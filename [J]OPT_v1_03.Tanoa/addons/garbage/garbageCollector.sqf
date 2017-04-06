/*
 =======================================================================================================================

	Script:		garbageCollector.sqf
	Author:		T-800a
	E-Mail:		t-800a@gmx.net

	Description:
	Small clean up script run from INIT. Loop checks every XX sec. for things to delete.

	+----- DAC & Groups ----------------------------------------------------------------------------------------------+
	_group setVariable [ "DAC_Excluded", nil ];
		true		=> will be reused  by DAC
		false	=> currently in use by DAC
		nil		=> can be deleted safely
	
	Parameter(s):
	
	T8G_var_timeTick				= 30;		// script runs every XX sec.
	T8G_var_timeWeaponHolder		= 600;		// weapon holder are deleted after XX sec.
	T8G_var_timeDeadBody			= 600;		// dead bodies are deleted after XX sec.
	T8G_var_deleteEmptyGroup		= true;		// empty groups are deleted

	Example(s):
	in the init.sqf:	[] execVM "garbageCollector.sqf";

 =======================================================================================================================
*/

if ( ! isServer ) exitWith {};

T8G_var_timeTick				= 10;		// script runs every XX sec.
T8G_var_timeWeaponHolder		= 10;		// weapon holder are deleted after XX sec.
T8G_var_timeDeadBody			= 30;		// dead bodies are deleted after XX sec.
T8G_var_timeGraveStone			= 10;		// grave stones are deleted after XX sec.
T8G_var_deleteEmptyGroup		= true;	// empty groups are deleted
T8G_var_deleteEmptyDetector		= false;		// empty/dead triggers are deleted

while { true } do 
{
	sleep T8G_var_timeTick;
	
	/*
// remove dead bodies
	{
		private [ "_t" ];
		_t = _x getVariable [ "T8G_var_timeRemove", true ];
		if (( typeName _t ) isEqualTo ( typeName true )) then 
		{
			_x setVariable [ "T8G_var_timeRemove", ( time + T8G_var_timeDeadBody ), false ]; 
		} else {
			if ( ( typeName _t ) isEqualTo ( typeName 123 ) AND { time > _t }) then { deleteVehicle _x; sleep 0.5; };
		};
		false
	} count allDeadMen;
*/
// remove weapon holders
	{
		private [ "_t" ];
		_t = _x getVariable [ "T8G_var_timeRemove", true ];
		if (( typeName _t ) isEqualTo ( typeName true )) then 
		{
			_x setVariable [ "T8G_var_timeRemove", ( time + T8G_var_timeWeaponHolder ), false ]; 
		} else {
			if ( ( typeName _t ) isEqualTo ( typeName 123 ) AND { time > _t }) then { deleteVehicle _x; sleep 0.5; };
		};
		false
	} count allMissionObjects "WeaponHolder";
	
// remove grave stones (added after player disconnects (for 1PARA missions))
	{
		private [ "_t" ];
		_t = _x getVariable [ "T8G_var_timeRemove", true ];
		if (( typeName _t ) isEqualTo ( typeName true )) then 
		{
			_x setVariable [ "T8G_var_timeRemove", ( time + T8G_var_timeGraveStone ), false ]; 
		} else {
			if ( ( typeName _t ) isEqualTo ( typeName 123 ) AND { time > _t }) then { deleteVehicle _x; sleep 0.5; };
		};
		false
	} count allMissionObjects "Land_Grave_soldier_F";

	/*
// remove empty groups (DAC groups excluded)
	if ( T8G_var_deleteEmptyGroup ) then
	{
		{
			if (( count units _x ) <= 0 AND { ( _x getVariable [ "DAC_Excluded", "RM" ] ) == "RM" } ) then
			{
				deleteGroup _x;
				sleep 0.5;
			};
			false
		} count allGroups;
	};

// remove EmptyDetector (-dead- triggers)
	
	{
		{
			if (( _x distance [ 0, 0, 0 ] ) < 1 ) then { deleteVehicle _x; };
			false
		} count allMissionObjects "EmptyDetector";
	};
};
*/
