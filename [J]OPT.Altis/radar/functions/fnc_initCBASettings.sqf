/**
* Author: James
* initialize CBA settings
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_initCBASettings.sqf;
*
*/
#include "script_component.hpp"

[
    QGVAR(on), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Aktiviert die Radar-Komponente", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT Komponenten", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // Default value <BOOLEAN>
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

if (!GVAR(on)) exitWith{};

[
    QGVAR(maxDammage), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Schadenswert (in %), bei dem Radar unbrauchbar", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT Radar", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 1, 0.85, 2], // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(updateInterval), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Update Intervall in Sekunden", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT Radar", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0.01, 10, 1, 2], // data for this setting: [min, max, default, number of shown trailing decimals]
    0, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(radarFormelm), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Radarformel Steigung M", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT Radar", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0.01, 2, 0.1, 2], // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(radarFormelb), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Radarformel Max Flughöhe bei 0km/h B", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT Radar", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0.01, 80, 50, 2], // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(radarFormeldf), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Radarformel Einflüss Dämpfung df", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT Radar", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0.01, 1, 0.1, 2], // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(radarDruchmesser), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Druchmesser Radarkreis", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT Radar", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [1000, 6000, 4000, 2], // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;



