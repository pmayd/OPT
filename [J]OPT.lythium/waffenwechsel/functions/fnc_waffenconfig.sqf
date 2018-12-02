/**
* Konfig Waffenwechselmodul
* 
* Author: [GNC]Lord-MDB
*
* Arguments:
* keine
* 
* Return Value:
* keine
* 
* Server only:
* nein
*
* Public:
* nein
* 
* Global:
* nein
* 
* Sideeffects:
* Parametervorgaben für Dialog
* 
* Example:
* 
*/
#include "script_component.hpp"

//Raketen Heli Nato
//[Magazinename, Waffenname, Preis/Schuss, Preis Magazin, Boxname, Waffenkontrolle Pilot KHS]
GVAR(Raktenheliwest) =  [
    ["OPT_PylonRack_1Rnd_Missile_AGM_02_F", "OPT_Missile_AGM_02_Plane_CAS_01_F", 150000, 150000, "1xMacer", 0],  // 0.1xMacer
    ["OPT_PylonMissile_Missile_AMRAAM_D_INT_x1", "OPT_weapon_AMRAAMLauncher", 100000, 100000, "1xAMRAAM", 0],  //      1.1xAMRAAM
    ["OPT_PylonRack_1Rnd_LG_scalpel", "OPT_missiles_SCALPEL", 200000, 200000, "1xScalpel", 0],  //      2.1xScalpel AH9, Orca
    ["OPT_PylonRack_3Rnd_LG_scalpel", "OPT_missiles_SCALPEL", 200000, 600000, "3xScalpel", 0],  //      3.3xScalpel
    ["OPT_PylonRack_12Rnd_missiles", "OPT_missiles_DAR", 4000, 48000, "12xDAR", -1],  //      4.12xDAR
    ["OPT_PylonRack_12Rnd_PG_missiles", "OPT_missiles_DAGR", 10000, 120000, "12xDAGR", -1],  //      5.12xDAGR
    ["OPT_PylonRack_19Rnd_Rocket_Skyfire", "OPT_rockets_Skyfire", 2500, 47500, "19xSkyfire", -1],  //      6.19xSkyfire
    ["OPT_PylonRack_4Rnd_LG_scalpel", "OPT_missiles_SCALPEL", 200000, 800000, "4xScalpel", 0],  //      7.4xScalpel
    ["PylonRack_7Rnd_Rocket_04_HE_F", "OPT_Rocket_04_HE_Plane_CAS_01_F", 2500, 17500, "7xShrieker HE", -1],  //      8.7xShrieker HE
    ["PylonRack_7Rnd_Rocket_04_AP_F", "OPT_Rocket_04_AP_Plane_CAS_01_F", 5000, 35000, "7xShrieker AP", -1],  //      9.7xShrieker AP
    ["PylonRack_20Rnd_Rocket_03_HE_F", "OPT_Rocket_03_HE_Plane_CAS_02_F", 2500, 50000, "20xTratnyr HE", -1],  //      10.20xTratnyr HE
    ["PylonRack_20Rnd_Rocket_03_AP_F", "OPT_Rocket_03_AP_Plane_CAS_02_F", 5000, 100000, "20xTratnyr AP", -1],  //      11.20xTratnyr AP
    ["OPT_PylonMissile_1Rnd_LG_scalpel", "OPT_missiles_SCALPEL", 200000, 200000, "1xScalpel", 0],  //      12.1xScalpel Hellcat, Kajman, Blackfoot
    ["OPT_PylonRack_1Rnd_AAA_missiles", "OPT_missiles_ASRAAM", 25000, 25000, "1xASRAAM", 0],  //      13.1xASRAAM AH9, Orca, Hellcat
    ["OPT_PylonRack_Missile_AGM_02_x1", "OPT_weapon_AGM_65Launcher", 150000, 150000, "1xMacer II", 0],  // 14.1xMacer II
    ["OPT_PylonMissile_1Rnd_AAA_missiles", "OPT_missiles_ASRAAM", 25000, 25000, "1xASRAAM", 0]  //      15.1xASRAAM Blackfoot
];

