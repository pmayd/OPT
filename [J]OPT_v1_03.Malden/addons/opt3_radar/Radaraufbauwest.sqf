params ["_container"];

// Container destroyed?
if (!alive _container) exitWith {
    removeAllActions _container;
};
		
if (!(RADARContainerWEST getVariable ["RADARWESTaufgebaut", false])) then
{
	Radarturmwest = createVehicle ["Land_TTowerSmall_1_F", getpos _container, [], 0, "NONE"];
	Radarturmwest attachTo [_container, [-0.5, 0.5, 0.0]];
	Radarnetzwest = createVehicle ["CamoNet_ghex_big_F", getpos _container, [], 0, "NONE"];
	Radarnetzwest attachTo [_container, [0.0, 0.0, 0.0]];
	_container setVariable ["RADARWESTaufgebaut", true, true];
};