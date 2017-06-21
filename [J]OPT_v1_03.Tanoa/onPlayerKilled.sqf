//by psycho
params 	["_oldUnit", "_killer", "_respawn", "_respawnDelay"];

// Funkgeräte löschen
_inventory = (assignedItems _oldUnit) + (items _oldUnit);
if ((backpack _oldUnit find "TFAR_" == 0) or (backpack _oldUnit find "tf_" == 0)) then {
	removeBackpack _oldUnit;
};

{
	if ((_x find "TFAR_" == 0) or (_x find "tf_" == 0)) then {
		hint format["gefunden: %1!", _x];
		_oldUnit unassignItem _x;
		_oldUnit removeItem _x;
	};
} foreach _inventory;

// Killcam starten
_this execVM "common\client\killcam.sqf";
playMusic "";
sleep 20;

enableEndDialog;