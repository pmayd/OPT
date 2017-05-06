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
    //type                                                      uniform                                    backpack                  			vest                 		headgear
    ["OPT_CSAT_Offizier",			"",						"",							"",				"H_Beret_ocamo"],
    ["OPT_CSAT_Besatzungsmitglied",	"",						"",							"",				"H_HelmetCrew_O"],
    ["OPT_CSAT_Operator",			"",						"",							"",				"H_Cap_headphones"],
    ["OPT_CSAT_Scharfschuetze",		"U_O_FullGhillie_lsh",	"",							"",				"H_Shemag_olive_hs"],
    ["OPT_CSAT_Beobachter",			"",						"",							"",				"H_Booniehat_oli"],
	["OPT_CSAT_Grenadier",			"",						"B_AssaultPack_ocamo",		"",				""],
	["OPT_CSAT_Pilot",				"U_O_PilotCoveralls",	"",							"",				"H_PilotHelmetHeli_O"]
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
    ["OPT_CSAT_Offizier",
        [["FirstAidKit",1], ["NVGoggles_OPFOR",1]],     // Unfiform
        [],                                             // Backpack
        [["30Rnd_9x21_Mag", 4], ["6Rnd_45ACP_Cylinder", 2], ["SmokeShellRed", 2], ["SmokeShell", 2]]    // Vest
    ],
    ["OPT_CSAT_Operator",
        [["FirstAidKit",1],  ["NVGoggles_OPFOR",1]],
        [],
        [["30Rnd_580x42_Mag_Tracer_F",4], ["MiniGrenade",2], ["SmokeShell",2]]
    ],
    ["OPT_CSAT_Sanitaeter",
        [["NVGoggles_OPFOR",1]],
        [["Medikit",1], ["FirstAidKit",10]],
        [["30Rnd_580x42_Mag_Tracer_F",4], ["MiniGrenade",2], ["SmokeShell",4]]
    ],
    ["OPT_CSAT_Pilot",
        [["NVGoggles_OPFOR",1], ["FirstAidKit",1], ["30Rnd_9x21_Mag",2]],
        [],
        [["SmokeShellRed", 1], ["SmokeShell",2]]
    ],
    ["OPT_CSAT_Besatzungsmitglied",
        [["NVGoggles_OPFOR",1], ["FirstAidKit",1], ["30Rnd_9x21_Mag",2]],
        [],
        [["SmokeShellRed",1], ["SmokeShell",2]]
    ],
    ["OPT_CSAT_Pionier",
        [["30Rnd_580x42_Mag_Tracer_F",2], ["NVGoggles_OPFOR",1]],
        [["Toolkit",1], ["SmokeShellRed",2], ["SmokeShell",2], ["MineDetector",1]],
        [["30Rnd_580x42_Mag_Tracer_F",2],["16Rnd_9x21_Mag",2]]
    ],
    ["OPT_CSAT_Scharfschuetze",
        [["SmokeShellRed", 1], ["SmokeShell",2]],
        [["NVGoggles_OPFOR",1], ["FirstAidKit",2]],
        [["5Rnd_127x108_Mag",5], ["APERSTripMine_Wire_Mag",1]]
    ],
    ["OPT_CSAT_Beobachter",
        [["SmokeShellRed",1], ["SmokeShell",2], ["NVGoggles_OPFOR",1], ["Laserbatteries",2]],
        [["FirstAidKit",2]],
        [["20Rnd_762x51_Mag",3], ["SmokeShellRed",3]]
    ],
    ["OPT_CSAT_Gruppenfuehrer",
        [["SmokeShellRed",3], ["SmokeShell",3]],
        [["FirstAidKit",2]],
        [["30Rnd_580x42_Mag_Tracer_F",4], ["HandGrenade",2],["NVGoggles_OPFOR",1]]
    ],
    ["OPT_CSAT_Grenadier",
        [["SmokeShell",3], ["NVGoggles_OPFOR",1]],
        [["FirstAidKit",2], ["1Rnd_HE_Grenade_shell", 6]],
        [["30Rnd_580x42_Mag_Tracer_F",6], ["HandGrenade",2]]
    ],
    ["OPT_CSAT_PA_Schuetze_Heavy",
        [["NVGoggles_OPFOR",1], ["FirstAidKit",1], ["SmokeShell",2]],
        [],
        [["30Rnd_580x42_Mag_Tracer_F",4], ["MiniGrenade",1]]
    ],
    ["OPT_CSAT_SMG_Schuetze",
        [["NVGoggles_OPFOR",1], ["FirstAidKit",1], ["SmokeShell",2]],
        [],
        [["150Rnd_93x64_Mag",2]]
    ],
    ["OPT_CSAT_MG_Schuetze",
        [["NVGoggles_OPFOR",1], ["FirstAidKit",1], ["SmokeShell",2]],
        [],
        [["HandGrenade",2], ["150Rnd_762x54_Box_Tracer",3]]
    ],
    ["OPT_CSAT_Soldat",
        [["SmokeShell",3], ["NVGoggles_OPFOR",1]],
        [],
        [["30Rnd_580x42_Mag_Tracer_F",7], ["HandGrenade",4], ["FirstAidKit",2]]
    ],
    ["OPT_CSAT_Luftabwehrspezialist",
        [["NVGoggles_OPFOR",1], ["SmokeShell",2]],
        [],
        [["FirstAidKit",1], ["30Rnd_580x42_Mag_Tracer_F",4], ["MiniGrenade",1]]
    ],
    ["OPT_CSAT_Aufklaerung_Sprengmeister",
        [["NVGoggles_OPFOR",1], ["SmokeShell",2]],
        [["APERSMine_Range_Mag",3], ["ATMine_Range_Mag",1], ["MineDetector",1]],
        [["FirstAidKit",1], ["30Rnd_580x42_Mag_Tracer_F",4], ["HandGrenade",1], ["16Rnd_9x21_Mag",2]]
    ]
];
 
