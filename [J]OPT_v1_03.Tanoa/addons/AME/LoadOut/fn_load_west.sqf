removeAllWeapons player;
removeAllAssignedItems player;
removeGoggles player;

player linkItem "ItemMap";
player linkItem "ItemWatch";
player linkItem "ItemCompass";
player linkItem "ItemRadio";

// Appearance
{
    if ((typeOf player) isEqualTo (_x select 0)) then {
        if ((_x select 1) != "") then {removeUniform player; player forceAddUniform (_x select 1)};
                if ((_x select 2) != "") then {removeBackpack player; player addBackpack (_x select 2)};
                if ((_x select 3) != "") then {removeVest player; player addVest (_x select 3)};
                if ((_x select 4) != "") then {removeHeadgear player; player addHeadgear (_x select 4)};
    };
} count [
    //type                                                      uniform                                    backpack                  		vest                 headgear
    ["OPT_NATO_Offizier",			"",						"",						"",			"H_Beret_02"],
    ["OPT_NATO_Besatzungsmitglied",	"",						"",						"",			"H_HelmetCrew_B"],
    ["OPT_NATO_Operator",			"",						"",						"",			"H_Cap_headphones"],
    ["OPT_NATO_Scharfschuetze",		"U_B_FullGhillie_lsh",	"",						"",			"H_ShemagOpen_tan"],
    ["OPT_NATO_Beobachter",			"",						"",						"",			"H_HelmetB_camo"],
	["OPT_NATO_Grenadier",			"",						"B_AssaultPack_mcamo",	"",			""],
	["OPT_NATO_Pilot",				"U_B_HeliPilotCoveralls",	"",						"",			"H_PilotHelmetHeli_B"]
];

