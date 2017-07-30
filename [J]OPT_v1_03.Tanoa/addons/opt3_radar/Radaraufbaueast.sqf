
private ["_Container","_markerwest","_markerost","_marker1","_marker2","_Radarring","_units","_Radaranzeige"];

_Container = _this select 0;

// Container destroyed?
if (!alive _Container) exitWith {
    removeAllActions _Container;
};

if (!(RADARContainerEAST getVariable ["RADAREASTaufgebaut",false])) then
{
	Radarturmeast = createVehicle ["Land_TTowerSmall_1_F", getpos _Container, [], 0, "NONE"];
	Radarturmeast attachTo [_Container, [-0.5, 0.5, 0.0]];
	Radarnetzeast = createVehicle ["CamoNet_ghex_big_F", getpos _Container, [], 0, "NONE"];
	Radarnetzeast attachTo [_Container, [0.0, 0.0, 0.0]];
	_Container setVariable ["RADAREASTaufgebaut", true,true];
};