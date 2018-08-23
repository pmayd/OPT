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
// Stufe = -1-0-1-2 // -1 nach Waffenruhe wählbar, 0 Nicht Wählbar,  1 Inf,  2 inf + leichte Fahrzeuge,  3 inf + Schwere Fahrzeuge
//
// Bsp [[Position], Name, Stufe], 


//West
GVAR(locations_west) =
[
    [[4713.8179, 8.9878902, 2573.408], "NATO Basis", -1],
    [[4380.3735,3.0014389,2251.5574], "NATO Marinebasis", -1],

	[[7147.27, 9.9895916, 2609.0459], "Chernogorsk - Zentrum", 1], 
	[[6272.6069, 76.666931, 3729.7595], "Chernogorsk - Farm", 1], 
	[[5879.0449, 71.153656, 3868.5938], "Chernogorsk - Vorort", 1],

	[[10283.505, 11.447056, 1960.7837], "Elektrozavodsk - Zentrum", 1], 
	[[8616.6045, 9.9415283, 2436.3369], "Elektrozavodsk - Vorort", 1], 
	[[8161.9985, 14.426171, 3333.8484], "Elektrozavodsk - Prigorodky", 1], 

	[[11989.029, 10.129433, 3529.2573], "Kamyshovo - Zentrum", 1], 
	[[12465.595, 6.8708162, 3336.8975], "Kamyshovo - Heikos Ferienhaus", 1], 
	[[13360.739, 15.423439, 2758.8049], "Kamyshovo - Skalisty Fischerdorf", 1], 

	[[3615.5242, 356.65347, 6311.3462], "Pass Sosnovy - Green Mountain", 3], 
	[[2916.1772, 371.79553, 6677.3145], "Pass Sosnovy - Bernhards Ziegenfarm", 3], 
	[[2092.9773, 277.4227, 7377.126], "Pass Sosnovy - Myshkino", 3], 

	[[4916.1128, 322.12228, 5707.3896], "Pulkovo - Zentrum", 1], 
	[[5797.9277, 132.39203, 4831.9346], "Pulkovo - Nadezhdino", 1], 
	[[6853.4727,335.94174,4581.9102], "Pulkovo - Pumas Artistellung", 1], 

	[[4437.2344, 307.31317, 6331.7627], "Rogovo - Pogorevka", 1], 

	[[6479.1089, 319.7092, 6101.188], "Vyshnoye - Zentrum", 2], 
	[[6612.2114, 379.93857, 5560.7109], "Vyshnoye - Burg Zub", 2], 
	[[7569.0503, 213.82239, 5037.8604], "Vyshnoye - Mogilevka", 2],

	[[2662.093, 206.0836, 5320.8774], "Zelenogorsk - Zentrum", 1], 
	[[4296.9399, 236.64867, 4697.9004], "Zelenogorsk - Kozlovka", 1], 
	[[3372.7732, 248.37906, 4853.2368], "Zelenogorsk - Drozhino", 1] 
];

