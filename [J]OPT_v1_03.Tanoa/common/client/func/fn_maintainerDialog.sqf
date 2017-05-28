private["_handled","_key"];

_key 		= _this select 1;
_handled 	= false;

switch (_key) do {
	case 220: { // "WINR"
		createDialog "maintainer_dialog";
		_handled = true;
	};
};

_handled