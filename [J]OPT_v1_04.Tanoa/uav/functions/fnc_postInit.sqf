/**
* Author: James
* initialize UAV script. Adds addAction menu entries to all laptops and handles logic
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_postInit.sqf;
*
*/
#include "script_component.hpp"

#define OPT_UAV_TERMINAL_OBJECT "Land_PCSet_01_screen_F" // all objects of this category will receive addAction menu

// only pilots and operators have access to drone terminal
if !(typeOf player in (GVARMAIN(pilots) + GVARMAIN(operator))) exitWith {};

LOG_1("OPT_UAV_fnc_postInit startet für %1",name player);

_pcs = entities OPT_UAV_TERMINAL_OBJECT;

// add to each UAV PC addaction menu
{
	_x addAction [
		"Verbinden mit UAV-Station" call XOrangeText,
        {
            private _terminal = _this select 0;
            [
                1,
                _terminal,
                {
                    params ["_terminal"];
                    
                    [QEGVAR(gui,message),["UAV-Station","In UAV-Station eingeloggt.<br/>Verbindung geht verloren, wenn mehr als 4m entfernt.","green"]] call CBA_fnc_localEvent;
                    player setVariable [QGVAR(loggedInStation), _terminal];
                    
                    if ((typeOf player) isEqualTo "OPT_NATO_Pilot_T") then {
                        player removeWeapon "ItemGPS";
                        player addWeapon "B_UavTerminal";
                    };
                    if ((typeOf player) isEqualTo "OPT_CSAT_Pilot_T") then {
                        player removeWeapon "ItemGPS";
                        player addWeapon "O_UavTerminal";
                    };
                },
                {},
                "verbinde..."
            ] call ace_common_fnc_progressBar;
        },
        [],
        1.5,
        false,
        true,
        "",
        format["isNull (player getVariable ['%1',objNull]) && {isNull objectParent player}", QGVAR(loggedInStation)]
    ];

	_x addAction [
		"Trennen mit UAV-Station" call XOrangeText,
        {
            private _terminal = _this select 0;
            [
                3,
                [],
                {
                    
                    [QEGVAR(gui,message),["UAV-Station","Von UAV-Station ausgeloggt.","green"]] call CBA_fnc_localEvent;
                    player connectTerminalToUAV objNull;
                    player setVariable [QGVAR(loggedInStation), objNull];
                    
                    if ((typeOf player) isEqualTo "OPT_NATO_Pilot_T") then {
                        player removeWeapon "B_UavTerminal";
                        player addWeapon "ItemGPS";
                    };
                    if ((typeOf player) isEqualTo "OPT_CSAT_Pilot_T") then {
                        player removeWeapon "O_UavTerminal";
                        player addWeapon "ItemGPS";
                    };
                },
                {},
                "trenne..."
            ] call ace_common_fnc_progressBar;
        },
        [],
        1.5,
        false,
        true,
        "",
        format["!isNull (player getVariable ['%1',objNull])", QGVAR(loggedInStation)]
    ];

} forEach _pcs;

[QGVAR(isConnectedToUAV), "onEachFrame", {

    if (isNull (getConnectedUAV player)) exitWith{};

    private _uav = getConnectedUAV player;

    if (typeOf _uav in GVARMAIN(big_uavs)) then {
        if (player getVariable [QGVAR(loggedInStation), objNull] isEqualTo objNull) then {
            player connectTerminalToUAV objNull;
            [QEGVAR(gui,message), ["UAV-Station","Diese Aktion kann nur an der UAV-Station ausgeführt werden.","red"]] call CBA_fnc_localEvent;

        };

    } else {
        if !(typeOf player in ["OPT_NATO_Operator_T","OPT_CSAT_Operator_T"]) then {
            player connectTerminalToUAV objNull;
            [QEGVAR(gui,message), ["UAV-Station","Diese Ausrüstung kann nur ein Operator benutzen.","red"]] call CBA_fnc_localEvent;

        };

    };

}] call BIS_fnc_addStackedEventHandler;

[QGVAR(connectionLost), "onEachFrame", {

    if (player getVariable [QGVAR(loggedInStation), objNull] isEqualTo objNull) exitWith{};

    private _station = player getVariable QGVAR(loggedInStation);

    if (player distance2D _station > 4) then {
        player setVariable [QGVAR(loggedInStation), objNull];
		player connectTerminalToUAV objNull;
        [QEGVAR(gui,message), ["UAV-Station","Verbindung zur UAV-Station verloren.","red"]] call CBA_fnc_localEvent;
        
        if ((typeOf player) isEqualTo "OPT_NATO_Pilot_T") then {
			player removeWeapon "B_UavTerminal";
			player addWeapon "ItemGPS";

		};

		if ((typeOf player) isEqualTo "OPT_CSAT_Pilot_T") then {
			player removeWeapon "O_UavTerminal";
			player addWeapon "ItemGPS";

		};

    };
  
}] call BIS_fnc_addStackedEventHandler;

LOG("OPT_UAV_fnc_postInit beendet");