params ["_unit", "_container", "_item"];

player sideChat format ["%1 --- %2", typeOf _container, _item];


if (_item isEqualTo (OPT_MainWeapon select 0) || {_item isEqualTo (OPT_Launcher select 0)}) then {

	if (typeOf _container isEqualTo "GroundWeaponHolder") then {
		deleteVehicle _container;
		player addWeapon _item;
		
		// Psycho: Vergabe von Munition und Attachments möglich, jedoch deaktiviert um das vermehren von Ausrüstungsgegenständen vorzubeugen. Außerdem könnte man so das letzte Magazin immer wieder füllen.
		/*
		if (_item isEqualTo (OPT_MainWeapon select 0)) then {
			player addMagazine [(OPT_MainWeapon select 1), 1];
			{
				player addPrimaryWeaponItem _x;
				true
			} count (OPT_MainWeapon select 2);
		} else {
			if ((OPT_Launcher select 1) != "") then {
				player addMagazine [(OPT_Launcher select 1), 1];
			};
		};
		*/
	} else {
		// Psycho: keine Möglichkeit gefunden einzelne Gegenstände aus Kisten zu entfernen. Subtraktion von Ausrüstung nicht möglich. 	_container addWeaponCargoGlobal [_item, -1]; 	<--- did not work
	};
	
	//["Waffe ablegen verboten!" call XRedText] call OPT_Core_fnc_dynamicText;
	
	_pic = "<img size='3.0' image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unbind_ca.paa' align='center'/><br/><br/>";
	_line = "<t color='#f0bfbfbf' size='1.0'shadow='1' shadowColor='#000000' align='left'>Das ablegen der Waffe führte dazu, dass du eventuell dein Waffenzubehör und ein Magazin verloren hast. Rüste dich neu aus und vermeide das Ablgegen der Waffe in Zukunft.</t>";
	"Waffe ablegen verboten" hintC parseText (_pic + _line);
};


if (_item in ["O_UavTerminal", "B_UavTerminal", "Rangefinder", "OPT_Laserdesignator", "OPT_Laserdesignator_02"]) then {
	if (typeOf _container isEqualTo "GroundWeaponHolder") then {
		deleteVehicle _container;
		player addWeapon _item;
	};
	//["Ablegen dieser Ausrüstung verboten!" call XRedText] call OPT_Core_fnc_dynamicText;
	
	_pic = "<img size='3.0' image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unbind_ca.paa' align='center'/><br/><br/>";
	_line = "<t color='#f0bfbfbf' size='1.0'shadow='1' shadowColor='#000000' align='left'>Wichtige und einmalige Ausrüstungsgegenstände sollten nicht abgelegt werden da dieses verhalten als Betrugsversuch gewertet werden könnte.</t>";
	"Ablegen dieser Ausrüstung verboten" hintC parseText (_pic + _line);
};