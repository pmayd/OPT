///////////////////////////////////////////////////////////////////////////////////
/*
	OPT Custom Keys

	Author: schmingo (OPT MOD Team)

	EarPlugs: 
		inspired by 654wak654 -> http://www.armaholic.com/page.php?id=26624
		inspired by Grafzahl -> http://myDayZ.de

	BIS KeyCodes: https://community.bistudio.com/wiki/ListOfKeyCodes

	v2015-04-05 | this script is part of OperationPandoraTrigger4 ArmA3 script collection
*/
///////////////////////////////////////////////////////////////////////////////////

// changed by psycho

private["_handled","_key"];

_key 		= _this select 1;
_handled 	= false;

//hint format ["%1",_key];

switch (_key) do {
	case 219: { // "WINL"	//psycho, WINL isn't 86!
		if (isNil "opt_EarPlugs") then { opt_EarPlugs = 1};

		switch (opt_EarPlugs) do {
			case 1: {
				1 fadeSound 0.25;
				["<t size='0.8' shadow='1' color='#ffffff'>Ohrstoepsel rein</t>", (safeZoneX - 0.2), (safeZoneY + 0.3), 3, 1, 0, 1] spawn BIS_fnc_dynamicText;
				opt_EarPlugs = 2;
			};
			case 2: {
				1 fadeSound 1;
				["<t size='0.8' shadow='1' color='#ffffff'>Ohrstoepsel raus</t>",  (safeZoneX - 0.2), (safeZoneY + 0.3), 3, 1, 0, 1] spawn BIS_fnc_dynamicText;
				opt_EarPlugs = 1;
			};
		};
		_handled = true;
	};
};


_handled