params [
	"_vehicle",
	"_objectID"
];

_found = false;
_loadedItems = _vehicle getVariable ["AME_Load_loadedObjects", []];
{
    if ((objectFromNetId _objectID) == _x) exitWith { _found = true; };
} count _loadedItems;


_found