// Items
{
    if ((typeOf player) isEqualTo (_x select 0)) then {
        {
            (uniformContainer player) addItemCargoGlobal _x;
            true
        } count (_x select 1);
        {
            (backpackContainer player) addItemCargoGlobal _x;
            true
        } count (_x select 2);
        {
            (vestContainer player) addItemCargoGlobal _x;
            true
        } count (_x select 3);
    };
    true
} count [
    ["OPT_NATO_Offizier",
        [["FirstAidKit",1], ["NVGoggles",1]],   // Unfiform
        [],                                             // Backpack
        [["30Rnd_45ACP_Mag_SMG_01", 4], ["11Rnd_45ACP_Mag", 2], ["SmokeShellGreen", 2], ["SmokeShell", 2]]      // Vest
    ],
    ["OPT_NATO_Operator",
        [["FirstAidKit",1],  ["NVGoggles",1]],
        [],
        [["30Rnd_556x45_Stanag_Tracer_Red",4], ["MiniGrenade",2], ["SmokeShell",2]]
    ],
    ["OPT_NATO_Sanitaeter",
        [["NVGoggles",1]],
        [["Medikit",1], ["FirstAidKit",10]],
        [["30Rnd_556x45_Stanag_Tracer_Red",4], ["MiniGrenade",2], ["SmokeShell",4]]
    ],
    ["OPT_NATO_Pilot",
        [["NVGoggles",1], ["FirstAidKit",1], ["30Rnd_45ACP_Mag_SMG_01",2]],
        [],
        [["SmokeShellGreen", 1], ["SmokeShell",2]]
    ],
    ["OPT_NATO_Besatzungsmitglied",
        [["NVGoggles",1], ["FirstAidKit",1], ["30Rnd_45ACP_Mag_SMG_01",2]],
        [],
        [["SmokeShellGreen",1], ["SmokeShell",2]]
    ],
    ["OPT_NATO_Pionier",
        [["30Rnd_556x45_Stanag_Tracer_Red",2], ["NVGoggles",1]],
        [["Toolkit",1], ["SmokeShellGreen",2], ["SmokeShell",2], ["MineDetector",1]],
        [["30Rnd_556x45_Stanag_Tracer_Red",2], ["16Rnd_9x21_Mag",2]]
    ],
    ["OPT_NATO_Scharfschuetze",
        [["SmokeShellGreen", 1], ["SmokeShell",2], ["FirstAidKit",2]],
        [],
        [["7Rnd_408_Mag",4], ["APERSTripMine_Wire_Mag",1], ["NVGoggles",1]]
    ],
    ["OPT_NATO_Beobachter",
        [["SmokeShellGreen",1], ["SmokeShell",2], ["NVGoggles",1], ["Laserbatteries",2]],
        [["FirstAidKit",2]],
        [["20Rnd_762x51_Mag",3], ["SmokeShellGreen",3]]
    ],
    ["OPT_NATO_Gruppenfuehrer",
        [["SmokeShellGreen",3], ["SmokeShell",3]],
        [["FirstAidKit",2]],
        [["30Rnd_556x45_Stanag_Tracer_Red",4], ["HandGrenade",2], ["NVGoggles",1]]
    ],
    ["OPT_NATO_Grenadier",
        [["SmokeShell",3], ["NVGoggles",1]],
        [["FirstAidKit",2], ["1Rnd_HE_Grenade_shell", 6]],
        [["30Rnd_556x45_Stanag_Tracer_Red",6], ["HandGrenade",2]]
    ],
    ["OPT_NATO_PA_Schuetze",
        [["NVGoggles",1], ["FirstAidKit",1], ["SmokeShell",2]],
        [],
        [["30Rnd_556x45_Stanag_Tracer_Red",4], ["MiniGrenade",1]]
    ],
    ["OPT_NATO_Aufklaerung_Spaeher_AT",
        [["NVGoggles",1], ["FirstAidKit",1], ["SmokeShell",2]],
        [],
        [["30Rnd_556x45_Stanag_Tracer_Red",4], ["MiniGrenade",1]]
    ],
    ["OPT_NATO_PA_Schuetze_Heavy",
        [["NVGoggles",1], ["FirstAidKit",1], ["SmokeShell",2]],
        [],
        [["30Rnd_556x45_Stanag_Tracer_Red",4], ["MiniGrenade",1]]
    ],
    ["OPT_NATO_SMG_Schuetze",
        [["NVGoggles",1], ["FirstAidKit",1], ["SmokeShell",2]],
        [],
        [["130Rnd_338_Mag",2]]
    ],
    ["OPT_NATO_MG_Schuetze",
        [["NVGoggles",1], ["FirstAidKit",1], ["SmokeShell",2]],
        [],
        [["HandGrenade",2], ["200Rnd_65x39_cased_Box_Tracer",3]]
    ],
    ["OPT_NATO_Soldat",
        [["SmokeShell",3], ["NVGoggles",1]],
        [],
        [["30Rnd_556x45_Stanag_Tracer_Red",7], ["HandGrenade",4], ["FirstAidKit",2]]
    ],
    ["OPT_NATO_Luftabwehrspezialist",
        [["NVGoggles",1], ["SmokeShell",2]],
        [],
		[["FirstAidKit",1], ["30Rnd_556x45_Stanag_Tracer_Red",4], ["MiniGrenade",1]]
    ],
    ["OPT_NATO_Aufklaerung_Sprengmeister",
        [["NVGoggles",1], ["SmokeShell",2]],
        [["APERSMine_Range_Mag",3], ["ATMine_Range_Mag",1], ["MineDetector",1]],
        [["FirstAidKit",1], ["30Rnd_556x45_Stanag_Tracer_Red",4], ["HandGrenade",1], ["16Rnd_9x21_Mag",2]]
    ]
];

// GPS for everyone except Operator
if ((typeOf player) isEqualTo "OPT_NATO_Operator") then {player addWeapon "B_UavTerminal"} else {player addWeapon "ItemGPS"};
 
