/**
* Author: James
* initialize tfar script for player
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

// addon check
if (count ("(configName _x) find 'TFAR' >= 0" configClasses (configFile >> "CfgPatches")) == 0) exitWith{};

// richtet default Frequenzen für TFAR ein
[] call FUNC(setTFARFrequencies);
// add player EH for GetIn
[] call FUNC(initPlayerEH);
