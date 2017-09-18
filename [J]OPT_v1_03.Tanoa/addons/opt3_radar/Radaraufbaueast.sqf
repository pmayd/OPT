params ["_container"];

// Container destroyed?
if (!alive _container) exitWith {
    removeAllActions _container;
};

if (!(RADARContainerEAST getVariable ["RADAREASTaufgebaut", false])) then
{
	Radarturmeast = createVehicle ["Land_TTowerSmall_1_F", getpos _container, [], 0, "NONE"];
	Radarturmeast attachTo [_container, [-0.5, 0.5, 0.0]];
	Radarnetzeast = createVehicle ["CamoNet_ghex_big_F", getpos _container, [], 0, "NONE"];
	Radarnetzeast attachTo [_container, [0.0, 0.0, 0.0]];
	_container setVariable ["RADAREASTaufgebaut", true, true];
};