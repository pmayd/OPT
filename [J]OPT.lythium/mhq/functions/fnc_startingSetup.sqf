/**
* Author: James
* setup mhq vehicle and action entries
*
* Arguments:
* 0: <OBJECT> mhq vehicle
* 1: <SIDE> side of vehicle
* 2: <ARRAY> composition
* 3: <ARRAY> cargo info
*
* Return Value:
* None
*
* Example:
* [vehicle, east, [], []] call fnc_startingSetup.sqf;
*
*/
#include "script_component.hpp"

params [
    ["_vec", objNull, [objNull], 1],
    ["_side", sideUnknown, [sideUnknown], 1],
    ["_composition", [], [[]]],
    ["_cargoInfo", [], [[]]]
];

if (_vec getVariable [QEGVAR(composition,deployed), false]) then
{
    _vec lock 2;

    if (playerSide isEqualTo _side) then
    {
        {
            _obj = (_vec getVariable [QEGVAR(composition,composition), []]) select _forEachIndex;
            _code = [_x, 3, "", ["", {}]] call BIS_fnc_param;

            if !(_code isEqualTo "") then {
                _code = [_code] call EFUNC(composition,compileCode);
                [_obj, _vec] spawn _code;
            };
        } forEach _composition;

        if (GVAR(showMarkers)) then
        {
            [_vec, _side, "HQ"] call FUNC(drawMarker);
        };

        if (isNil QGVAR(HQarray)) then
        {
            GVAR(HQarray) = [];
        };

        GVAR(HQarray) pushBack _vec;
        if (_vec getVariable [QGVAR(HQIndex), -1] < 0) then
        {
            _vec setVariable [QGVAR(HQIndex), (GVAR(HQarray) find _vec) + 1, true];
        };

        [
            _vec,
            [
                MHQ_ACTION_UNDEPLOY,
                {[_vec, _side, _composition, _cargoInfo] spawn FUNC(undeploy);},
                [],
                0,
                false,
                true,
                "",
                format ["[_target, _this] call %1", QFUNC(actionConditions)]
            ],
            QGVAR(undeployAction)
        ] call EFUNC(common,addAction);
    };
} else
{
    _cargoInfo params
    [
        "_cargoType",
        "_cargoOffset",
        "_cargoDir",
        ["_cargoCode", "", ["", {}], 1]
    ];

    _vec lock false;
    _vec lockCargo true;
    _vec lockCargo [0, false];

    // create cargo container on server
    if (isServer) then
    {
        private _cargo = createVehicle [_cargoType, [0,0,0], [], 0, "NONE"];
        [_vec, _cargo] apply {_x enableSimulation true};
        _cargo attachTo [_vec, _cargoOffset];

        _vec setPos (getPos _vec);
        _vec setDir (getDir _vec);
        _cargo setDir _cargoDir;
        _vec setVariable [QEGVAR(composition,cargo), _cargo, true];
    };
    _cargo = _vec getVariable [QEGVAR(composition,cargo), objNull];

    if (playerSide isEqualTo _side) then
    {

        if (GVAR(showMarkers)) then
        {
            [_vec, _side, "MHQ"] call FUNC(drawMarker);
        };

        if (isNil QGVAR(HQarray)) then
        {
            GVAR(HQarray) = [];
        };

        GVAR(HQarray) pushBack _vec;
        if (_vec getVariable [QGVAR(HQIndex), -1] < 0) then
        {
            _vec setVariable [QGVAR(HQIndex), (GVAR(HQarray) find _vec) + 1, true];
        };

        [
            _vec,
            [
                MHQ_ACTION_DEPLOY,
                {(_this select 3) spawn FUNC(deploy);},
                [_vec, _side, _composition, _cargoInfo],
                0,
                false,
                true,
                "",
                format ["[_target, _this] call %1", QFUNC(actionConditions)]
            ],
            QGVAR(deployAction)
        ] call EFUNC(common,addAction);

        // call on server
        [_vec, "cargo"] remoteExec [QEFUNC(composition,deleteComposition), 2];

        if !(_cargoCode isEqualTo "") then
        {
            _cargoCode = [_cargoCode] call EFUNC(composition,compileCode);
            [_cargo, _vec] spawn _cargoCode;
        };
    };
};