// by psycho 
// set the flagowner on server 
#include "../../../setup.sqf"
params ["_side","_flag"];

/*
_count_east_flags = count OPT_CSAT_FLAGs; //mincer
_count_west_flags = count OPT_NATO_FLAGs;
_east_owner = 0;
_west_owner = 0;//mincer
*/

switch (_side) do {
	case (west) : { //wenn spieler der zieht westen ist
		_flag setFlagTexture "\A3\Data_F\Flags\Flag_nato_CO.paa";
		_flag setVariable ["owner", _side, true];
		#ifdef __OPT_Sector_Message__
			//_marker = _flag getVariable "opt_flagMarker";
			//_marker setMarkerColor "ColorBLUFOR";
			//_parr setMarkerColor "ColorBLUFOR";
			["sectorControl_Msg", "<t size='0.8' shadow='1' color='#006CBD'>NATO hat einen Sektor zurück erobert</t>"] call tcb_fnc_NetCallEvent;
		#endif
	};
	case (east) : {
		_flag setFlagTexture "\A3\Data_F\Flags\Flag_csat_CO.paa";
		_flag setVariable ["owner", _side, true];
		#ifdef __OPT_Sector_Message__
			//_marker = _flag getVariable "opt_flagMarker";
			//_marker setMarkerColor "ColorOPFOR";
			//_parr setMarkerColor "ColorOPFOR";
			["sectorControl_Msg", "<t size='0.8' shadow='1' color='#B80A28'>CSAT hat einen Sektor zurück erobert</t>"] call tcb_fnc_NetCallEvent;
		#endif
	};
	default {};
};


/*
//hier werden alle csat flaggen gezählt
{
	_flag = format ["%1",_x];
	_side_flag = _x getVariable _flag;
	if (_side_flag == east) then {
		_east_owner = _east_owner + 1;
	};
} forEach OPT_CSAT_FLAGs;

//hier werden alle nato flaggen gezählt
{
	_flag = format ["%1",_x];
	_side_flag = _x getVariable _flag;
	if (_side_flag == west) then {
		_west_owner = _west_owner + 1;
	};
} forEach OPT_NATO_FLAGs;
//mincer das hier ist für debug
systemChat format ["FAHNEN WURDEN GEZAEHLT(NATO %1 | CSAT %2) fahnen sind gezogen", _west_owner, _east_owner];
//abfrage, wer hat mehr fahnen und besteht gleichstand?

//wenn east mehr hat als west, also csat mehr hat
if (_east_owner>_west_owner) then
	{
	opt_dominator = "CSAT";  //variable opt_dominator wird in opt_countdown.sqf alle 60 sek ausgewertet

	//wenn sectormsg an sind dann schreibe den text
	#ifdef __OPT_Sector_Message__
	["sectorControl_Msg", "<t size='0.8' shadow='1' color='#B80A28'>CSAT dominiert das Gebiet!</t>"] call tcb_fnc_NetCallEvent;
	#endif
	};

//selbe wie oben nur umgekehrt
if (_east_owner<_west_owner) then {
	opt_dominator = "NATO";  //variable opt_dominator wird in opt_countdown.sqf alle 60 sek ausgewertet
		//wenn sectormsg an sind dann schreibe den text
	#ifdef __OPT_Sector_Message__
	["sectorControl_Msg", "<t size='0.8' shadow='1' color='#B80A28'>NATO dominiert das Gebiet!</t>"] call tcb_fnc_NetCallEvent;
	#endif
	};

//selbe wie oben GLEICHSTAND
if (_east_owner==_west_owner) then
	{opt_dominator = "none";  //variable opt_dominator wird in opt_countdown.sqf alle 60 sek ausgewertet

	//wenn sectormsg an sind dann schreibe den text
	#ifdef __OPT_Sector_Message__
	["sectorControl_Msg", "<t size='0.8' shadow='1' color='#B80A28'>gleichstand</t>"] call tcb_fnc_NetCallEvent;
	#endif
	};

//mincer das hier ist für debug
systemChat format ["die puplic variable mit der punkte gezaehlt wurden ist (east west, none =gleichstand alles andere heisst kaputt): %1 .. !!!", opt_dominator];
*/

_side_calculated = resistance;
_side_calculated = call opt_fnc_calculateDominator;
systemChat format ["calculated Side: %1", _side_calculated];

switch (_side_calculated) do {
	case (east) : {
		opt_dominator = "CSAT";
		#ifdef __OPT_Sector_Message__
		["sectorControl_Msg", "<t size='0.8' shadow='1' color='#B80A28'>CSAT dominiert das Gebiet!</t>"] call tcb_fnc_NetCallEvent;
		#endif
	};
	case (west) : {
		opt_dominator = "NATO";
		#ifdef __OPT_Sector_Message__
		["sectorControl_Msg", "<t size='0.8' shadow='1' color='#006CBD'>NATO dominiert das Gebiet!</t>"] call tcb_fnc_NetCallEvent;
		#endif
	};
	default {opt_dominator = "none"};
};

publicVariable "opt_dominator";

true