/*
Needed Mods:
- RHS AFRF
- 3CB Factions

Optional Mods:
- None
*/

// Enemy infantry classes
opfor_officer = "UK3CB_TKA_O_WAR";								  		//Officer
opfor_squad_leader = "UK3CB_TKA_O_SL";									//Squad Leader
opfor_team_leader = "UK3CB_TKA_O_TL";									//Team Leader
opfor_sentry = "UK3CB_TKA_O_RIF_2";										//Rifleman (Lite)
opfor_rifleman = "UK3CB_TKA_O_RIF_1";									//Rifleman
opfor_rpg = "UK3CB_TKA_O_LAT";											//Rifleman (LAT)
opfor_grenadier = "UK3CB_TKA_O_GL";										//Grenadier
opfor_machinegunner = "UK3CB_TKA_O_AR";									//Autorifleman
opfor_heavygunner = "UK3CB_TKA_O_MG";									//Heavy Gunner
opfor_marksman = "UK3CB_TKA_O_MK";										//Marksman
opfor_sharpshooter = "UK3CB_TKA_O_SPOT";								//Sharpshooter
opfor_sniper = "UK3CB_TKA_O_SNI";										//Sniper
opfor_at = "UK3CB_TKA_O_AT";											//AT Specialist
opfor_aa = "UK3CB_TKA_O_AA";											//AA Specialist
opfor_medic = "UK3CB_TKA_O_MD";											//Combat Life Saver
opfor_engineer = "UK3CB_TKA_O_ENG";										//Engineer
opfor_paratrooper = "UK3CB_TKA_O_SF_RIF_1";								//Paratrooper

// Enemy vehicles used by secondary objectives.
opfor_mrap = "UK3CB_TKA_O_BRDM2_UM";									//BRDM-2 Armed
opfor_mrap_armed = "UK3CB_TKA_O_BRDM2";									//BRDM-2 Armed
opfor_transport_helo = "UK3CB_TKA_O_Mi8";						    	//Mi-8MT (Cargo)
opfor_transport_truck = "UK3CB_TKA_O_Ural";								//Ural-3151 Transport (Covered)
opfor_ammobox_transport = "UK3CB_TKA_O_Ural_Open";						//Ural-3151 Transport (Open) -> Has to be able to transport resource crates!
opfor_fuel_truck = "UK3CB_TKA_O_Ural_Fuel";								//Ural-3151 Fuel
opfor_ammo_truck = "UK3CB_TKA_O_Ural_ammo";								//GAZ-66 Ammo
opfor_fuel_container = "UK3CB_TKA_O_ZsuTank";							//Taru Fuel Pod
opfor_ammo_container = "UK3CB_TKA_O_Ural_ammo";							//Taru Ammo Pod
opfor_flag = "Flag_TKA";												//Takistan Flag

/* Adding a value to these arrays below will add them to a one out of however many in the array, random pick chance.
Therefore, adding the same value twice or three times means they are more likely to be chosen more often. */

/* Militia infantry. Lightweight soldier classnames the game will pick from randomly as sector defenders.
Think of them like garrison or military police forces, which are more meant to control the local population instead of fighting enemy armies. */
militia_squad = [
	"UK3CB_TKM_O_RIF_1",												//Rifleman
	"UK3CB_TKM_O_RIF_1",												//Rifleman
	"UK3CB_TKM_O_LAT",													//Rifleman (AT)
	"UK3CB_TKM_O_AR",													//Machinegunner
	"UK3CB_TKM_O_MK",													//Marksman
	"UK3CB_TKM_O_MD",													//Medic
	"UK3CB_TKM_O_ENG",													//Engineer
	"UK3CB_TKM_O_AA",													//AA Specialist
	"UK3CB_TKM_O_AT",													//AT Specialist
	"UK3CB_TKM_O_GL"													//Grenadier
];

// Militia vehicles. Lightweight vehicle classnames the game will pick from randomly as sector defenders.
militia_vehicles = [
	"UK3CB_TKM_O_LR_SF_M2",												//SF-Land-Rover (M2)
	"UK3CB_TKM_O_LR_SF_AGS30",											//SF-Land-Rover (AGS30)
	"UK3CB_TKM_O_Hilux_M2",												//Hilux (M2)
	"UK3CB_TKM_O_Hilux_Dshkm",											//Hilux (Dshkm)
	"UK3CB_TKM_O_Hilux_Spg9",											//Hilux (Spg9)
	"UK3CB_TKM_O_Hilux_GMG",											//Hilux (AGS30)
	"UK3CB_TKM_O_Hilux_Zu23_Front",										//Hilux (Zu23)
	"UK3CB_TKM_O_Hilux_Mortar",											//Hilux (Mortar)
	"UK3CB_TKM_O_BRDM2",												//BRDM2
	"UK3CB_TKM_O_BRDM2_ATGM"											//BRDM2-Konkurs
];

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels).
opfor_vehicles = [
	"UK3CB_TKA_O_BRDM2",												//BRDM2
	"UK3CB_TKA_O_BRDM2_ATGM",											//BRDM2 ATGM
	"UK3CB_TKA_O_BTR80",												//BTR80
	"UK3CB_TKA_O_BTR80a",												//BTR80a
	"UK3CB_TKA_O_BMP2",													//BMP2
	"UK3CB_TKA_O_Hilux_Metis",											//Hilux (ATGM)
	"UK3CB_TKA_O_ZsuTank",												//ZSU-23-4
	"UK3CB_TKA_O_T72B",													//T72AV
	"UK3CB_TKA_O_T72BM"													//T72B
];

