//briefing map entries for Insurgency\\
waitUntil {!isNull player};

_index =player createDiarySubject ["Rules","15th MEU Rules"];

player createDiaryRecord ["Rules",["Pilot Rules","1. All pilots shall be on TS using ACRE. Maintain watch on TAD 80 (SCA Channel 80) when flying.<br/><br/>
2. All aircraft CREW shall be in pilot slots.<br/><br/>
3. This server is not a place for players to learn to fly. Please be thoughtful of others.<br/><br/>
4. Aircraft are NOT personal cars, and shall not be left in the AO while still flight capable."]];

player createDiaryRecord ["Rules",["Server Rules","<font color='#ff4444'>1. Friendly fire is prohibited. There is NO exception to this; NO moment when friendly fire is acceptable. Violators shall be banned without warning.</font><br/><br/>
2. Racism, harrassment, sexist remarks, and general disrespect are prohibited. Violators shall be kicked or banned without warning.<br/><br/>
3. Exploits, unapproved mods, and use of personal arsenal are prohibited. Violators shall be banned.<br/><br/>
4. Misuse of mission interfaces (purchasing, recycling, etc) or negligent actions harming server health are prohibited. Violators shall be warned or kicked.<br/><br/>
5. Game Server Admins(red/silver shield) may initiate a vote and may conduct a mission restart/change if approved by majority vote.<br/><br/>
6. No player other than a 15th MEU RU member may be voted as admin.<br/><br/>
7. 'Kingpin 4' slots are for S-4 staff use only. Unauthorized users shall be kicked.<br/><br/>
8. Any issues with players breaking these rules can be reported to any Silver or Red Shield, or on the 15thmeu.net forums.<br/><br/>
9. Asshattery is Deprecated. Infractions of these rules by 15th MEU members shall be addressed through official disciplinary action.<br/><br/>
10.Abusing Opfor Equipment (IE wearing kits in an attempt to roleplay as or look as close to the enemy as possible) is prohibitied as it will cause possibly blue on blue incidents."]];

_index =player createDiarySubject ["15thMEU","15th MEU RU Info "];
player createDiaryRecord ["15thMEU",["Forums","Check us out at www.15thmeu.net."]];
player createDiaryRecord ["15thMEU",["TeamSpeak","Join our TeamSpeak server to communicate with others: <br/>
Address: 104.243.44.138<br/>
Password: 201915<br/>
TS and ACRE must be used by all pilots.<br/><br/>
<br/>
Duty admins are encouraged to conduct periodic mission resets via #missions and #monitor server status to retain server health."]];

_index =player createDiarySubject ["RF","15th MEU Radio Plan"];
player createDiaryRecord ["RF",["Radio Tips","
The primary radio for squad level coordination in the 15th MEU is the PRC-343 PRR. This radio operates in the 2.4GHz range using frequency hopping and is extremely secure, but is not capable of cross-talk with VHF/UHF radios like the PRC-152 and 117. The maximum effective range of the PRC-343 is between 500m and 1km depending on terrain line-of-sight. The PRC-343 has 16 blocks of 16 unlabeled channels available.<br/><br/>

The primary radio for higher level coordination in the 15th MEU is the PRC-152, which shares the same Software Communications Architecture as the PRC-117, as well as a shared programming personality. The maximume effective range of the PRC-152 is between 5 and 15 km depending on terrain, obstructions, frequency, and atmospheric conditions. Information on the most useful channels programmed in the SCA template is available in the Radio Plan tab."]];
player createDiaryRecord ["RF",["Radio Plan","
SCA 01 - MCALL - Hailing/Common<br/>
SCA 10 - I CO - India Company Main (GCE Primary)<br/>
SCA 50 - ARMOR - Armor Coordination<br/>
SCA 55 - FO 55 - Artillery - Calls For Fire<br/>
SCA 80 - TAD 80 - Primary Air-to-Ground<br/>
SCA 92 - CTAF 1 - ATC Air Traffic Advisory<br/>
SCA 95 - AIRSPC - Primary Air-to-Air<br/>
SCA 99 - GUARD UHF - Emergency / SAR Channel"]];