//Gun Heli Nato
//[Magazinename, Waffenname, Preis/Schuss, Preis Magazin, Boxname]
GVAR(Gunheliwest) = [
    ["5000Rnd_762x51_Yellow_Belt", "OPT_M134_minigun", 10, 50000, "5000x7.62 mm"],       // 0.5000x7.62 mm Minigun 
    ["1000Rnd_65x39_Belt_Yellow", "LMG_Minigun_heli", 10, 10000, "1000x7.62 mm"],  // 1.1000x7.62 mm Minigun 
    ["2000Rnd_65x39_Belt_Yellow", "LMG_Minigun_heli", 10, 20000, "2000x7.62 mm"],  // 2.2000x7.62 mm Minigun 
    ["1000Rnd_20mm_shells", "OPT_gatling_20mm", 100, 100000, "1000x20 mm"],      // 3.1000x20 mm Minigun
    ["2000Rnd_20mm_shells", "OPT_gatling_20mm", 100, 200000, "2000x20 mm"],      // 4.2000x20 mm Minigun 
    ["300Rnd_20mm_shells", "OPT_gatling_20mm", 100, 30000, "300x20 mm"],         // 5.300x20 mm Minigun 
    ["250Rnd_30mm_HE_shells", "OPT_gatling_30mm", 300, 50000, "250x30 mm HE"],   // 6.250x30 mm HE Cannon Caseless 
    ["250Rnd_30mm_APDS_shells", "OPT_gatling_30mm", 200, 75000, "250x30 mm APDS"]// 7.250x30 mm APSD Cannon Caseless 
];

