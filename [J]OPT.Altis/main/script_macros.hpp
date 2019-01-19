
// copy the things you need:
/* https://github.com/CBATeam/CBA_A3/blob/master/addons/main/script_macros_common.hpp */
#include "cba_macros_common.hpp"

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

#define PATHTO_SYS(var1,var2,var3) ##var1\##var2\##var3.sqf
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


/* CUSTOM MACROS */
//#define PLAYER_SIDE(var1) [var1] call EFUNC(common,getPlayerSide)
#define PLAYER_SIDE [player] call EFUNC(common,playerSide)
#define UNIT_SIDE(var1) [var1] call EFUNC(common,playerSide)
#define PLAYER_NAME [player] call EFUNC(common,playerName)
#define UNIT_NAME(var1) [var1] call EFUNC(common,playerName)

