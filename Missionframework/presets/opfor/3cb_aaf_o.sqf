/*
    Needed Mods:
    - None

    Optional Mods:
    - None
*/

// Enemy infantry classes
opfor_officer = "O_AAF_Officer_WEST_01";                                // Officer
opfor_squad_leader = "O_AAF_Section_Leader_WEST_01";                    // Squad Leader
opfor_team_leader = "O_AAF_Team_Leader_WEST_01";                        // Team Leader
opfor_sentry = "O_AAF_Junior_Officer_WEST_01";                          // Rifleman (Lite)
opfor_rifleman = "O_AAF_Rifleman_HK416_WEST_01";                        // Rifleman
opfor_rpg = "O_AAF_LAT_Rifleman_WEST_01";                               // Rifleman (LAT)
opfor_grenadier = "O_AAF_Grenadier_WEST_01";                            // Grenadier
opfor_machinegunner = "O_AAF_Automatic_Rifleman_WEST_01";               // Autorifleman
opfor_heavygunner = "O_AAF_Machine_Gunner_WEST_01";                     // Heavy Gunner
opfor_marksman = "O_AAF_Marksman_WEST_01";                              // Marksman
opfor_sharpshooter = "O_AAF_Army_Sniper_WEST_01";                       // Sharpshooter
opfor_sniper = "O_AAF_SF_Sniper_WEST_01";                               // Sniper
opfor_at = "O_AAF_Anti_tank_MAAWS_WEST_01";                             // AT Specialist
opfor_aa = "O_AAF_Anti_Air_Stinger_WEST_01";                            // AA Specialist
opfor_medic = "O_AAF_Medic_WEST_01";                                    // Combat Life Saver
opfor_engineer = "O_AAF_Engineer_WEST_01";                              // Engineer
opfor_paratrooper = "O_AAF_SF_LAT_Rifleman_WEST_01";                    // Paratrooper

// Enemy vehicles used by secondary objectives.
opfor_mrap = "O_AAF_M1025A2_Unarmed_WEST_01";                           // M1025 HMMWV
opfor_mrap_armed = "O_AAF_M1025A2_HMG_WEST_01";                         // M1025 HMMWV M2
opfor_transport_helo = "O_AAF_UH_60M_Armed_WEST_01";                    // UH-60 Black Hawk
opfor_transport_truck = "O_AAF_MTVR_Closed_WEST_01";                    // MTVR
opfor_ammobox_transport = "O_AAF_M977_Open_WEST_01";                    // M977A4 Recovery -> Has to be able to transport resource crates!
opfor_fuel_truck = "O_AAF_MTVR_Fuel_WEST_01";                           // M977A4 Fuel
opfor_ammo_truck = "O_AAF_MTVR_Ammo_WEST_01";                           // M977A4 Ammo
opfor_fuel_container = "O_AAF_MTVR_Fuel_WEST_01";                       // MTVR Refuel
opfor_ammo_container = "O_AAF_MTVR_Ammo_WEST_01";                       // MTVR Reammo
opfor_flag = "Flag_AAF_F";                                              // Flag

/* Adding a value to these arrays below will add them to a one out of however many in the array, random pick chance.
Therefore, adding the same value twice or three times means they are more likely to be chosen more often. */

/* Militia infantry. Lightweight soldier classnames the game will pick from randomly as sector defenders.
Think of them like garrison or military police forces, which are more meant to control the local population instead of fighting enemy armies. */
militia_squad = [
    "O_AAF_Rifleman_HK416_WEST_01",                                      // Rifleman
    "O_AAF_Rifleman_HK416_WEST_01",                                      // Rifleman
    "O_AAF_Junior_Officer_WEST_01",                                      // Platoon Leader
    "O_AAF_Section_Leader_WEST_01",                                      // Squad Leader
    "O_AAF_LAT_Rifleman_WEST_01",                                        // Rifleman (AT)
    "O_AAF_Automatic_Rifleman_WEST_01",                                  // Autorifleman
    "O_AAF_Marksman_WEST_01",                                            // Marksman
    "O_AAF_Medic_WEST_01",                                               // Medic
    "O_AAF_Engineer_WEST_01"                                             // Engineer
];

// Militia vehicles. Lightweight vehicle classnames the game will pick from randomly as sector defenders. Can also be empty for only infantry milita.
militia_vehicles = [
    "O_AAF_Land_Rover_110_HMG_WEST_01",                                  // Land Rover M2
    "O_AAF_Land_Rover_110_HMG_WEST_01",                                  // Land Rover M2
    "O_AAF_M1025A2_HMG_WEST_01",                                         // M1025 HMMWV M2
    "O_AAF_M1025A2_HMG_WEST_01"                                          // M1025 HMMWV M2
];

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels).
opfor_vehicles = [
    "O_AAF_M1025A2_HMG_WEST_01",                                         // M1025 HMMWV M2
    "O_AAF_M1025A2_GMG_WEST_01",                                         // M1025 HMMWV M2
    "O_AAF_M1117_Guardian_WEST_01",                                      // M1117 Guardian
    "O_AAF_LAV_25_WEST_01",                                              // LAV-25
    "O_AAF_AAVP_7A1_WEST_01",                                            // AAV7
    "UK3CB_AAF_O_2S6M_Tunguska",                                         // 2S26 Tunguska
    "O_AAF_M60A3_WEST_01",                                               // M60A3 Patton
    "O_AAF_M1A1_WEST_01"                                                 // M1A1 Abrams
];

