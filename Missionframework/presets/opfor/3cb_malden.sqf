/*
Needed Mods:
- RHS AFRF
- 3CB Factions

Optional Mods:
- None
*/

// Enemy infantry classes
opfor_officer = "UK3CB_MDF_O_JNR_OFF";							  		//Officer
opfor_squad_leader = "UK3CB_MDF_O_SL";									//Squad Leader
opfor_team_leader = "UK3CB_MDF_O_TL";									//Team Leader
opfor_sentry = "UK3CB_MDF_O_DEM";										//Rifleman (Lite)
opfor_rifleman = "UK3CB_MDF_O_RIF_1";									//Rifleman
opfor_rpg = "UK3CB_MDF_O_LAT";											//Rifleman (LAT)
opfor_grenadier = "UK3CB_MDF_O_GL";										//Grenadier
opfor_machinegunner = "UK3CB_MDF_O_AR";									//Autorifleman
opfor_heavygunner = "UK3CB_MDF_O_MG";									//Heavy Gunner
opfor_marksman = "UK3CB_MDF_O_MK";										//Marksman
opfor_sharpshooter = "UK3CB_MDF_O_SPOT";								//Sharpshooter
opfor_sniper = "UK3CB_MDF_O_SNI";										//Sniper
opfor_at = "UK3CB_MDF_O_AT";											//AT Specialist
opfor_aa = "UK3CB_MDF_O_AA";											//AA Specialist
opfor_medic = "UK3CB_MDF_O_MD";											//Combat Life Saver
opfor_engineer = "UK3CB_MDF_O_ENG";										//Engineer
opfor_paratrooper = "UK3CB_MDF_O_SF_RIF_1";								//Paratrooper

// Enemy vehicles used by secondary objectives.
opfor_mrap = "UK3CB_MDF_O_M1151";										//M1151
opfor_mrap_armed = "UK3CB_MDF_O_M1151_OGPK_M2";							//M1151 (M2)
opfor_transport_helo = "UK3CB_MDF_O_UH1H_M240";						   	//UH-1H
opfor_transport_truck = "UK3CB_MDF_O_MTVR_Closed";						//MTVR (Covered)
opfor_ammobox_transport = "UK3CB_MDF_O_MTVR_Recovery";					//MTVR Recovery -> Has to be able to transport resource crates!
opfor_fuel_truck = "UK3CB_MDF_O_MTVR_Refuel";							//MTVR Fuel
opfor_ammo_truck = "UK3CB_MDF_O_MTVR_Reammo";							//MTVR Ammo
opfor_fuel_container = "UK3CB_O_G_ZsuTank";								//ZSU-23-4
opfor_ammo_container = "UK3CB_MDF_O_MTVR_Reammo";						//MTVR Ammo
opfor_flag = "Flag_MAL";												//Takistan Flag

/* Adding a value to these arrays below will add them to a one out of however many in the array, random pick chance.
Therefore, adding the same value twice or three times means they are more likely to be chosen more often. */

/* Militia infantry. Lightweight soldier classnames the game will pick from randomly as sector defenders.
Think of them like garrison or military police forces, which are more meant to control the local population instead of fighting enemy armies. */
militia_squad = [
	"O_G_Soldier_F",													//Rifleman
	"O_G_Soldier_lite_F",												//Rifleman
	"O_G_Soldier_LAT_F",												//Rifleman (AT)
	"O_G_Soldier_AR_F",													//Machinegunner
	"O_G_Sharpshooter_F",												//Marksman
	"O_G_medic_F",														//Medic
	"O_G_engineer_F",													//Engineer
	"O_G_officer_F",													//AA Specialist
	"O_G_Soldier_LAT2_F",												//AT Specialist
	"O_G_Soldier_GL_F"													//Grenadier
];

// Militia vehicles. Lightweight vehicle classnames the game will pick from randomly as sector defenders.
militia_vehicles = [
	"UK3CB_O_G_LandRover_SF_M2",										//SF-Land-Rover (M2)
	"UK3CB_O_G_LandRover_SF_AGS30",										//SF-Land-Rover (AGS30)
	"UK3CB_O_G_Hilux_Metis",											//Hilux (ATGM)
	"UK3CB_O_G_Hilux_M2",												//Hilux (M2)
	"UK3CB_O_G_Hilux_Spg9",												//Hilux (Spg9)
	"UK3CB_O_G_Hilux_GMG",												//Hilux (AGS30)
	"UK3CB_O_G_Hilux_Zu23_Front",										//Hilux (Zu23)
	"UK3CB_O_G_Hilux_Mortar",											//Hilux (Mortar)
	"UK3CB_O_G_Hilux_Igla_Chair"										//Hilux (Igla)
];

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels).
opfor_vehicles = [
	"UK3CB_MDF_O_M1151_OGPK_M240",										//M1151 (M240)
	"UK3CB_MDF_O_M1151_OGPK_M2",										//M1151 (M2)
	"UK3CB_MDF_O_M1151_OGPK_MK19",										//M1151 (MK19)
	"UK3CB_MDF_O_M1025_TOW",											//M1025 (TOW)
	"UK3CB_MDF_O_M113_M2",												//M113 (M2)
	"UK3CB_MDF_O_Warrior_Cage",											//FV510 Warrior (Cage)
	"UK3CB_O_G_ZsuTank",												//ZSU-23-4
	"UK3CB_MDF_O_M60A3"													//M60A3
];

