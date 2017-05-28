if (isDedicated || !hasInterface) exitWith {};

true spawn {
	OPT_MainWeapon = "";
	OPT_Launcher = "";
	waitUntil {!isNil "BIS_fnc_init"};
	
/*	if (worldName == "Tanoa") then {
		if (playerSide isEqualTo west) then {
			[] call AME_LoadOut_fnc_load_west_apex;
		} else {
			[] call AME_LoadOut_fnc_load_east_apex;
		};
	} else {
		if (playerSide isEqualTo west) then {
			[] call AME_LoadOut_fnc_load_west;
		} else {
			[] call AME_LoadOut_fnc_load_east;
		};	
	};
*/	
	[player, [missionNamespace, "tcb_inv"]] call BIS_fnc_saveInventory;
	
	
	waitUntil {time > 1};
	_weapon = "";
	_magazine = "";
	_items = [];
	
	OPT_MainWeapon = [];
	OPT_Launcher = [];
	
	if (primaryWeapon player != "") then {
		_weapon = primaryWeapon player;
		if (count (primaryWeaponMagazine player) > 0) then {
			_magazine = (primaryWeaponMagazine player) select 0;
		};
		_items = primaryWeaponItems player;
	
		OPT_MainWeapon = [_weapon, _magazine, _items];
	};
	
	if (secondaryWeapon player != "") then {
		_weapon = secondaryWeapon player;
		if (count (secondaryWeaponMagazine player) > 0) then {
			_magazine = (secondaryWeaponMagazine player) select 0;
		};
		OPT_Launcher = [_weapon, _magazine];
	};

	//player removeAllEventHandlers "Put";
	//player addEventHandler ["Put", {_this call AME_LoadOut_fnc_PutEquipment}];
};