// All enemy vehicles that can spawn as sector defenders and patrols but at a lower enemy combat readiness (aggression levels).
opfor_vehicles_low_intensity = [
    "O_AAF_M1025A2_HMG_WEST_01",                                         // M1025 HMMWV M2
    "O_AAF_M1025A2_HMG_WEST_01",                                         // M1025 HMMWV M2
    "O_AAF_M1025A2_HMG_WEST_01",                                         // M1025 HMMWV M2
    "O_AAF_M1025A2_HMG_WEST_01",                                         // M1025 HMMWV M2
    "O_AAF_MTVR_Zu23_WEST_01",                                           // MTVR w/ ZU23
    "O_AAF_M1117_Guardian_WEST_01",                                      // M1117 Guardian
    "O_AAF_LAV_25_WEST_01",                                              // LAV-25
    "O_AAF_LAV_25_WEST_01",                                              // LAV-25
    "O_AAF_M60A3_WEST_01"                                                // M60A3 Patton
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at high enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles = [
    "O_AAF_M1025A2_HMG_WEST_01",                                         // M1025 HMMWV M2
    "O_AAF_M1025A2_GMG_WEST_01",                                          // M1025 HMMWV M2
    "O_AAF_M1117_Guardian_WEST_01",                                      // M1117 Guardian
    "O_AAF_M977_Covered_WEST_01",                                        // M977
    "O_AAF_MTVR_Closed_WEST_01",                                         // MTVR
    "O_AAF_LAV_25_WEST_01",                                              // LAV-25
    "UK3CB_AAF_O_2S6M_Tunguska",                                         // 2S26 Tunguska
    "O_AAF_AAVP_7A1_WEST_01",                                            // AAV7
    "O_AAF_M60A3_WEST_01",                                               // M60A3 Patton
    "O_AAF_M1A1_WEST_01",                                                // M1A1 Abrams
    "O_AAF_UH_1H_Gunship_WEST_01",                                       // UH-1H Iroquois
    "O_AAF_UH_60M_Armed_WEST_01",                                        // UH-60 Black Hawk
    "O_AAF_AH1Z_WEST_01",                                                // AH-1Z Viper
    "O_AAF_Aero_L39_Albatros_CAS_WEST_01",                               // L-39
    "O_AAF_JAS_39_Gripen_Digital_Green_WEST_01",                         // Gripen
    "O_AAF_JAS_39_Gripen_Grey_WEST_01"                                   // Gripen
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at lower enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles_low_intensity = [
    "O_AAF_M113_M2_Early_WEST_01",                                       // M113 w/ M2
    "O_AAF_LAV_25_WEST_01",                                              // LAV-25
    "O_AAF_M1117_Guardian_WEST_01",                                      // M1117 Guardian
    "O_AAF_MTVR_Closed_WEST_01",                                         // MTVR
    "O_AAF_AAVP_7A1_WEST_01",                                            // AAV7
    "O_AAF_M60A3_WEST_01",                                               // M60A3 Patton
    "O_AAF_MTVR_Zu23_WEST_01",                                           // MTVR w/ ZU23
    "O_AAF_UH_60M_Armed_WEST_01",                                        // UH-60 Black Hawk
    "O_AAF_UH_1H_Gunship_WEST_01"                                        // UH-1H Iroquois
];

/* All vehicles that spawn within battlegroups (see the above 2 arrays) and also hold 8 soldiers as passengers.
If something in this array can't hold all 8 soldiers then buggy behaviours may occur.	*/
opfor_troup_transports = [
    "O_AAF_M113_M2_Early_WEST_01",                                       // M113 w/ M2
    "O_AAF_M977_Covered_WEST_01",                                        // M977
    "O_AAF_MTVR_Closed_WEST_01",                                         // MTVR
    "O_AAF_AAVP_7A1_WEST_01",                                            // AAV7
    "O_AAF_UH_60M_Armed_WEST_01",                                        // UH-60 Black Hawk
    "O_AAF_UH_1H_Gunship_WEST_01"                                        // UH-1H Iroquois
];

// Enemy rotary-wings that will need to spawn in flight.
opfor_choppers = [
    "O_AAF_UH_1H_Gunship_WEST_01",                                       // UH-1H Iroquois
    "O_AAF_UH_60M_Armed_WEST_01",                                        // UH-60 Black Hawk
    "O_AAF_AH1Z_WEST_01"                                                 // AH-1Z Viper
];

// Enemy fixed-wings that will need to spawn in the air.
opfor_air = [
    "O_AAF_Aero_L39_Albatros_CAS_WEST_01",                               // L-39
    "O_AAF_JAS_39_Gripen_Digital_Green_WEST_01",                         // Gripen
    "O_AAF_JAS_39_Gripen_Grey_WEST_01"                                   // Gripen
];
