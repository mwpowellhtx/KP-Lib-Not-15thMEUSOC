waitUntil { time > 1; };
// Which should be set to objNull by its manager
waitUntil { !isNil "huron"; };

// All such CANDIDATES from which to choose
private _candidates = entities "Land_ClutterCutter_small_F";

// Allowing for 1+ STARTBASE 'sectors'
private _startbases = _candidates select { toLower vehicleVarName _x find "startbase" == 0; };

// ELIGIBLE such CANDIDATES must be within range of at least one of the STARTBASES
private _eligible = (_candidates - _startbases) select {
    private _y = _x;
    { _x distance _y <= GRLIB_sector_size; } count _startbases > 0;
};

private _objectPosDelta = [0, 0, 0.1];

// // TODO: TBD: do not feel like editing all the missions just now...
// // TODO: TBD: however this could be so easily extensible, i.e.
// , [ "rotary", KP_liberation_rotary_classname]
// , [ "attack_rotary", KP_liberation_attack_rotary_classname]

// Allowing for authors to introduce their own custom specifications
private _spec = missionNamespace getVariable ["KP_liberation_startvehicle_spec", [
    // Which at least makes the following presumptions from the preset vars
    ["littlebird", KP_liberation_little_bird_classname]
    //             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    , [ "boat", KP_liberation_boat_classname]
    //          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    , [ "plane", KP_liberation_plane_classname]
    //           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    , [ "bigbird", KP_liberation_big_bird_classname]
    //             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    , [ "tortoise", KP_liberation_tortoise_classname]
    //              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    , [ "hare", KP_liberation_hare_classname]
    //          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    , [ "container_repair", KP_liberation_container_repair]
    //                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    , [ "container_fuel", KP_liberation_container_fuel]
    //                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    , [ "container_ammo", KP_liberation_container_ammo]
    //                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
]];

// Specs which may be supported by the current configuration
private _specToBeCreated = _spec select {
    _x params [
        ""
        , ["_class", "", [""]]
    ];
    private _config = configFile >> "CfgVehicles" >> _class;
    !isNull _config;
};
// So we do not spin our unnecessarily wheels over configuration which does not exist

diag_log format ["[KP LIBERATION] [STARTVEHICLE] Start vehicle specs: [_spec, _specToBeCreated]: %1"
    , str [_spec, _specToBeCreated]
];

{
    _x params [
        ["_prefix", "", [""]]
        , ["_class", "", [""]]
    ];

    // Does not matter what else the object is named, could be named 'prefix_foobar' for all we care
    private _toBeCreated = _eligible select {
        toLower vehicleVarName _x find _prefix == 0;
    };

    private _objects = _toBeCreated apply {
        private _proxy = _x;
        private _proxyPosATL = getPosATL _proxy;
        private _proxyDir = getDir _proxy;
        private _objectPosATL = [_proxyPosATL, _objectPosDelta] call BIS_fnc_vectorAdd;
        // TODO: TBD: the first 'createVehicle' form simply does not work is too imprecise in its calculation
        private _object = createVehicle [_class, _objectPosATL, [], 0, "CAN_COLLIDE"];
        // TODO: TBD: see how this works, whether we need to (re-)set a position...
        _object enableSimulationGlobal false;
        _object allowDamage false;
        _object setDir _proxyDir;
        _object spawn {
            private _object = _this;
            sleep 0.5;
            _object enableSimulationGlobal true;
            _object setDamage 0;
            _object allowDamage true;
            _object setVariable ["KP_liberation_preplaced", true, true];
            if (KP_liberation_clear_cargo) then {
                clearWeaponCargoGlobal _object;
                clearMagazineCargoGlobal _object;
                clearItemCargoGlobal _object;
                clearBackpackCargoGlobal _object;
            };
        };
        _object;
    };

    diag_log format ["[KP LIBERATION] [STARTVEHICLE] Start vehicles spawned: [_prefix, _class, count _toBeCreated, count _objects]: %1"
        , str [_prefix, _class, count _toBeCreated, count _objects]
    ];
} forEach _specToBeCreated;

true;