// All enemy vehicles that can spawn as sector defenders and patrols but at a lower enemy combat readiness (aggression levels).
opfor_vehicles_low_intensity = [
	"UK3CB_MDF_O_M1151_OGPK_M240",										//M1151 (M240)
	"UK3CB_MDF_O_M1151_OGPK_M2",										//M1151 (M2)
	"UK3CB_MDF_O_M1025_MK19",											//M1025 (MK19)
	"UK3CB_MDF_O_M1025_M2",												//M1025 (M2)
	"UK3CB_MDF_O_M1025_TOW",											//M1025 (TOW)
	"UK3CB_MDF_O_MTVR_Zu23",											//MTVR (ZU-23)
	"UK3CB_MDF_O_MB4WD_LMG",											//Jeep Wrangler (M249)
	"UK3CB_MDF_O_M113_M2",												//M113 (M2)
	"UK3CB_MDF_O_M113_MK19"												//M113 (MK19)
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at high enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles = [
	"UK3CB_MDF_O_M1151_OGPK_M240",										//M1151 (M240)
	"UK3CB_MDF_O_M1151_OGPK_M2",										//M1151 (M2)
	"UK3CB_MDF_O_M1151_OGPK_MK19",										//M1151 (MK19)
	"UK3CB_MDF_O_M1025_TOW",											//M1025 (TOW)
	"UK3CB_MDF_O_Warrior_Cage",											//FV510 Warrior (Cage)
	"UK3CB_MDF_O_Warrior",												//FV510 Warrior
	"UK3CB_MDF_O_MTVR_Closed",											//MTVR (Covered)
	"UK3CB_MDF_O_M113_M2",												//M113 (M2)
	"UK3CB_MDF_O_M113_MK19",												//M113 (MK19)
	"UK3CB_MDF_O_M60A3",												//M60A3
	"UK3CB_MDF_O_Bell412_Armed_dynamicLoadout",							//Bell 412 (DAGR)
	"UK3CB_MDF_O_Bell412_Armed_AT",										//Bell 412 (TOW)
	"UK3CB_MDF_O_UH1H_GUNSHIP_NAVY",									//UH-1H Gunship
	"UK3CB_MDF_O_C130J_NAVY",											//C-130J Super Hercules
	"UK3CB_MDF_O_Mystere_AT1_NAVY",										//MD454 Mystere (AGM)
	"UK3CB_MDF_O_Mystere_CAS1_NAVY",									//MD454 Mystere (CAS)
	"UK3CB_MDF_O_Mystere_AA1_NAVY"										//MD454 Mystere (AA)
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at lower enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles_low_intensity = [
	"UK3CB_MDF_O_M1151_OGPK_M240",										//M1151 (M240)
	"UK3CB_MDF_O_M1151_OGPK_M2",										//M1151 (M2)
	"UK3CB_MDF_O_M1151_OGPK_MK19",										//M1151 (MK19)
	"UK3CB_MDF_O_MTVR_Closed",											//MTVR (Covered)	
	"UK3CB_MDF_O_Warrior",												//FV510 Warrior
	"UK3CB_MDF_O_M60A3",												//M60A3
	"UK3CB_MDF_O_M113_M2",												//M113 (M2)
	"UK3CB_MDF_O_UH1H_GUNSHIP_NAVY",									//UH-1H Gunship
	"UK3CB_MDF_O_Mystere_CAS1_NAVY"										//MD454 Mystere (AA)
];

/* All vehicles that spawn within battlegroups (see the above 2 arrays) and also hold 8 soldiers as passengers.
If something in this array can't hold all 8 soldiers then buggy behaviours may occur.	*/
opfor_troup_transports = [
	"UK3CB_MDF_O_UH1H_GUNSHIP_NAVY",									//UH-1H Gunship
	"UK3CB_MDF_O_M113_M2",												//M113 (M2)
	"UK3CB_MDF_O_M113_MK19",												//M113 (MK19)
	"UK3CB_MDF_O_MTVR_Closed",											//MTVR (Covered)
	"UK3CB_MDF_O_C130J_NAVY"											//C-130J Super Hercules
];

// Enemy rotary-wings that will need to spawn in flight.
opfor_choppers = [
	"UK3CB_MDF_O_UH1H_GUNSHIP_NAVY",									//UH-1H Gunship
	"UK3CB_MDF_O_Bell412_Armed_dynamicLoadout",							//Bell 412 (DAGR)
	"UK3CB_MDF_O_Bell412_Armed_AT"										//Bell 412 (TOW)
];

// Enemy fixed-wings that will need to spawn in the air.
opfor_air = [
	"UK3CB_MDF_O_C130J_NAVY",											//C-130J Super Hercules
	"UK3CB_MDF_O_Mystere_AT1_NAVY",										//MD454 Mystere (AGM)
	"UK3CB_MDF_O_Mystere_CAS1_NAVY",									//MD454 Mystere (CAS)
	"UK3CB_MDF_O_Mystere_AA1_NAVY"										//MD454 Mystere (AA)
];
