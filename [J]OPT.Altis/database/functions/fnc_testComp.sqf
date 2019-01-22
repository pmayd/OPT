/**
 * Author: James
 * test functionality of component by evoking all functions
 *
 * Arguments:
 * None
 *
 * Return Value:
 * <BOOL> - true: all tests successful, false: else
 *
 */

#include "script_component.hpp"

LOG_1("UnitTest %1",QUOTE(COMPONENT));
private _status = true;

LOG_2("UnitTest %1, FUNC %2",QUOTE(COMPONENT),QFUNC(setVar));
private _testVal = ["databaseTest", missionStart, true] call FUNC(setVar);

if (!_testVal) then {
    ERROR_1("%1 test failed, val not set (true)",QFUNC(setVar));
    _status = false;
};

LOG_2("UnitTest %1, FUNC %2",QUOTE(COMPONENT),QFUNC(getVar));
private _testVal = ["databaseTest"] call FUNC(getVar);

if (!(_testVal isEqualTo missionStart)) then {
    ERROR_1("%1 test failed, getVar not equal setVar",QFUNC(getVar));
    _status = false;
};

LOG_2("UnitTest %1, FUNC %2",QUOTE(COMPONENT),QFUNC(delVar));
private _testVal = ["databaseTest"] call FUNC(delVar);

if (!_testVal) then {
    ERROR_1("%1 test failed, val not deleted (true)",QFUNC(delVar));
    _status = false;
};

LOG_2("UnitTest %1, FUNC %2",QUOTE(COMPONENT),QFUNC(delVar));
private _testVal = ["databaseTest"] call FUNC(delVar);

if (_testVal) then {
    ERROR_1("%1 test failed, val not nil",QFUNC(delVar));
    _status = false;

};

LOG_2("UnitTest %1, FUNC %2",QUOTE(COMPONENT),QFUNC(getVar));
private _testVal = ["databaseTest"] call FUNC(getVar);

if (!isNil QUOTE(_testVal)) then {
    ERROR_1("%1 test failed, val not nil",QFUNC(getVar));
    _status = false;
};

LOG_2("UnitTest %1, FUNC %2",QUOTE(COMPONENT),QFUNC(pushVar));
private _testVal = ["databaseTest", missionStart, true] call FUNC(setVar);
private _testVal = ["databaseTest", 1] call FUNC(pushVar);

if (!(_testVal isEqualTo count missionStart)) then {
    ERROR_1("%1 test failed, val not true",QFUNC(pushVar));
    _status = false;
};

private _testVal = ["databaseTest"] call FUNC(getVar);

if (!(_testVal isEqualTo (missionStart + [1]))) then {
    ERROR_1("%1 test failed, getVar not equal setVar",QFUNC(pushVar));
    _status = false;

};

private _testVal = ["databaseTest", 1] call FUNC(pushVar);
private _testVal = ["databaseTest"] call FUNC(getVar);

if (!(_testVal isEqualTo (missionStart + [1,1]))) then {
    ERROR_1("%1 test failed, getVar not equal setVar",QFUNC(pushVar));
    _status = false;

};

private _testVal = ["databaseTest", [1], true] call FUNC(pushVar);
private _testVal = ["databaseTest"] call FUNC(getVar);

if (!(_testVal isEqualTo (missionStart + [1,1,1]))) then {
    ERROR_1("%1 test failed, getVar not equal setVar",QFUNC(pushVar));
    _status = false;

};

private _testVal = ["databaseTest", [1]] call FUNC(pushVar);
private _testVal = ["databaseTest"] call FUNC(getVar);

if (!(_testVal isEqualTo (missionStart + [1,1,1,[1]]))) then {
    ERROR_1("%1 test failed, getVar not equal setVar",QFUNC(pushVar));
    _status = false;

};

LOG_2("UnitTest %1, FUNC %2",QUOTE(COMPONENT),QFUNC(remVar));
private _testVal = ["databaseTest", 1, true] call FUNC(remVar);

if (!(_testVal isEqualTo 3)) then {
    ERROR_1("%1 test failed, number of removed elements wrong",QFUNC(remVar));
    _status = false;
};


LOG_2("UnitTest %1, FUNC %2",QUOTE(COMPONENT),QFUNC(saveProfile));
private _testVal = [] call FUNC(saveProfile);

if (!_testVal) then {
    ERROR_1("%1 test failed, profile not saved (true)",QFUNC(saveProfile));
    _status = false;
};

if (_status) then {
    LOG("All tests completed without failure.");
    ["databaseTest"] call FUNC(delVar);
};

_status

