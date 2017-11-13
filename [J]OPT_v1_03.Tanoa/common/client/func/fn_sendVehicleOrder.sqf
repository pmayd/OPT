/*
	Spawn Vehicles

	Author: schmingo (OPT MOD Team)

	v2014-10-31 | this script is part of OperationPandoraTrigger ArmA3 script collection
*/
#include "..\..\..\setup\setup.sqf"

//changed by psycho

#define vhOrder_dialog 20000
#define vhOrder_vehiclelist 20100
disableSerialization;

_display = findDisplay vhOrder_dialog;
_list = _display displayCtrl vhOrder_vehiclelist;
_selectedVehicle = lbCurSel _list;

if (_selectedVehicle < 0) exitWith {
	txt = "Bitte ein Fahrzeug auswählen";
	[format ["<t size='0.8' shadow='1' color='#ff0000'>%1</t>",txt], (safeZoneX - 0.0), (safeZoneY + 0.25), 3, 1, 0, 3] spawn BIS_fnc_dynamicText;
};

_unitRecord = opt_orderDialogObjects select _selectedVehicle;
_selectionText = lbtext [vhOrder_vehiclelist, _selectedVehicle];
if (_selectionText == "") exitWith {};

_unitType = _unitRecord select 0;
_unitCost = _unitRecord select 1;

if (isNil "opt_crew_vecs") then {opt_crew_vecs = []};
if (isNil "opt_crew") then {opt_crew = []};

if (isNil "opt_pilots_vecs") then {opt_pilots_vecs = []};
if (isNil "opt_pilots") then {opt_pilots = []};

/*
* James: deaktiviert, Slots sind sowieso durch EH gesperrt. Daher kaufen nicht weiter abfragen
if (OPT_TRAINING == 0) then {
	if ( (_unitType in opt_pilots_vecs && !(typeOf player in opt_pilots)) || (_unitType in opt_crew_vecs && !(typeOf player in opt_crew)) ) exitWith {
		closeDialog 0;
		TitleRsc ["only_qualified", "plain", 0.5];
	};
};
*/

_side_Budget = if (playerSide == west) then {opt_west_budget} else {opt_east_budget};

_displayName = getText (configFile >> "CfgVehicles" >> _unitType >> "displayName");

// Prüfe, ob aktuelle Kosten größer sind als aktuelles Budget + Dispo
// wenn Budget < 0, dann kann noch bis dispo eingekauft werden (siehe setup_publicvariable)
if (_unitCost > (_side_Budget + opt_dispo)) exitWith {
	txt = "Budget reicht nicht aus, Dispo überzogen!";
	[format ["<t size='0.8' shadow='1' color='#ff0000'>%1</t>",txt], (safeZoneX - 0.0), (safeZoneY + 0.25), 3, 1, 0, 3] spawn BIS_fnc_dynamicText;
};

_spawnObj = nearestObject [player, "Land_HelipadCircle_F"];
_empty_pos = (position _spawnObj) findEmptyPosition [0, __ORDER_SPAWN_RADIUS__, _unitType];

if (count _empty_pos == 0) exitWith {
	[format ["<t size='0.8' shadow='1' color='#ff0000'>Kein freier Platz im Umkreis von %1m. Bereich räumen.</t>", __ORDER_SPAWN_RADIUS__], (safeZoneX - 0.0), (safeZoneY + 0.25), 3, 1, 0, 3] spawn BIS_fnc_dynamicText;
};

["opt_eh_server_update_budget", [playerSide, _unitCost, "-"]] call CBA_fnc_serverEvent;
["vehicleOrder", [_unitType, _unitCost, _spawnObj, str(playerSide)]] call tcb_fnc_NetCallEventCTS;

[format ["<t size='0.8' shadow='1' color='#ffffff'>%1 geliefert</t>",_displayName], (safeZoneX - 0.0), (safeZoneY + 0.25), 3, 1, 0, 3] spawn BIS_fnc_dynamicText;

// neu öffnen
[] call opt_fnc_updateBudget;