/**
* Author: Lord
* setup locations and heavy vehicle classnames
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_setup_beamOrte.sqf;
*
*/
#include "script_component.hpp"
// Position=[0, 0, 0]
// Name = "ABC"
// Stufe = -1-0-1-2-3 // -1 nach Waffenruhe wählbar, 0 Nicht Wählbar,  1 Inf,  2 inf + leichte Fahrzeuge,  3 inf + Schwere Fahrzeuge
//
// Bsp [[Position], Name, Stufe], 


//West
GVAR(locations_west) =
[
    [[20380.859,74.11026,13278.386], "NATO Basis", -1],
    [[101.21878,595.30927,5800.7988], "NATO FOB Südwest", -1],
	
	[[16323.387,295.42099,19569.826], "AFARAT - Bergdorf", 3],
	[[15096.128,313.332,19121.313], "AFARAT - Farm", 3],
	[[16082.619,237.424,20027.926], "AFARAT - Zentrum", 3],	

	[[16222.217,31.23,6538.229], "AFSHER - Baustelle", 3],	
	[[17110.898,20.000999,7152.0342], "AFSHER - Müllhalde", 3],			
	[[19739.289,84.456001,7039.3818], "AFSHER - Vorort", 3],	

	[[8413.7051,75.995003,4741.9121], "AMIR - Roggenfarm", 3],
	[[7546.6426,330.72052,4276.3057], "AMIR - Vorort", 3],
	[[7100.375,205.996,4358.1411], "AMIR - Zentrum", 3],	

	[[16122.569,32.019001,10274.645], "ANYAKAR - Farm", 3],		
	[[17630.211,24.523001,9258.7217], "ANYAKAR - Razbula", 3],
	[[18975.689,107.10953,10472.63], "ANYAKAR - Zentrum", 3],
	
	[[8803.0381,147.004,10859.683], "BERG 447 - Dorf am Fluss", 3],
	[[8370.1621,166.897,10241.118], "BERG 447 - Farm", 3],
	[[5850.1001,257.987,12480.536], "BERG 447 - Gutshof", 3],	

	[[3918.4451,309.19699,12579.23], "KARIFT - Kloster", 3],
	[[4066.8589,318.78299,12007.814], "KARIFT - Markt", 3],
	[[4897.8799,294.69199,11731.737], "KARIFT - Zhapir", 3],

	[[9268.1875,79.203667,2733.282], "KINDUF-VORORT - Bergdorf", 3],	
	[[10446.508,16.156,3508.458], "KINDUF-VORORT - Fabrik", 3],	
	[[9414.8799,71.144997,2024.155], "KINDUF-VORORT - Plantage", 3],
	
	[[10824.78,8.1610003,5282.1431], "LOBORIBER - Brückenzollstation", 3],
	[[9892.0674,17.108999,5818.4199], "LOBORIBER - Dorf", 3],
	[[9906.6982,19.742001,4135.5879], "LOBORIBER - Gutshof", 3],
	
	[[6790.6421,222.763,9783.2529], "MAFARAZ - Fabrikruine", 3],	
	[[5156.1011,306.936,10447.979], "MAFARAZ - Zentrum", 3],
	[[5298.3979,297.74799,10668.623], "MAFARAZ - Militärstützpunkt", 3],

	[[3208.355,306.81601,13204.412], "MAYANKEL - Markt", 3],
	[[1694.911,354.733,13863.398], "MAYANKEL - Vorort", 3],
	[[1262.569,378.69601,14131.91], "MAYANKEL - Zentrum", 3],

	[[9377.8223,101.282,7257.8101], "MORUT - Gutshof", 3],	
	[[9452.5234,102.286,8117.8169], "MORUT - Kloster", 3],	
	[[9827.0918,42.441002,6880.0811], "MORUT - Plantage", 3],
	
	[[5462.021,577.83301,3112.448], "MOZARAT - Maisplantage", 3],	
	[[4060.564,353.185,860.51599], "MOZARAT - Militärstützpunkt", 3],
	[[5091.8501,656.401,3580.7859], "MOZARAT - Pferdezucht", 3],	
	
	[[15204.728,27.851,9897.4238], "PUESTO CROW - Dorf", 3],	
	[[15729.443,30.187,7360.6538], "PUESTO CROW - Farm", 3],
	[[13788.53,84.121002,9289.3086], "PUESTO CROW - Militärstützpunkt", 3],
	
    [[19603.641,119.199,18623.5], "TWO VILLAGES - Farm", 3],
	[[17955.738,204.56599,17866.248], "TWO VILLAGES - Kamir", 3], 	
	[[19792.105,102.59,19852.17], "TWO VILLAGES - Morar", 3],
	
	[[17608.352,266.52899,17344.199], "ZARATH - Farm", 3],
	[[16415.039,133.892,15091.021], "ZARATH - Vorort", 3],
	[[17381.906,75.157997,14744.738], "ZARATH - Zentrum", 3],
	
	[[14299.552,214.427,16057.993], "ZENTRALMASSIV - Getreidefarm", 3],	
	[[14831.616,152.981,14720.49], "ZENTRALMASSIV - Gutshof", 3],
	[[15103.037,136.435,14912.635], "ZENTRALMASSIV - Ziegenfarm", 3]
];