// All enemy vehicles that can spawn as sector defenders and patrols but at a lower enemy combat readiness (aggression levels).
opfor_vehicles_low_intensity = [
	"UK3CB_TKA_O_GAZ_Vodnik_PKT",										//Vodnik
	"UK3CB_TKA_O_Hilux_M2",												//Hilux (M2)
	"UK3CB_TKA_O_Hilux_Spg9",											//Hilux (Spg9)
	"UK3CB_TKA_O_Hilux_GMG",											//Hilux (AGS30)
	"UK3CB_TKA_O_Hilux_Zu23_Front",										//Hilux (Zu23)
	"UK3CB_TKA_O_BTR70",												//BTR70
	"UK3CB_TKA_O_BRDM2",												//BRDM2
	"UK3CB_TKA_O_BMP1"													//BMP1
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at high enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles = [
	"UK3CB_TKA_O_BRDM2",												//BRDM2
	"UK3CB_TKA_O_BRDM2_ATGM",											//BRDM2 ATGM
	"UK3CB_TKA_O_BTR80",												//BTR80
	"UK3CB_TKA_O_BTR80a",												//BTR80a
	"UK3CB_TKA_O_BMP2",													//BMP2
	"UK3CB_TKA_O_ZsuTank",												//ZSU-23-4
	"UK3CB_TKA_O_T72B",													//T72AV
	"UK3CB_TKA_O_T72BM",												//T72B
	"UK3CB_TKA_O_C47_Late",												//C-47 Skytrain
	"UK3CB_TKA_O_Bell412_Armed_dynamicLoadout",							//Bell 412 (DAGR)
	"UK3CB_TKA_O_Bell412_Armed_AT",										//Bell 412 (TOW)
	"UK3CB_TKA_O_MIG21_AT",												//MiG-21 (AGM)
	"UK3CB_TKA_O_Su25SM_KH29",											//Su-25SM (AGM)
	"UK3CB_TKA_O_MIG21_AA"												//MiG-21 (AA)
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at lower enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles_low_intensity = [
	"UK3CB_TKA_O_Hilux_M2",												//Hilux (M2)
	"UK3CB_TKA_O_Hilux_Spg9",											//Hilux (Spg9)
	"UK3CB_TKA_O_Hilux_GMG",											//Hilux (AGS30)
	"UK3CB_TKA_O_Hilux_Zu23_Front",										//Hilux (Zu23)
	"UK3CB_TKA_O_T55",													//T-55A
	"UK3CB_TKA_O_BTR70",												//BTR70
	"UK3CB_TKA_O_BRDM2",												//BRDM2
	"UK3CB_TKA_O_BMP1",													//BMP1
	"UK3CB_TKA_O_UH1H_GUNSHIP",											//UH-1H (FFAR)
	"UK3CB_TKA_O_MIG21_AT",												//MiG-21 (AGM)
	"UK3CB_TKA_O_MIG21_AA",												//MiG-21 (AA)
	"UK3CB_TKA_O_MIG21_CAS"												//MiG-21 (Rockets)
];

/* All vehicles that spawn within battlegroups (see the above 2 arrays) and also hold 8 soldiers as passengers.
If something in this array can't hold all 8 soldiers then buggy behaviours may occur.	*/
opfor_troup_transports = [
	"UK3CB_TKA_O_UH1H_GUNSHIP",											//Ural-4320 Transport
	"UK3CB_TKA_O_BTR70",												//BTR70
	"UK3CB_TKA_O_BTR80",												//BTR80
	"UK3CB_TKA_O_BTR80a",												//BTR80a
	"UK3CB_TKA_O_BMP1",													//BMP1
	"UK3CB_TKA_O_BMP2",													//BMP2
	"UK3CB_TKA_O_BRDM2",												//BRDM2
	"UK3CB_TKA_O_GAZ_Vodnik_PKT",										//Vodnik
	"UK3CB_TKA_O_C47_Late"												//C-47 Skytrain
];

// Enemy rotary-wings that will need to spawn in flight.
opfor_choppers = [
	"UK3CB_TKA_O_UH1H_GUNSHIP",											//UH-1H (FFAR)
	"UK3CB_TKA_O_Bell412_Armed_AT",										//Bell 412 (TOW)
	"UK3CB_TKA_O_Bell412_Armed_dynamicLoadout"							//Bell 412 (DAGR)
];

// Enemy fixed-wings that will need to spawn in the air.
opfor_air = [
	"UK3CB_TKA_O_MIG21_CAS",												//MiG-21 (Rockets)
	"UK3CB_TKA_O_MIG21_AA",												//MiG-21 (AA)
	"UK3CB_TKA_O_MIG21_AT",												//MiG-21 (AGM)
	"UK3CB_TKA_O_Su25SM_KH29"											//Su-25SM (AGM)
];