//Gun Fahrzeuge Nato
//[Magazinename, Waffenname, Preis/Schuss, Preis Magazin, Boxname]
GVAR(Gunvehwest) = [
    ["500Rnd_127x99_mag", "HMG_127", 80, 40000, "500x12.7 mm"],  // 0.500x12.7 mm AA MG
    ["200Rnd_127x99_mag", "HMG_127", 80, 16000, "200x12.7 mm"],  // 1.200x12.7 mm AA MG
    ["100Rnd_127x99_mag", "HMG_127", 80, 8000, "100x12.7 mm"],  // 2.100x12.7 mm AA MG
    ["2000Rnd_762x51_Belt", "LMG_coax", 10, 20000, "2000x7.62 mm"],  // 3.2000x7.62 mm LMG
    ["1000Rnd_762x51_Belt", "LMG_coax", 10, 10000, "1000x7.62 mm"],  // 4.1000x7.62 mm LMG
    ["2000Rnd_65x39_Belt", "LMG_RCWS", 7, 14000, "2000x6.5 mm"],  // 5.2000x6.5 mm LMG
    ["1000Rnd_65x39_Belt", "LMG_RCWS", 7, 7000, "1000x6.5 mm"],  // 6.1000x6.5 mm LMG
    ["200Rnd_40mm_G_belt", "GMG_40mm", 1000, 200000, "200x40 mm HE Grenade"],  //  7.200x40 mm HE Grenade
    ["96Rnd_40mm_G_belt", "GMG_40mm", 1000, 96000, "96x40 mm HE Grenade"],  //  8.96x40 mm HE Grenade 
    ["32Rnd_40mm_G_belt", "GMG_40mm", 1000, 32000, "32x40 mm HE Grenade"],  //  9.32x40 mm HE Grenade
    ["200Rnd_20mm_G_belt", "GMG_20mm", 250, 50000, "200x20 mm HE Grenade"],  //  10.200x20 mm HE Grenade
    ["40Rnd_20mm_g_belt", "GMG_20mm", 250, 10000, "40x20 mm HE Grenade"],  //  11.40x20 mm HE Grenade
    ["140Rnd_30mm_MP_shells", "OPT_autocannon_30mm_CTWS", 100, 14000, "140x30 mm HE"],  //  12.140x30 mm HE
    ["60Rnd_30mm_APFSDS_shells", "OPT_autocannon_30mm_CTWS", 400, 24000, "60x30 mm APFSDS"],  //  13.60x30 mm APFSDS
    ["60Rnd_40mm_GPR_shells", "OPT_autocannon_40mm_CTWS", 200, 12000, "60x40 mm HE"],  //  14.60x40 mm HE
    ["40Rnd_40mm_APFSDS_shells", "OPT_autocannon_40mm_CTWS", 700, 28000, "40x40 mm APFSDS"],  //  15.40x40 mm APFSDS
    ["2Rnd_GAT_missiles", "OPT_missiles_titan", 50000, 100000, "2xTitan AT"],  //  16.2xTitan AT  
    ["1Rnd_GAT_missiles", "OPT_missiles_titan_static", 50000, 50000, "1xTitan AT"],  //  17.1xTitan AT
    ["SPG9_HEAT", "launcher_SPG9", 25000, 25000, "1xSPG-9 HEAT"],  //  18.1xSPG-9 HEAT
    ["SPG9_HE", "launcher_SPG9", 1000, 1000, "1xSPG-9 HE"],  //  19.1xSPG-9 HE
    ["OPT_680Rnd_35mm_AA_shells_Tracer_Green", "OPT_autocannon_35mm", 100, 68000, "680xFlak 35 mm"],  //  20.680xFlak 35 mm
    ["OPT_1200Rnd_35mm_AA_shells_Tracer_Green", "OPT_autocannon_35mm", 100, 120000, "1200xFlak 35 mm"],  //  21.1200xFlak 35 mm
    ["4Rnd_Titan_long_missiles", "OPT_missiles_titan", 12500, 50000, "4xTitan AA"],  //  22.4xTitan AA
    ["2Rnd_Titan_long_missiles", "OPT_missiles_titan", 12500, 25000, "2xTitan AA"],  //  23.2xTitan AA
    ["32Rnd_120mm_APFSDS_shells", "cannon_120mm", 5000, 160000, "32x120mm APFSDS"],  //  24.32x120mm APFSDS
    ["30Rnd_120mm_HE_shells", "cannon_120mm", 3000, 90000, "30x120mm HE"],  //  25.30x120mm HE
    ["20Rnd_120mm_HEAT_MP", "cannon_120mm", 4500, 90000, "20x120mm HEAT"],  //  26.20x120mm HEAT
    ["20Rnd_120mm_APFSDS_shells", "cannon_120mm", 5000, 100000, "20x120mm APFSDS"],  //  27.20x120mm APFSDS
    ["16Rnd_120mm_HE_shells", "cannon_120mm", 3000, 48000, "16x120mm HE"],  //  28.16x120mm HE
    ["12Rnd_120mm_HEAT_MP", "cannon_120mm", 4500, 54000, "12x120mm HEAT"],  //  29.12x120mm HEAT
    ["12Rnd_120mm_APFSDS_shells", "cannon_120mm", 5000, 60000, "12x120mm APFSDS"],  //  30.12x120mm APFSDS
    ["8Rnd_120mm_HE_shells", "cannon_120mm", 3000, 24000, "8x120mm HE"],  //  31.8x120mm HE
    ["8Rnd_120mm_HEAT_MP", "cannon_120mm", 4500, 36000, "8x120mm HEAT"],  //  32.8x120mm HEAT
    ["24Rnd_125mm_APFSDS", "cannon_125mm", 6000, 144000, "24x125mm APFSDS"],  //  33.20x125mm APFSDS
    ["12Rnd_125mm_HE", "cannon_125mm", 3500, 42000, "12x125mm HE"],  //  34.12x125mm HE
    ["12Rnd_125mm_HEAT", "cannon_125mm", 5000, 60000, "12x125mm HEAT"],  //  35.12x125mm HEAT
    ["16Rnd_125mm_APFSDS", "cannon_125mm", 6000, 96000, "16x125mm APFSDS"],  // 36.16x125mm APFSDS
    ["8Rnd_125mm_HE", "cannon_125mm", 3500, 28000, "8x125mm HE"],  //  37.8x125mm HE
    ["4Rnd_120mm_cannon_missiles", "cannon_120mm", 50000, 200000, "4x120mm ATGM"],  // 38.4x120mm ATGM
    ["4Rnd_125mm_cannon_missiles", "cannon_125mm", 50000, 200000, "4x125mm ATGM"],  //  39.4x125mm ATGM
    ["OPT_32Rnd_155mm_Mo_shells", "OPT_mortar_155mm_AMOS", 5000, 160000, "32x155 mm HE"],  //  40.32x155 mm HE
    ["OPT_2Rnd_155mm_Mo_Cluster", "OPT_mortar_155mm_AMOS", 20000, 40000, "2xCluster"],  //  41.2xCluster Shells
    ["6Rnd_155mm_Mo_smoke", "OPT_mortar_155mm_AMOS", 500, 3000, "6xSmoke"],  //  42.6xSmoke 
    ["Vorona_HEAT", "missiles_Vorona", 500, 250000, "1xVorona-HEAT"],  //  43.vorona-test KalleK 
    ["Vorona_HE", "missiles_Vorona", 500, 150000, "1xVorona-HE"]  //  44.vorona-test KalleK 
];