//East
GVAR(locations_east) =
[
    [[12097.098, 158.91089, 12648.875], "CSAT Basis", -1],
    [[14182.087, 2.1730125, 12250.548], "CSAT Marinebasis", -1],
	
	[[4663.7095, 342.97681, 9776.4922], "Flughafen - Kommandoposten", 1], 
	[[4663.3428, 342.97681, 10302.391], "Flughafen - El Locos Garage", 1], 
	[[4273.0098, 342.97681, 10904.86], "Flughafen - Trainingszentrum", 1],
	
	[[12788.279, 9.9679699, 9531.6094], "Berezino - Sägewerk", 1], 
	[[12383.195, 16.064194, 9438.915], "Berezino - Vorort", 1], 
	[[12177.619, 16.071527, 9803.8301], "Berezino - Stützpunkt Wiesl", 1], 

	[[10532.233, 287.76843, 12226.398], "Black Mountain - Burg Cune", 1], 
	[[10007.012, 267.2308, 11570.498], "Black Mountain - Alte Funkstation", 1], 
	[[10709.046, 153.36369, 10842.336], "Black Mountain - Alter Rastplatz", 1], 

	[[7789.5605, 344.76285, 10291.846], "Devils Castle - Ausgrabung", 3], 
	[[7320.5308, 297.89755, 11015.245], "Devils Castle - Absturzstelle", 3], 
	[[6877.145, 392.68875, 11580.139], "Devils Castle - Burgruine", 3], 

	[[10260.692, 146.3904, 9782.9502], "Dubrovka - Badis Landhaus", 1], 
	[[9909.4971, 168.31728, 10448.764], "Dubrovka - Militärlager", 1], 
	[[10509.356, 122.56812, 9783.4551], "Dubrovka - Gemeindehaus", 1], 

	[[9554.4932, 293.54071, 8753.8428], "Gorka - Zentrum", 1], 
	[[9831.2305, 287.26248, 8704.7109], "Gorka - Kaktus Schafschur", 1], 
	[[8573.1377, 378.91171, 9618.3213], "Gorka - FOB Schredder", 1], 

	[[7190.7236, 381.09818, 8952.0078], "Grishino - Wodka-Farm", 1], 
	[[5959.6548, 273.3353, 10430.288], "Grishino - Zentrum", 1], 
	[[5522.1758, 275.22858, 11094.381], "Grishino - Radarstation dutchmill", 1], 

	[[8501.1631, 363.09842, 6581.9077], "Guglovo - Zentrum", 1], 
	[[7744.2329, 315.65472, 6874.2544], "Guglovo - Farm", 1], 
	[[7019.8843, 297.86713, 7630.8462], "Guglovo - Novy Sobor", 1], 
	
	[[8704.6396, 219.46088, 11605.145], "Gvozdno - Pferdezucht", 1], 
	[[8510.7109, 185.3669, 11891.032], "Gvozdno - Zentrum", 1], 
	[[9189.6787, 267.48444, 11054.729], "Gvozdno - sleepwalkers Villa", 1], 

	[[2803.2329, 276.33618, 9802.4512], "Lopatino - Zentrum", 1], 
	[[2152.7996,263.89948,10882.993], "Lopatino - Alte Zollstation", 1], 
	
	[[12968.386, 9.8480625, 8097.8721], "Nizhnoye - Schweinezucht", 1], 
	[[12235.104, 57.20871, 8510.1689], "Nizhnoye - Vorort", 1], 
	[[11951.082, 74.279335, 8831.0879], "Nizhnoye - Müllhalde", 1], 

	[[4896.9888, 194.49538, 12497.397], "Petrovka - Zentrum", 2], 
	[[4249.6821, 373.35806, 11537.811], "Petrovka - Forschungskomplex", 2], 
	[[1932.5959, 245.97969, 12375.8], "Petrovka - Skalka Sägewerk", 2], 

	[[10667.194, 222.78603, 8204.21], "Polana - Zentrum", 3], 
	[[11360.828, 229.46248, 7498.981], "Polana - Fabrik", 3], 
	[[12032.386, 199.59885, 7282.8027], "Polana - Orlovets", 3], 

	[[9178.7568, 222.90584, 3745.874], "Pusta - Zentrum", 1], 
	[[10343.482, 16.177559, 2607.2998], "Pusta - Kraftwerk", 1], 
	[[10354.342, 12.808233, 2343.188], "Pusta - Kirche des oldeurope", 1], 

	[[4807.7271, 268.57898, 6740.1064], "Rogovo - Zentrum", 1], 
	
	[[11121.455, 88.226479, 6611.583], "Shakovka - Dolina", 1], 
	[[9687.9326, 223.50797, 6471.4492], "Shakovka - Zentrum", 1], 
	[[8757.7051, 321.04938, 7773.2549], "Shakovka - Radarstation Fox", 1],

	[[13298.943, 9.2443905, 6396.6406], "Solnichniy - Zentrum", 2], 
	[[13066.41, 9.9139128, 6255.4561], "Solnichniy - Zementwerk", 2], 
	[[12122.751, 49.1856, 6327.6328], "Solnichniy - Vorort", 2], 

	[[6184.2197, 305.27301, 7791.6885], "Stary Sobor - Zentrum", 1], 
	[[5396.8032, 335.54684, 8694.8828], "Stary Sobor - Kabanino", 1], 
	
	[[11209.36, 251.1118, 4662.9258], "Staroye - Feste Rog", 1], 
	[[10054.29, 249.34822, 5446.3052], "Staroye - Zentrum", 1], 
	[[8302.332, 293.41986, 5908.5493], "Staroye - Ruinenstadt Kumyrna", 1], 

	[[3940.3054, 330.64813, 8846.7256], "Vybor - Zentrum", 1], 
	[[4268.9116, 315.39127, 8075.4321], "Vybor - Checkpoint Oppa", 1], 
	
	[[12782.458, 170.81409, 4472.9751], "Tulga - Zentrum", 1], 
	[[12301.782,72.0765,5189.1621], "Tulga - Holzfäller-Lager", 1], 
	[[11239.631, 266.51291, 5518.7339], "Tulga - Msta", 1] 
];


