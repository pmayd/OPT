
#ifndef EXCLUDE_CBA_MACROS
   #include "\x\cba\addons\main\script_macros_mission.hpp"
   // copy the things you need:
   /* https://github.com/CBATeam/CBA_A3/blob/master/addons/main/script_macros_common.hpp */
#else
    #define DOUBLES(var1,var2) ##var1##_##var2
    #define TRIPLES(var1,var2,var3) ##var1##_##var2##_##var3
    #define QUOTE(var1) #var1
    #define ADDON DOUBLES(PREFIX,COMPONENT)
    #define MAIN_ADDON DOUBLES(PREFIX,main)
    #define CSTRING(var1) QUOTE(TRIPLES($STR,ADDON,var1))
    #define ECSTRING(var1,var2) QUOTE(TRIPLES($STR,DOUBLES(PREFIX,var1),var2))
    #define FUNC(var1) TRIPLES(ADDON,fnc,var1)
    #define QFUNC(var1) QUOTE(FUNC(var1))
    #define FUNCMAIN(var1) TRIPLES(PREFIX,fnc,var1)
    #define EFUNC(var1,var2) TRIPLES(DOUBLES(PREFIX,var1),fnc,var2)
    #define QEFUNC(var1,var2) QUOTE(EFUNC(var1,var2))
    #define GVAR(var1) DOUBLES(ADDON,var1)
    #define GVARMAIN(var1) DOUBLES(PREFIX,var1)
    #define QGVARMAIN(var1) QUOTE(DOUBLES(PREFIX,var1))
    #define QGVAR(var1) QUOTE(GVAR(var1))
    #define EGVAR(var1,var2) TRIPLES(PREFIX,var1,var2)
    #define QEGVAR(var1,var2) QUOTE(EGVAR(var1,var2))

    #define ARR_1(ARG1) ARG1
    #define ARR_2(ARG1,ARG2) ARG1, ARG2
    #define ARR_3(ARG1,ARG2,ARG3) ARG1, ARG2, ARG3
    #define ARR_4(ARG1,ARG2,ARG3,ARG4) ARG1, ARG2, ARG3, ARG4
    #define ARR_5(ARG1,ARG2,ARG3,ARG4,ARG5) ARG1, ARG2, ARG3, ARG4, ARG5
    #define ARR_6(ARG1,ARG2,ARG3,ARG4,ARG5,ARG6) ARG1, ARG2, ARG3, ARG4, ARG5, ARG6
    #define ARR_7(ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7) ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7
    #define ARR_8(ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7,ARG8) ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7, ARG8

    #undef EXCLUDE_CBA_MACROS
#endif

#include "script_debug.hpp"

/* -------------------------------------------
Macro: PREP(VAR)
   modified compiling macros
   file: COMPONENT\functions\fnc_VAR.sqf
Parameters:
    VAR - Name of file [Indentifier]
Example:
    (begin example)
        #define COMPONENT main
        PREP(test);
        Result: PREFIX_main_fnc_test = *compiled function*;
    (end)
Author:
    Dorbedo
------------------------------------------- */
#ifdef PREP
    #undef PREP
    #undef PREPMAIN
#endif

#define PREP(var1) TRIPLES(ADDON,fnc,var1) = compile preProcessFileLineNumbers 'PATHTO_SYS(COMPONENT,functions,DOUBLES(fnc,var1))'
#define PREPMAIN(var1) TRIPLES(PREFIX,fnc,var1) = compile preProcessFileLineNumbers 'PATHTO_SYS(COMPONENT,functions,DOUBLES(fnc,var1))'

/*---------------------------------------------
HASH MACROS
HASHCREATE 	Used to create an empty hash.
HASH_SET(hash,key,val) 	Will set the hash key to that value, a key can be anything, even objects.
HASH_GET(hash,key) 	Will return the value of that key (or nil if it doesn’t exist).
HASH_HASKEY(hash,key) 	Will return true/false if that key exists in the hash.
HASH_REM(hash,key) 	Will remove that hash key.
----------------------------------------------- */
#define HASHCREATE [] call CBA_fnc_hashCreate
#define HASH_SET(var1,var2,var3) [var1, var2, var3] call CBA_fnc_hashSet
#define HASH_GET(var1,var2) [var1, var2] call CBA_fnc_hashGet
#define HASH_HASKEY(var1,var2) [var1, var2] call CBA_fnc_hashHasKey
#define HASH_REM(var1,var2) [var1, var2] call CBA_fnc_hashRem
#define HASH_GETKEYS(var1) [var1] call CBA_fnc_hashKeys
#define HASH_ISHASH(var1) [var1] call CBA_fnc_isHash
#define HASH_SIZE(var1) [var1] call CBA_fnc_hashSize
#define HASH_FILTER(var1, var2) [var1, var2] call CBA_fnc_hashFilter
#define HASH_EACHPAIR(var1, var2) [var1, var2] call CBA_fnc_hashEachPair





