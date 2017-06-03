
private ["_Container","_markerwest","_markerost","_marker1","_marker2","_Radarring","_units","_Radaranzeige"];

_Container = _this select 0;


if ((RADARContainerEAST getVariable ["RADAREASTaufgebaut",false])) then
		{
		_Container setVariable ["RADAREASTaufgebaut", false,true];
		deleteVehicle Radarturmeast;
		deleteVehicle Radarnetzeast;		
		};




