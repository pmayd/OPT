/*
	add actionmenu entry to open dynamic groups ui

	Author: 21stCenturyFox (OPT MOD Team)

	v2015-08-04 | this script is part of OperationPandoraTrigger3 ArmA3 script collection

	Description:
	compile_client.sqf -> 	fn_dynamicGroupsMenuEntry = compileFinal preprocessFileLineNumbers "addons\opt3_dynamicGroups\dynamicGroups.sqf";
	onPlayerRespawn.sqf -> 	[] spawn dynamicGroupsMenuEntry;
*/

private ["player", "_addActionDynamicGroups"];

// AddAction Function
_addActionDynamicGroups = ["<t color='#ffff33'>Gruppenmenü</t>",
		{
			_grMgr=createDialog 'RscDisplayDynamicGroups';
		},		// script
		[],		// arguments
		-10,	// priority
		false,	// showWindow
		true,	// hideOnUse
		"",		// shortcut
		""]; 	// condition



player addAction _addActionDynamicGroups;