//Raketen CSAT
//[Magazinename, Waffenname, Preis/Schuss, Preis Magazin, Boxname, Waffenkontrolle Pilot KHS]
GVAR(Raktenhelieast) = [
    ["OPT_PylonRack_1Rnd_Missile_AGM_01_F", "OPT_Missile_AGM_01_Plane_CAS_02_F", 150000, 150000, "1xSharur", 0],  // 0.1xSharur
    ["OPT_PylonMissile_Missile_AMRAAM_D_INT_x1", "OPT_weapon_AMRAAMLauncher", 100000, 100000, "1xAMRAAM", 0],  //      1.1xAMRAAM
    ["OPT_PylonRack_1Rnd_LG_scalpel", "OPT_missiles_SCALPEL", 200000, 200000, "1xScalpel", 0],  //      2.1xScalpel AH9, Orca
    ["OPT_PylonRack_3Rnd_LG_scalpel", "OPT_missiles_SCALPEL", 200000, 600000, "3xScalpel", 0],  //      3.3xScalpel
    ["OPT_PylonRack_12Rnd_missiles", "OPT_missiles_DAR", 4000, 48000, "12xDAR", -1],  //      4.12xDAR
    ["OPT_PylonRack_12Rnd_PG_missiles", "OPT_missiles_DAGR", 10000, 120000, "12xDAGR", -1],  //      5.12xDAGR
    ["OPT_PylonRack_19Rnd_Rocket_Skyfire", "OPT_rockets_Skyfire", 2500, 47500, "19xSkyfire", -1],  //      6.19xSkyfire
    ["OPT_PylonRack_4Rnd_LG_scalpel", "OPT_missiles_SCALPEL", 200000, 800000, "4xScalpel", 0],  //      7.4xScalpel
    ["PylonRack_7Rnd_Rocket_04_HE_F", "OPT_Rocket_04_HE_Plane_CAS_01_F", 2500, 17500, "7xShrieker HE", -1],  //      8.7xShrieker HE
    ["PylonRack_7Rnd_Rocket_04_AP_F", "OPT_Rocket_04_AP_Plane_CAS_01_F", 5000, 35000, "7xShrieker AP", -1],  //      9.7xShrieker AP
    ["PylonRack_20Rnd_Rocket_03_HE_F", "OPT_Rocket_03_HE_Plane_CAS_02_F", 2500, 50000, "20xTratnyr HE", -1],  //      10.20xTratnyr HE
    ["PylonRack_20Rnd_Rocket_03_AP_F", "OPT_Rocket_03_AP_Plane_CAS_02_F", 5000, 100000, "20xTratnyr AP", -1],  //      11.20xTratnyr AP
    ["OPT_PylonMissile_1Rnd_LG_scalpel", "OPT_missiles_SCALPEL", 200000, 200000, "1xScalpel", 0],  //      12.1xScalpel Hellcat, Kajman, Blackfoot
    ["OPT_PylonRack_1Rnd_AAA_missiles", "OPT_missiles_ASRAAM", 25000, 25000, "1xASRAAM", 0],  //      13.1xASRAAM AH9, Orca, Hellcat
    ["OPT_PylonMissile_Missile_AGM_KH25_x1", "OPT_weapon_AGM_KH25Launcher", 25000, 25000, "1xAGM KH25", 0],  //      14.1xKH25 Kedge
    ["OPT_PylonRack_1Rnd_Missile_AA_03_F", "OPT_Missile_AA_03_F", 25000, 25000, "1xSahr-3", 0]  //      15.1xSahr-3 Kajman
];

