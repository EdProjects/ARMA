//Loading Saved Objects
//Author: {ZAG}Ed!
execVM "persistentdb\objects.sqf";
waitUntil{!isNil "persistentobjects"};
sleep 10;
_objectscount = count persistentobjects;

for[{_i = 0}, {_i < _objectscount}, {_i = _i + 1}] do {
(persistentobjects select _i) spawn {

_class = _this select 0;
_pos = _this select 1;
_dir = _this select 2;

if(_class == "M1130_HQ_unfolded_Base_EP1") then {
_class = "M1133_MEV_EP1";
};

_obj = createVehicle [_class,_pos, [], 0, "CAN COLLIDE"];

_obj setPos _pos;
_obj setVectorDirAndUp _dir;

if(_class == "Land_stand_small_EP1") then 
{
_supplyleft = _this select 3;
    _obj setVariable["food",_supplyleft,true];
};

if(_class == "Land_Barrel_water") then 
{
_supplyleft = _this select 3;
    _obj setVariable["water",_supplyleft,true];
};
if(_class == "Satelit") then {
_faction = _this select 3 select 0;
_ownername = _this select 3 select 1;
_ownerUID = _this select 3 select 2;

_obj addEventHandler["handleDamage", {false}];
_obj setVariable["R3F_LOG_disabled", true];      
_obj setVariable["faction",_faction,true];
_obj setVariable["ownerName",_ownername,true];
_obj setVariable["ownerUID",_ownerUID,true]; 
_obj enableSimulation false;	

if(_faction == "WEST") then {
pvar_beaconListBlu set [count pvar_beaconListBlu,[_ownername, _pos, 100, _ownerUID]];
publicVariable "pvar_beaconListBlu";
} else {
if(_faction == "EAST") then {
pvar_beaconListRed set [count pvar_beaconListRed,[_ownername, _pos, 100, _ownerUID]];
publicVariable "pvar_beaconListRed";
} else {
deleteVehicle _obj;
};
};
};

if(_class == "M1133_MEV_EP1") then {
_prevfuel = _this select 3 select 0;
_prevDamage = _this select 3 select 1;
_obj setVariable ["deployed", 0, true];
_obj setVariable ["original",1,true];
_obj setFuel _prevfuel;
_obj setDamage _prevDamage;
};

_boxlist =	 ["USLaunchersBox",
			"USSpecialWeaponsBox",
			"BAF_BasicWeapons",
			"RUSpecialWeaponsBox",
			"USBasicWeaponsBox",
			"RUBasicWeaponsBox",
			"SpecialWeaponsBox",
			"GERBasicWeapons_EP1",
			"Ammobox_PMC",
			"TKBasicWeapons_EP1"];
if(_class in _boxlist ) then {

clearWeaponCargoGlobal _obj;
clearMagazineCargoGlobal _obj;

_weapons = _this select 4;
_magazines = _this select 5;

for[{_ii = 0}, {_ii < (count (_weapons select 0))}, {_ii = _ii + 1}] do {
_obj addWeaponCargoGlobal [(_weapons select 0) select _ii, (_weapons select 1) select _ii];
};

for[{_ii = 0}, {_ii < (count (_magazines select 0))}, {_ii = _ii + 1}] do {
_obj addMagazineCargoGlobal [(_magazines select 0) select _ii, (_magazines select 1) select _ii];
};

};



//_obj setVariable ["objectLocked", true, true];
};
};