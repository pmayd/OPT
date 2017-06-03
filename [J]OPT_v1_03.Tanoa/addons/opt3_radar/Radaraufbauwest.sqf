
private ["_Container"];

_Container = _this select 0;
		
if (!(RADARContainerWEST getVariable ["RADARWESTaufgebaut",false])) then
		{
		Radarturmwest = createVehicle ["Land_TTowerSmall_1_F", getpos _Container, [], 0, "NONE"];
		Radarturmwest attachTo [_Container, [-0.5, 0.5, 0.0]];
		Radarnetzwest = createVehicle ["CamoNet_ghex_big_F", getpos _Container, [], 0, "NONE"];
		Radarnetzwest attachTo [_Container, [0.0, 0.0, 0.0]];
		_Container setVariable ["RADARWESTaufgebaut", true,true];
		};