//Gun CSAT
//[Magazinename, Waffenname, Preis/Schuss, Preis Magazin, Boxname]
GVAR(Gunhelieast) = [
    ["5000Rnd_762x51_Yellow_Belt", "OPT_M134_minigun", 10, 50000, "5000x7.62 mm"],  // 0.5000x7.62 mm Minigun 
    ["1000Rnd_65x39_Belt_Yellow", "LMG_Minigun_heli", 10, 10000, "1000x7.62 mm"],  // 1.1000x7.62 mm Minigun 
    ["2000Rnd_65x39_Belt_Yellow", "LMG_Minigun_heli", 10, 20000, "2000x7.62 mm"],  // 2.2000x7.62 mm Minigun 
    ["1000Rnd_20mm_shells", "OPT_gatling_20mm", 100, 100000, "1000x20 mm"],  // 3.1000x20 mm Minigun
    ["2000Rnd_20mm_shells", "OPT_gatling_20mm", 100, 200000, "2000x20 mm"],  // 4.2000x20 mm Minigun 
    ["300Rnd_20mm_shells", "OPT_gatling_20mm", 100, 30000, "300x20 mm"],  //      5.300x20 mm Minigun 
    ["250Rnd_30mm_HE_shells", "OPT_gatling_30mm", 300, 50000, "250x30 mm HE"],  // 6.250x30 mm HE Cannon Caseless 
    ["250Rnd_30mm_APDS_shells", "OPT_gatling_30mm", 200, 75000, "250x30 mm APDS"],  // 7.250x30 mm APSD Cannon Caseless 
    ["OPT_PylonWeapon_300Rnd_20mm_shells", "OPT_Twin_Cannon_20mm", 100, 30000, "300xTwin 20mm"]  // 8.300xTwin 20mm Cannon 
];

