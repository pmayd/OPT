#include "..\setup\setup.sqf"
diag_log format ["############################# %1 #############################", missionName];

XGreyText = {"<t color='#f0bfbfbf'>" + _this + "</t>"};
XRedText = {"<t color='#f0ff0000'>" + _this + "</t>"};
XOrangeText = {"<t color='#F3B601'>" + _this + "</t>"};
XBlueText = {"<t color='#655EDE'>" + _this + "</t>"};
XTuerkiesText = {"<t color='#00D3BF'>" + _this + "</t>"};

opt_allowedSides = [blufor, opfor];

///////////////////////////////////////////////////////////////////////////////////
// Global Variables
SM3_started		= false;

///////////////////////////////////////////////////////////////////////////////////

diag_log format ["%1 --- preInit.sqf is processed",diag_ticktime];