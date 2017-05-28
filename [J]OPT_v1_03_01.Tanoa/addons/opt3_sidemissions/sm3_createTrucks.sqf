/*
	Sidemission 2 - Destroy 3 Fueltrucks - Create Vehicles

	Author: schmingo (OPT MOD Team)

	v2015-03-16 | this script is part of OperationPandoraTrigger ArmA3 script collection
*/

if (isServer) then {

	private ["_Truck1Pos", "_Truck2Pos", "_Truck3Pos", "_Truck4Pos", "_Truck5Pos"];

	successNATO_sm3	= [];
	successCSAT_sm3	= [];
	_vehicle = "I_Truck_02_fuel_F";

	waitUntil {sleep 9; SM3_started};

	marker_SM3_Truck1 = createMarker ["marker_SM3_Truck1", getPos trigger_SM3_Truck1];
	marker_SM3_Truck2 = createMarker ["marker_SM3_Truck2", getPos trigger_SM3_Truck2];
	marker_SM3_Truck3 = createMarker ["marker_SM3_Truck3", getPos trigger_SM3_Truck3];
	marker_SM3_Truck4 = createMarker ["marker_SM3_Truck4", getPos trigger_SM3_Truck4];
	marker_SM3_Truck5 = createMarker ["marker_SM3_Truck5", getPos trigger_SM3_Truck5];

	"marker_SM3_Truck1" setMarkerShape "ICON"; "marker_SM3_Truck1" setMarkerType "mil_destroy"; "marker_SM3_Truck1" setMarkerText "Treibstoff-LKW 1"; "marker_SM3_Truck1" setMarkerColor "ColorBlack";
	"marker_SM3_Truck2" setMarkerShape "ICON"; "marker_SM3_Truck2" setMarkerType "mil_destroy"; "marker_SM3_Truck2" setMarkerText "Treibstoff-LKW 2"; "marker_SM3_Truck2" setMarkerColor "ColorBlack";
	"marker_SM3_Truck3" setMarkerShape "ICON"; "marker_SM3_Truck3" setMarkerType "mil_destroy"; "marker_SM3_Truck3" setMarkerText "Treibstoff-LKW 3"; "marker_SM3_Truck3" setMarkerColor "ColorBlack";
	"marker_SM3_Truck4" setMarkerShape "ICON"; "marker_SM3_Truck4" setMarkerType "mil_destroy"; "marker_SM3_Truck4" setMarkerText "Treibstoff-LKW 4"; "marker_SM3_Truck4" setMarkerColor "ColorBlack";
	"marker_SM3_Truck5" setMarkerShape "ICON"; "marker_SM3_Truck5" setMarkerType "mil_destroy"; "marker_SM3_Truck5" setMarkerText "Treibstoff-LKW 5"; "marker_SM3_Truck5" setMarkerColor "ColorBlack";

	FuelTruck1_pos = [getMarkerPos "marker_SM3_Truck1" select 0, getMarkerPos "marker_SM3_Truck1" select 1, 0.5];
	FuelTruck2_pos = [getMarkerPos "marker_SM3_Truck2" select 0, getMarkerPos "marker_SM3_Truck2" select 1, 0.5];
	FuelTruck3_pos = [getMarkerPos "marker_SM3_Truck3" select 0, getMarkerPos "marker_SM3_Truck3" select 1, 0.5];
	FuelTruck4_pos = [getMarkerPos "marker_SM3_Truck4" select 0, getMarkerPos "marker_SM3_Truck4" select 1, 0.5];
	FuelTruck5_pos = [getMarkerPos "marker_SM3_Truck5" select 0, getMarkerPos "marker_SM3_Truck5" select 1, 0.5];

	FuelTruck1 = createVehicle [_vehicle, FuelTruck1_pos, [], 350, "NONE"];
	FuelTruck2 = createVehicle [_vehicle, FuelTruck2_pos, [], 350, "NONE"];
	FuelTruck3 = createVehicle [_vehicle, FuelTruck3_pos, [], 350, "NONE"];
	FuelTruck4 = createVehicle [_vehicle, FuelTruck4_pos, [], 350, "NONE"];
	FuelTruck5 = createVehicle [_vehicle, FuelTruck5_pos, [], 350, "NONE"];

	FuelTruck1 setVehicleVarName "Treibstoff-LKW_1";
	FuelTruck2 setVehicleVarName "Treibstoff-LKW_2";
	FuelTruck3 setVehicleVarName "Treibstoff-LKW_3";
	FuelTruck4 setVehicleVarName "Treibstoff-LKW_4";
	FuelTruck5 setVehicleVarName "Treibstoff-LKW_5";

	FuelTruck1 addMPEventHandler ["MPKilled", {xhandle = _this execVM "addons\opt3_sidemissions\sm3_success.sqf";}];
	FuelTruck2 addMPEventHandler ["MPKilled", {xhandle = _this execVM "addons\opt3_sidemissions\sm3_success.sqf";}];
	FuelTruck3 addMPEventHandler ["MPKilled", {xhandle = _this execVM "addons\opt3_sidemissions\sm3_success.sqf";}];
	FuelTruck4 addMPEventHandler ["MPKilled", {xhandle = _this execVM "addons\opt3_sidemissions\sm3_success.sqf";}];
	FuelTruck5 addMPEventHandler ["MPKilled", {xhandle = _this execVM "addons\opt3_sidemissions\sm3_success.sqf";}];

};