//Gun Fahrzeuge CSAT
//[Magazinename, Waffenname, Preis/Schuss, Preis Magazin, Boxname]
GVAR(Gunveheast) = [
    ["500Rnd_127x99_mag", "HMG_127", 80, 20000, "500x12.7 mm"],  // 0.500x12.7 mm AA MG
    ["200Rnd_127x99_mag", "HMG_127", 80, 16000, "200x12.7 mm"],  // 1.200x12.7 mm AA MG
    ["100Rnd_127x99_mag", "HMG_127", 80, 8000, "100x12.7 mm"],  // 2.100x12.7 mm AA MG
    ["2000Rnd_762x51_Belt", "LMG_coax", 10, 20000, "2000x7.62 mm"],  // 3.2000x7.62 mm LMG
    ["1000Rnd_762x51_Belt", "LMG_coax", 10, 10000, "1000x7.62 mm"],  // 4.1000x7.62 mm LMG
    ["2000Rnd_65x39_Belt", "LMG_RCWS", 7, 14000, "2000x6.5 mm"],  // 5.2000x6.5 mm LMG
    ["1000Rnd_65x39_Belt", "LMG_RCWS", 7, 7000, "1000x6.5 mm"],  // 6.1000x6.5 mm LMG
    ["200Rnd_40mm_G_belt", "GMG_40mm", 1000, 200000, "200x40 mm HE Grenade"],  //  7.200x40 mm HE Grenade
    ["96Rnd_40mm_G_belt", "GMG_40mm", 1000, 96000, "96x40 mm HE Grenade"],  //  8.96x40 mm HE Grenade 
    ["32Rnd_40mm_G_belt", "GMG_40mm", 1000, 32000, "32x40 mm HE Grenade"],  //  9.32x40 mm HE Grenade
    ["200Rnd_20mm_G_belt", "GMG_20mm", 250, 50000, "200x20 mm HE Grenade"],  //  10.200x20 mm HE Grenade
    ["40Rnd_20mm_g_belt", "GMG_20mm", 250, 10000, "40x20 mm HE Grenade"],  //  11.40x20 mm HE Grenade
    ["140Rnd_30mm_MP_shells", "OPT_autocannon_30mm_CTWS", 100, 14000, "140x30 mm HE"],  //  12.140x30 mm HE
    ["60Rnd_30mm_APFSDS_shells", "OPT_autocannon_30mm_CTWS", 400, 24000, "60x30 mm APFSDS"],  //  13.60x30 mm APFSDS
    ["60Rnd_40mm_GPR_shells", "OPT_autocannon_40mm_CTWS", 200, 12000, "60x40 mm HE"],  //  14.60x40 mm HE
    ["40Rnd_40mm_APFSDS_shells", "OPT_autocannon_40mm_CTWS", 700, 28000, "40x40 mm APFSDS"],  //  15.40x40 mm APFSDS
    ["2Rnd_GAT_missiles", "OPT_missiles_titan", 50000, 100000, "2xTitan AT"],  //  16.2xTitan AT  					"OPT_2Rnd_GAT_missiles" gibts nicht daher vanilla!
    ["1Rnd_GAT_missiles", "OPT_missiles_titan_static", 50000, 50000, "1xTitan AT"],  //  17.1xTitan AT					"OPT_5Rnd_GAT_missiles" gibts nicht daher vanilla!
    ["SPG9_HEAT", "launcher_SPG9", 25000, 25000, "1xSPG-9 HEAT"],  //  18.1xSPG-9 HEAT
    ["SPG9_HE", "launcher_SPG9", 1000, 1000, "1xSPG-9 HE"],  //  19.1xSPG-9 HE
    ["OPT_680Rnd_35mm_AA_shells_Tracer_Red", "OPT_autocannon_35mm", 100, 68000, "680xFlak 35 mm"],  //  20.680xFlak 35 mm
    ["OPT_1200Rnd_35mm_AA_shells_Tracer_Red", "OPT_autocannon_35mm", 100, 120000, "1200xFlak 35 mm"],  //  20.1200xFlak 35 mm
    ["4Rnd_Titan_long_missiles", "OPT_missiles_titan", 12500, 50000, "4xTitan AA"],  //  22.4xTitan AA				gibts nicht daher vanilla!
    ["2Rnd_Titan_long_missiles", "OPT_missiles_titan", 12500, 25000, "2xTitan AA"],  //  23.2xTitan AA				gibts nicht daher vanilla!
    ["32Rnd_120mm_APFSDS_shells", "cannon_120mm", 5000, 160000, "32x120mm APFSDS"],  //  24.32x120mm APFSDS
    ["30Rnd_120mm_HE_shells", "cannon_120mm", 3000, 90000, "30x120mm HE"],  //  25.30x120mm HE
    ["20Rnd_120mm_HEAT_MP", "cannon_120mm", 4500, 90000, "20x120mm HEAT"],  //  26.20x120mm HEAT
    ["20Rnd_120mm_APFSDS_shells", "cannon_120mm", 5000, 100000, "20x120mm APFSDS"],  //  27.20x120mm APFSDS
    ["16Rnd_120mm_HE_shells", "cannon_120mm", 3000, 48000, "16x120mm HE"],  //  28.16x120mm HE
    ["12Rnd_120mm_HEAT_MP", "cannon_120mm", 4500, 54000, "12x120mm HEAT"],  //  29.12x120mm HEAT
    ["12Rnd_120mm_APFSDS_shells", "cannon_120mm", 5000, 60000, "12x120mm APFSDS"],  //  30.12x120mm APFSDS
    ["8Rnd_120mm_HE_shells", "cannon_120mm", 3000, 24000, "8x120mm HE"],  //  31.8x120mm HE
    ["8Rnd_120mm_HEAT_MP", "cannon_120mm", 4500, 36000, "8x120mm HEAT"],  //  32.8x120mm HEAT
    ["24Rnd_125mm_APFSDS", "cannon_125mm", 6000, 144000, "24x125mm APFSDS"],  //  33.20x125mm APFSDS
    ["12Rnd_125mm_HE", "cannon_125mm", 3500, 42000, "12x125mm HE"],  //  34.12x125mm HE
    ["12Rnd_125mm_HEAT", "cannon_125mm", 5000, 60000, "12x125mm HEAT"],  //  35.12x125mm HEAT
    ["16Rnd_125mm_APFSDS", "cannon_125mm", 6000, 96000, "16x125mm APFSDS"],  // 36.16x125mm APFSDS
    ["8Rnd_125mm_HE", "cannon_125mm", 3500, 28000, "8x125mm HE"],  //  37.8x125mm HE
    ["4Rnd_120mm_cannon_missiles", "cannon_120mm", 50000, 200000, "4x120mm ATGM"],  // 38.4x120mm ATGM
    ["4Rnd_125mm_cannon_missiles", "cannon_125mm", 50000, 200000, "4x125mm ATGM"],  //  39.4x125mm ATGM
    ["OPT_32Rnd_155mm_Mo_shells", "OPT_mortar_155mm_AMOS", 5000, 160000, "32x155 mm HE"],  //  40.32x155 mm HE
    ["OPT_2Rnd_155mm_Mo_Cluster", "OPT_mortar_155mm_AMOS", 20000, 40000, "2xCluster"],  //  41.2xCluster Shells
    ["6Rnd_155mm_Mo_smoke", "OPT_mortar_155mm_AMOS", 500, 3000, "6xSmoke"],  //  42.6xSmoke 
    ["Vorona_HEAT", "missiles_Vorona", 500, 250000, "1xVorona-HEAT"],  //  43.vorona-test KalleK 
    ["Vorona_HE", "missiles_Vorona", 500, 150000, "1xVorona-HE"]  //  44.vorona-test KalleK 
];

