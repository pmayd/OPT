


enableSaving [false, false];
player enableFatigue false;




_vehDialog = [] spawn compile PreprocessFileLineNumbers "dialog\TUT_fnc_veh.sqf";
waitUntil {scriptDone _vehDialog};


act1 = player addAction ["<t color=""#ff3300"">" + ("Vehicle Selector") + "</t>",
	{
		[] call TUT_fnc_OpenVehUI;
	},"",0.03,false,false];