/*
	Teleport Script

	Author: schmingo (OPT MOD Team)

	v2015-03-16 | this script is part of OperationPandoraTrigger3 ArmA3 script collection

	Description:
	compile_client.sqf -> 	teleport = compileFinal preprocessFileLineNumbers "addons\opt3_teleport\teleport.sqf";
	onPlayerRespawn.sqf -> 	[] spawn teleport;
*/

private ["_addActionTeleport", "_height"];


// changed by psycho
/*
// AddAction Function
_addActionTeleport = ["<t color='#ffff33'>Teleport</t>",
		{
			opt_teleported = false;
			_height = getPosATL player select 2;

			titleText ["Position zum Teleport auswählen", "PLAIN"];
			openMap true;

			if ((vehicle player isKindOf "Air") and (_height > 2)) then {
				onMapSingleClick "vehicle player setPosATL [_pos select 0, _pos select 1, (_pos select 2) + 30]; opt_teleported = true;";
			} else {
				onMapSingleClick "vehicle player setPos _pos; opt_teleported = true;";
			};
			
			waitUntil {(opt_teleported)};
			onMapSingleClick "";
			openMap false;
			titleText ["", "plain down"];
		},		// script
		[],		// arguments
		-10,	// priority
		false,	// showWindow
		true,	// hideOnUse
		"",		// shortcut
		""]; 	// condition

// AddAction to unit
player addAction _addActionTeleport;
*/

opt_teleport_reset = {
	onMapSingleClick '';
	openMap false;
	titleText ['', "plain down"];
};

_height = getPosATL player select 2;

titleText ["Position zum Teleport auswaehlen", "PLAIN"];
openMap true;

if ((vehicle player isKindOf "Air") and (_height > 2)) then {
	onMapSingleClick "vehicle player setPosATL [_pos select 0, _pos select 1, (_pos select 2) + 30]; [] call opt_teleport_reset";
} else {
	onMapSingleClick "vehicle player setPos _pos; [] call opt_teleport_reset";
};