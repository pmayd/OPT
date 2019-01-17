/**
 * Author: James
 * read in all mission config parameter values
 *
 * Arguments:
 * None
 *
 * Return Value:
 * none
 *
 * Example:
 * [] call opt_main_fnc_preInit;
 *
 */

// Startparameter auslesen und als globale Variablen verfügbar machen
// By James: moderner Ansatz ohne 20 Zeilen Code
// Das Spiel liest bereits alle Parameter aus und speichert sie in "BIS_fnc_storeParamsValues_data"
// 1. Namen aller Parameter
// 2. führe globale Variable mit diesem Namen ein
_paramNames = ("true" configClasses (getMissionConfig "Params")) apply {configName _x};
_paramNames apply
{
    missionNamespace setVariable [_x, [_x] call BIS_fnc_getParamValue, true];
};