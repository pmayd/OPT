#define __ccppfln(xfile1) call compile preprocessFileLineNumbers #xfile1
#define __cppfln(xdfunc,xfile2) xdfunc = compile preprocessFileLineNumbers #xfile2
#define __XJIPGetVar(jvarname) (X_JIPH getVariable #jvarname)
#define __XJIPSetVar X_JIPH setVariable

#define PARAMS_1(param1) param1 = _this select 0
#define __getMNsVar(mvarname) (missionNamespace getVariable #mvarname)
#define __getMNsVar2(mvarname) (missionNamespace getVariable mvarname)
#define __mNsSetVar missionNamespace setVariable
#define __pGetVar(pvarname) (player getVariable #pvarname)
#define __pSetVar player setVariable
#define __aiSetVar(theai) theai setVariable
#define __uiGetVar(uvarname) (uiNamespace getVariable #uvarname)
#define __prma _p removeAction _id
#define __waitpl [] spawn {waitUntil {!isNull player};X_INIT = true}
#define __addmx _p addMagazine _x
#define __addwx _p addWeapon _x
#define __kindp _p isKindOf
#define __kind(eobj) eobj isKindOf
#define __sleep sleep 0.152
#define __type typeOf (vehicle player)


#define __MPCheck if (X_MP) then {waitUntil {sleep (1.012 + random 1);(call tcb_fnc_PlayersNumber) > 0}}
#define __addDead(vvar) tcb_allunits_add pushBack vvar;