GVAR(heavy_vehicles) = [
	"OPT_O_T_APC_Wheeled_02_rcws_ghex_F", 			// MSE-3 Marid
	"OPT_O_APC_Wheeled_03_cannon_light_F", 			// AFV-4 Gorgon (Leicht)
	"OPT_O_APC_Wheeled_03_cannon_F", 				// AFV-4 Gorgon
	"OPT_O_T_APC_Tracked_02_AA_ghex_F", 			    // ZSU-39 Tigris
	"OPT_O_T_APC_Tracked_02_cannon_ghex_light_F", 	// BTR-K Kamysh
	"OPT_O_T_APC_Tracked_02_cannon_ghex_F", 		    // BTR-K Kamysh (Titan)
	"OPT_O_T_MBT_02_cannon_ghex_F", 				    // T-100 Varsuk
	"OPT_O_T_MBT_02_arty_ghex_F", 				    // 2S9 Sochor 
//vanilla
	"OPT_O_APC_Wheeled_02_rcws_F", 			// MSE-3 Marid
	"OPT_O_APC_Tracked_02_AA_F", 			    // ZSU-39 Tigris
	"OPT_O_APC_Tracked_02_cannon_light_F", 	// BTR-K Kamysh
	"OPT_O_APC_Tracked_02_cannon_F", 		    // BTR-K Kamysh (Titan)
	"OPT_O_MBT_02_cannon_F", 				    // T-100 Varsuk
	"OPT_O_MBT_02_arty_F", 				    // 2S9 Sochor 
		
	"OPT_B_APC_Tracked_01_rcws_F", 					// IFV-6c Panther
	"OPT_B_APC_Wheeled_01_cannon_light_F", 			// AMV-7 Marshall (Leicht)
	"OPT_B_APC_Wheeled_01_cannon_F", 				// AMV-7 Marshall	
	"OPT_B_APC_Tracked_01_AA_F", 					// IFV-6a Cheetah
	"OPT_B_APC_tracked_03_cannon_F", 				// FV-720 Mora	
	"OPT_B_MBT_01_cannon_F", 						// M2A4 Slammer
	"OPT_B_MBT_01_TUSK_F", 						    // M2A4 SlammerUp
	"OPT_B_MBT_03_cannon_F", 						// MBT-52 Kuma,  fliegt raus
	"OPT_B_MBT_01_Arty_F", 						    // M4 Scorcher
	"OPT_B_MBT_01_mlrs_F"	
];



	
	