#include "..\..\setup\setup.sqf"

__cppfln(opt_fnc_radar_east,addons\opt3_radar\Radareast.sqf);
__cppfln(opt_fnc_radar_west,addons\opt3_radar\Radarwest.sqf);

[] spawn opt_fnc_radar_east;
[] spawn opt_fnc_radar_west;