//Preis Tarnung, Drahtkäfig, Datalinksystem
GVAR(preisTarnung) = 10000;
GVAR(preisDrahtkafig) = 10000;
GVAR(preisDatalink) = 10000;

//West Einheiten
//[[Raketen], [Gun], [Drahtkäfig, Tranung], [Datalink], [Raketenmagzine, Gunmagazine]]
GVAR(Pawnee) = [[0, 2, 4, 8, 9, 10, 11, 13], [0, 1, 2], [0, 0], [1], [2, 2]];    //kallek
GVAR(hellcat1) = [[0, 2, 4, 8, 9, 10, 11, 13], [0, 1, 2], [0, 0], [1], [2, 2]]; //kallek
GVAR(Blackfoot) = [[0, 1, 4, 6, 8, 9, 10, 11, 12, 15], [3, 4, 5, 6, 7], [0, 0], [1], [4, 2]];
GVAR(HunterHMG) = [[], [0, 1, 2], [0, 0], [1], [0, 4]];
GVAR(HunterGMG) = [[], [7, 8, 9, 10, 11], [0, 0], [1], [0, 4]];
GVAR(ProwlerHMG) = [[], [0, 1, 2, 3, 4, 5, 6], [0, 0], [1], [0, 4]];
GVAR(ProwlerAT) = [[], [16, 18, 19, 43, 44], [0, 0], [1], [0, 4]];
GVAR(Panther) = [[], [0, 1, 2, 7, 8, 9, 10, 11], [0, 0], [1], [0, 4]]; //kallek
GVAR(Marshall) = [[], [3, 4, 5, 6, 12, 13], [0, 0], [1], [0, 4]]; //kallek
GVAR(Mora) = [[], [3, 4, 5, 6, 14, 15], [0, 0], [1], [0, 4]]; //kallek
GVAR(Cheetah) = [[], [20, 22, 23], [0, 0], [1], [0, 4]];
GVAR(SlammerUp) = [[], [3, 4, 5, 6, 24, 25, 26, 27, 28, 29, 30, 30, 32, 38], [0, 0], [1], [0, 4]];
GVAR(Scorcher) = [[], [40, 41, 42], [0, 0], [1], [0, 4]];

