
private ["_Container"];

_Container = _this select 0;
	
if ((RADARContainerWEST getVariable ["RADARWESTaufgebaut",false])) then
		{
		_Container setVariable ["RADARWESTaufgebaut", false,true];
		deleteVehicle Radarturmwest;
		deleteVehicle Radarnetzwest;
		};
		