//East
GVAR(locations_east) =
[
    [[18935.775,25.888693,76.048752], "CSAT Basis", -1],
    [[7407.8369, 806.58386, 20363.465], "CSAT FOB Nordwest", -1],
	
	[[18091.543,20.764,5980.1558], "AROBSTER - Farm", 3],		
	[[17310.283,30.336,5802.2139], "AROBSTER - Funkstation", 3],	
	[[16430.639,27.238001,5259.2588], "AROBSTER - Vorort", 3],

	[[13378.828,47.847,1492.8719], "BAGDIR - Farm", 3],	
	[[15889.911,37.550999,3026.0071], "BAGDIR - Orfar", 3],	
	[[13300.72,60.081001,750.323], "BAGDIR - Zentrum", 3],

	[[13061.22,342.121,17243.729], "KALAE NOOWI - Alter Markt", 3],	
	[[13857.799,341.95001,17836.469], "KALAE NOOWI - Krankenhaus", 3],	
	[[13224.465,341.95001,17623.68], "KALAE NOOWI - Rathaus", 3],	
	
	[[12701.707,363.827,19051.424], "KALAE NOOWI-VORORT - Alte Zollstation", 3],		
	[[11445.58,341.944,17860.1], "KALAE NOOWI-VORORT - Militärstützpunkt", 3],	
	[[11699.795,371.78799,18698.762], "KALAE NOOWI-VORORT - Radarstation", 3],

	[[8857.5498,465.23999,16158.775], "KANDAR - Agrarstützpunkt", 3],
	[[8178.437,487.10599,16489.789], "KANDAR - Vorort", 3],
	[[8178.437,487.10599,16489.789], "KANDAR - Zentrum", 3],
	
	[[12097.607,22.16,2672.373], "KINDUF - Altstadt", 3],	
	[[10712.217,56.977001,1233.373], "KINDUF - Wohngebiet", 3],
	[[11227.072,26.485626,2922.957], "KINDUF - Zentrum", 3],

	[[7481.9082,236.00562,13179.352], "KUNARA - Farm", 3],
	[[9685.5479,365.711,14249.162], "KUNARA - Tunkuf", 3],
	
	[[2632.563,470.54001,16083.402], "LIMAR - Militärstützpunkt", 3],	
	[[5297.3291,355.745,14320.723], "LIMAR - Shoran", 3],		
	[[2632.563,470.54001,16083.402], "LIMAR - Zentrum", 3],
	
	[[11982.324,41.374001,8178.7598], "LIMARI - Bramar", 3],	
	[[10452.06,87.153,9220.6504], "LIMARI - Markt", 3], 
	[[10719.738,106.528,10137.334], "LIMARI - Stadt", 3], 	
	
	[[10265.45,118.021,10807.876], "MIKIS - Fabrik", 3], 
	[[9723.7607,144.66701,11374.897], "MIKIS - FOB", 3], 
	[[8959.6631,194.192,12642.534], "MIKIS - Vorort", 3],

	[[3931.7549,662.92603,17754.07], "NEFER - Martin FOB", 3],
	[[5681.7041,556.01099,17520.588], "NEFER - Sanatorium", 3],
	[[4746.3359,516.82544,16950.889], "NEFER - Zentrum", 3],

	[[11974.737,19.399,6103.4429], "ORCARIF - Fabrik", 3],
	[[12194.264,21.382999,7105.123], "ORCARIF - Gutshof", 3],
	[[11369.299,19.695,6671.3179], "ORCARIF - Stadt", 3],

	[[11804.004,264.52802,15441.887], "RAMIR - Farm", 3],		
	[[12073.88,266.5199,15363.937], "RAMIR - Vorort", 3],	
	[[12972.03,204.295,15228.911], "RAMIR - Zentrum", 3],
	
	[[11342.403,18.235001,3969.364], "SHEGARA - Farm", 3],		
	[[11563.351,17.761999,5054.0659], "SHEGARA - Klärwerk", 3],
	[[13365.775,27.288,4823.897], "SHEGARA - Kloster", 3],

	[[17509.607,49.071999,2780.6211], "TERUK - Fabrik", 3],	
	[[19978.061,64.254997,3540.7781], "TERUK - Markt", 3],	
	[[19218.775,67.762001,3373.76], "TERUK - Zentrum", 3],
	
	[[13017.315,13.555,3528.02], "TWO CAMPS - Hanfplantage", 3],
	[[13939.203,20.229,3359.49], "TWO CAMPS - Iban Camp", 3],
	[[15043.098,45.375999,4348.3789], "TWO CAMPS - Peloton Camp", 3]
];



