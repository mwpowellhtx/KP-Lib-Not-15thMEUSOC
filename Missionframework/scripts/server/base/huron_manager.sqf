waitUntil {!isNil "GRLIB_all_fobs"};
waitUntil {!isNil "save_is_loaded"};
waitUntil {save_is_loaded};

firstloop = true;
huron = objNull;
_savedhuron = objNull;

// Mission may or may not include a 'huronspawn' proxy
private _huronspawn = missionNamespace getVariable ["huronspawn",objNull];
// TODO: TBD: if we should pursue multi-startbase support...
private _startbase = missionNamespace getVariable ["startbase",objNull];

// Operate only when there is such an object
while {alive _huronspawn} do {
    // TODO: TBD: really? subsume the first available object of its type as tne 'saved huron' (?)
    {
        if (typeof _x == huron_typename) then {
            _savedhuron = _x;
        };
    } forEach vehicles;

    if (firstloop && !isNull _savedhuron) then {
        huron = _savedhuron;
    } else {
        // TODO: TBD: closer to the startbase asset creation...
        // TODO: TBD: need to rethink this form of 'createVehicle'
        private _posATL = getPosATL _huronspawn;
        private _huronPosATL = [_posATL, [0, 0, 0.2]] call BIS_fnc_vectorAdd;
        huron = huron_typename createVehicle _huronPosATL;
        huron enableSimulationGlobal false;
        huron allowdamage false;
        huron setDir (getDir _huronspawn);
        huron setPosATL (getposATL _huronspawn);
    };

    firstloop = false;

    huron AnimateDoor ["Door_rear_source", 1, true];
    publicVariable "huron";
    if(KP_liberation_clear_cargo) then {
        clearWeaponCargoGlobal huron;
        clearMagazineCargoGlobal huron;
        clearItemCargoGlobal huron;
        clearBackpackCargoGlobal huron;
    };
    huron setDamage 0;
    sleep 0.5;
    huron enableSimulationGlobal true;
    huron setDamage 0;
    huron setVariable ["ace_medical_medicClass", 1, true];
    sleep 1.5;

    huron setDamage 0;
    huron allowdamage true;

    if (alive huron) then {
        waitUntil { sleep 1; !alive huron; };
        stats_spartan_respawns = stats_spartan_respawns + 1;
        sleep 15;
    };

    // TODO: TBD: assuming a lot of things, i.e. distance from a startbase object
    if (huron distance _startbase < 500) then {
        deletevehicle huron;
    };
    sleep 0.25;
};
