

#ifdef DEBUG_MODE_FULL
    #define LINKFUNC(x) {_this call FUNC(x)}
    #define PREP_RECOMPILE_START    if (isNil "OPT_RECOMPILECACHE") then {OPT_RECOMPILECACHE = [[],[]];}; private _recomp = {
    #define PREP_RECOMPILE_END      }; call _recomp;private _recompIndex = (OPT_RECOMPILECACHE select 0) pushBack (toLower QUOTE(ADDON)); (OPT_RECOMPILECACHE select 1) set [_recompIndex,_recomp];
#else
    #define LINKFUNC(x) FUNC(x)
    #define PREP_RECOMPILE_START /* */
    #define PREP_RECOMPILE_END /* */
#endif


#define LOG_SYS_FORMAT_V(LEVEL,MESSAGE) format ['[%1] (%2) %3: %4', toUpper 'PREFIX', 'COMPONENT', LEVEL, MESSAGE]

#ifdef DEBUG_SYNCHRONOUS
    #define LOG_SYS(LEVEL,MESSAGE) diag_log text LOG_SYS_FORMAT_V(LEVEL,MESSAGE)
#else
    #define LOG_SYS(LEVEL,MESSAGE) LOG_SYS_FORMAT_V(LEVEL,MESSAGE) call CBA_fnc_log
#endif

#define LOG_SYS_FILELINENUMBERS(LEVEL,MESSAGE) LOG_SYS(LEVEL,format [ARR_4('%1 %2:%3',MESSAGE,__FILE__,__LINE__ + 1)])