GVAR(heavy_vehicles) = [
    "OPT_O_T_APC_Wheeled_02_rcws_ghex_F",             // MSE-3 Marid
    "OPT_O_APC_Wheeled_03_cannon_light_F",             // AFV-4 Gorgon (Leicht)
    "OPT_O_APC_Wheeled_03_cannon_F",                 // AFV-4 Gorgon
    "OPT_O_T_APC_Tracked_02_AA_ghex_F",                 // ZSU-39 Tigris
    "OPT_O_T_APC_Tracked_02_cannon_ghex_light_F",     // BTR-K Kamysh
    "OPT_O_T_APC_Tracked_02_cannon_ghex_F",             // BTR-K Kamysh (Titan)
    "OPT_O_T_MBT_02_cannon_ghex_F",                     // T-100 Varsuk
    "OPT_O_T_MBT_02_arty_ghex_F",                     // 2S9 Sochor 
//vanilla
    "OPT_O_APC_Wheeled_02_rcws_F",             // MSE-3 Marid
    "OPT_O_APC_Tracked_02_AA_F",                 // ZSU-39 Tigris
    "OPT_O_APC_Tracked_02_cannon_light_F",     // BTR-K Kamysh
    "OPT_O_APC_Tracked_02_cannon_F",             // BTR-K Kamysh (Titan)
    "OPT_O_MBT_02_cannon_F",                     // T-100 Varsuk
    "OPT_O_MBT_02_arty_F",                     // 2S9 Sochor 
        
    "OPT_B_APC_Tracked_01_rcws_F",                     // IFV-6c Panther
    "OPT_B_APC_Wheeled_01_cannon_light_F",             // AMV-7 Marshall (Leicht)
    "OPT_B_APC_Wheeled_01_cannon_F",                 // AMV-7 Marshall    
    "OPT_B_APC_Tracked_01_AA_F",                     // IFV-6a Cheetah
    "OPT_B_APC_tracked_03_cannon_F",                 // FV-720 Mora    
    "OPT_B_MBT_01_cannon_F",                         // M2A4 Slammer
    "OPT_B_MBT_01_TUSK_F",                             // M2A4 SlammerUp
    "OPT_B_MBT_03_cannon_F",                         // MBT-52 Kuma,  fliegt raus
    "OPT_B_MBT_01_Arty_F",                             // M4 Scorcher
    "OPT_B_MBT_01_mlrs_F"    
];


/* List of triggers in Editor for beam functionality */
GVAR(beam_trigger) = [
	nato_trigger_beam,
	nato_trigger_beam_1,
	csat_trigger_beam_4,
	csat_trigger_beam_3
];