// Weapons
{
    if ((typeOf player) isEqualTo (_x select 0)) then {
        {
            if ((typeName _x) == "ARRAY") then {
                player addWeapon (_x select 0);
                {
                    player addPrimaryWeaponItem _x;
                    true
                } count (_x select 1);
            } else {
                player addWeapon _x;
            };
            true
        } count (_x select 1);
    };
    true
} count [
    ["OPT_NATO_Offizier", ["Binocular", ["OPT_SMG_01_F", ["optic_Aco_smg"]], "hgun_Pistol_heavy_01_F"]],
    ["OPT_NATO_Pilot", ["OPT_SMG_01_F"]],
    ["OPT_NATO_Besatzungsmitglied", ["Binocular", "OPT_SMG_01_F"]],
    
    ["OPT_NATO_Sanitaeter", ["Binocular", ["OPT_arifle_SPAR_01_blk_C_F", ["acc_pointer_IR", "optic_Aco"]]]],
    ["OPT_NATO_Pionier", ["Binocular", ["OPT_arifle_SPAR_01_blk_C_F", ["acc_pointer_IR", "optic_Aco"]], "hgun_P07_F"]],
    ["OPT_NATO_Aufklaerung_Sprengmeister", ["Binocular", ["OPT_arifle_SPAR_01_blk_C_F", ["acc_pointer_IR", "optic_Aco"]], "hgun_P07_F"]],
    ["OPT_NATO_Operator", ["Binocular", ["OPT_arifle_SPAR_01_blk_C_F", ["acc_pointer_IR", "optic_Aco"]]]],
    
    ["OPT_NATO_PA_Schuetze_Heavy", ["Binocular", ["OPT_arifle_SPAR_01_blk_C_F", ["acc_pointer_IR", "optic_Aco"]], "OPT_launch_RPG32_F"]],
    ["OPT_NATO_PA_Schuetze", ["Binocular", ["OPT_arifle_SPAR_01_blk_C_F", ["acc_pointer_IR", "optic_Aco"]], "OPT_launch_RPG32_F"]],
    ["OPT_NATO_Aufklaerung_Spaeher_AT", ["Binocular", ["OPT_arifle_SPAR_01_blk_C_F", ["acc_pointer_IR", "optic_Aco"]], "OPT_launch_RPG32_F"]],
    ["OPT_NATO_Luftabwehrspezialist", ["Binocular", ["OPT_arifle_SPAR_01_blk_C_F", ["acc_pointer_IR", "optic_Aco"]], "OPT_launch_B_Titan_F"]],
    
    ["OPT_NATO_Gruppenfuehrer", ["Binocular", ["OPT_arifle_SPAR_01_blk_F", ["acc_pointer_IR", "optic_ERCO_blk_F"]]]],
    ["OPT_NATO_Soldat", ["Binocular", ["OPT_arifle_SPAR_01_blk_F", ["acc_pointer_IR", "optic_ERCO_blk_F"]]]],
    ["OPT_NATO_Grenadier", ["Binocular", ["OPT_arifle_SPAR_01_GL_blk_F", ["acc_pointer_IR", "optic_ERCO_blk_F"]]]],
    
    ["OPT_NATO_SMG_Schuetze", ["Binocular", ["OPT_MMG_02_black_F", ["acc_pointer_IR", "bipod_01_F_snd"]]]],
    ["OPT_NATO_MG_Schuetze", ["Binocular", ["OPT_LMG_Mk200_F", ["acc_pointer_IR", "optic_Aco", "bipod_01_F_snd"]]]],
	
    ["OPT_NATO_Scharfschuetze", ["Rangefinder", ["OPT_srifle_LRR_F", ["optic_LRPS"]]]],
    ["OPT_NATO_Beobachter", ["OPT_Laserdesignator", ["OPT_srifle_DMR_03_F", ["acc_pointer_IR", "optic_Hamr", "muzzle_snds_B"]]]]
];