//EAST Einheiten
GVAR(Orca) = [[0, 2, 4, 8, 9, 10, 11, 13], [0, 1, 2], [0, 0], [1], [2, 2]]; //kallek
GVAR(hellcat)  =  [[0, 2, 4, 8, 9, 10, 11, 13], [0, 1, 2], [0, 0], [1], [2, 2]]; //kallek
GVAR(Kajman) = [[0, 1, 4, 6, 8, 9, 10, 11, 12, 15], [3, 4, 5, 6, 7], [0, 0], [1], [4, 2]];
GVAR(irifHMG) = [[], [0, 1, 2], [0, 0], [1], [0, 4]];
GVAR(irifGMG) = [[], [7, 8, 9, 10, 11], [0, 0], [1], [0, 4]];
GVAR(StriderGMG)  =  [[], [7, 8, 9, 10, 11], [0, 0], [1], [0, 4]];
GVAR(QuilinHMG) = [[], [0, 1, 2, 3, 4, 5, 6], [0, 0], [1], [0, 4]];
GVAR(QuilinAT) = [[], [16, 18, 19, 43, 44], [0, 0], [1], [0, 4]];
GVAR(Marid) = [[], [0, 1, 2, 3, 7, 8, 9, 10, 11], [0, 0], [1], [0, 4]]; //kallek
GVAR(Gorgon) = [[], [3, 4, 5, 6, 12, 13], [0, 0], [1], [0, 4]]; //kallek
GVAR(Kamysh) = [[], [3, 4, 5, 6, 14, 15, 16, 18, 19], [0, 0], [1], [0, 4]]; //kallek
GVAR(Tigris) = [[], [20, 22, 23], [0, 0], [1], [0, 4]];
GVAR(Varsuk) = [[], [3, 4, 5, 6, 33, 34, 35, 36, 37, 39], [0, 0], [1], [0, 4]];
GVAR(Sochor) = [[], [40, 41, 42], [0, 0], [1], [0, 4]];

//Fahrzeuge die zugelassen sind
GVAR(vehclasswestWW) = [
    "OPT4_B_MBT_03_cannon_F",
    "OPT4_B_MRAP_01_gmg_F",
    "OPT4_B_MRAP_01_hmg_F",
    "OPT4_B_Heli_Attack_01_F",
    "OPT4_B_Heli_Attack_01_F",
    "OPT4_B_Heli_Light_01_armed_F",
    "OPT4_B_APC_tracked_03_cannon_F",
    "OPT4_B_APC_Wheeled_01_cannon_F",
    "OPT4_B_APC_Wheeled_01_cannon_F",
    "OPT4_B_APC_Tracked_01_rcws_F",
    "OPT4_B_APC_Tracked_01_AA_F",
    "OPT4_B_MBT_01_cannon_F",
    "OPT4_B_MBT_01_TUSK_F",
    "OPT4_B_MBT_01_arty_F",
    "OPT4_B_MRAP_03_gmg_F",
    "OPT4_B_Heli_light_03_green_F",
    "OPT4_B_MRAP_03_gmg_F",
    "OPT4_B_LSV_01_AT_F"
];

GVAR(vehclasseastWW) = [
    "OPT4_O_MRAP_02_hmg_F", 
    "OPT4_O_MRAP_02_gmg_F",
    "OPT4_O_Heli_light_03_F",
    "OPT4_O_Heli_Light_02_F",
    "OPT4_O_Heli_Light_02_black_F",
    "OPT4_O_Heli_Attack_02_F",
    "OPT4_O_Heli_Attack_02_black_F",
    "OPT4_O_APC_Wheeled_02_rcws_F",
    "OPT4_O_T_APC_Wheeled_02_rcws_ghex_F",
    "OPT4_O_APC_Tracked_02_cannon_F",
    "OPT4_O_T_APC_Tracked_02_cannon_ghex_F",
    "OPT4_O_APC_Tracked_02_AA_F",
    "OPT4_O_T_APC_Tracked_02_AA_ghex_F",
    "OPT4_O_MBT_02_cannon_F",
    "OPT4_O_T_MBT_02_cannon_ghex_F",
    "OPT4_O_MBT_02_arty_F",
    "OPT4_O_T_MBT_02_arty_ghex_F",
    "OPT4_O_APC_Wheeled_03_cannon_F",
    "OPT4_O_LSV_02_AT_F"
];

GVAR(textslotwest) = [
    "OPT_NATO_Offizier"
];

GVAR(textsloteast) = [
    "OPT_CSAT_Offizier"
];