// GPS for everyone except Operator
if ((typeOf player) isEqualTo "OPT_CSAT_Operator") then {player addWeapon "O_UavTerminal"} else {player addWeapon "ItemGPS"};
 
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
    ["OPT_CSAT_Offizier", ["Binocular", ["OPT_SMG_02_F", ["optic_ACO_grn_smg"]], "hgun_Pistol_heavy_02_F"]],
    ["OPT_CSAT_Pilot", ["OPT_SMG_02_F"]],
    ["OPT_CSAT_Besatzungsmitglied", ["Binocular", "OPT_SMG_02_F"]],
    
    ["OPT_CSAT_Sanitaeter", ["Binocular", ["OPT_arifle_CTAR_blk_C_F", ["acc_pointer_IR", "optic_ACO_grn"]]]],
    ["OPT_CSAT_Pionier", ["Binocular", ["OPT_arifle_CTAR_blk_C_F", ["acc_pointer_IR", "optic_ACO_grn"]], "hgun_Rook40_F"]],
    ["OPT_CSAT_Aufklaerung_Sprengmeister", ["Binocular", ["OPT_arifle_CTAR_blk_C_F", ["acc_pointer_IR", "optic_ACO_grn"]], "hgun_Rook40_F"]],
    ["OPT_CSAT_Operator", ["Binocular", ["OPT_arifle_CTAR_blk_C_F", ["acc_pointer_IR", "optic_ACO_grn"]]]],
    
    ["OPT_CSAT_PA_Schuetze_Heavy", ["Binocular", ["OPT_arifle_CTAR_blk_C_F", ["acc_pointer_IR", "optic_ACO_grn"]], "OPT_launch_RPG32_F"]],
    ["OPT_CSAT_Luftabwehrspezialist", ["Binocular", ["OPT_arifle_CTAR_blk_C_F", ["acc_pointer_IR", "optic_ACO_grn"]], "OPT_launch_O_Titan_F"]],
	
    ["OPT_CSAT_Gruppenfuehrer", ["Binocular", ["OPT_arifle_CTAR_blk_F", ["acc_pointer_IR", "optic_ERCO_blk_F"]]]],
    ["OPT_CSAT_Soldat", ["Binocular", ["OPT_arifle_CTAR_blk_F", ["acc_pointer_IR", "optic_ERCO_blk_F"]]]],
    ["OPT_CSAT_Grenadier", ["Binocular", ["OPT_arifle_CTAR_GL_blk_F", ["acc_pointer_IR", "optic_ERCO_blk_F"]]]],
	
    ["OPT_CSAT_SMG_Schuetze", ["Binocular", ["OPT_MMG_01_hex_F", ["acc_pointer_IR", "bipod_02_F_blk"]]]],
    ["OPT_CSAT_MG_Schuetze", ["Binocular", ["OPT_LMG_Zafir_F", ["acc_pointer_IR", "optic_ACO_grn"]]]],
	
    ["OPT_CSAT_Scharfschuetze", ["Rangefinder", ["OPT_srifle_GM6_camo_F", ["optic_LRPS"]]]],
    ["OPT_CSAT_Beobachter", ["OPT_Laserdesignator_02", ["OPT_srifle_DMR_06_olive_F", ["acc_pointer_IR", "optic_Hamr", "muzzle_snds_B"]]]]
];