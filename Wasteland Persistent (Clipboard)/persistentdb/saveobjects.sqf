//Save objects loop
//Author: {ZAG}Ed!
sleep 300;
while {true} do {
persistentsavedobjects = [];
{
_var = _x getVariable "objectLocked";
if((!isNil "_var" || (typeOf _x == "Satelit") || (typeOf _x == "M1130_HQ_unfolded_Base_EP1")) && (alive _x)) then {
_classname = typeOf _x;
_pos = getPos _x;
_dir = [vectorDir _x] + [vectorUp _x];

_supplyleft = 0;

_weapons = [];
_magazines = [];

if(_x isKindOf "Land_stand_small_EP1") then {
	_supplyleft = _x getVariable "food";
};

if(_x isKindOf "Land_Barrel_water") then {
	_supplyleft = _x getVariable "water";
};

if(_x isKindOf "Satelit") then {
//Put the data in the supplyleft spot in array.
_supplyleft = [_x getVariable "faction",_x getVariable "ownerName",_x getVariable "ownerUID"];
};

if(_x isKindOf "M1130_HQ_unfolded_Base_EP1") then {
//Put the data in the supplyleft spot in array.
_supplyleft = [_x getVariable "prevFuel",_x getVariable "prevDamage"]
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
if(_classname in _boxlist ) then {
	_weapons = getWeaponCargo _x;
	_magazines = getMagazineCargo _x;
};

persistentsavedobjects = persistentsavedobjects + [[_classname,_pos,_dir,_supplyleft,_weapons,_magazines]];

};
} forEach allMissionObjects "All";

_savestring = "";

for[{_i = 0}, {_i < count persistentsavedobjects}, {_i = _i + 1}] do {

if(_i == count persistentsavedobjects - 1) then {
_savestring = _savestring + format["%1
", persistentsavedobjects select _i];
} else {
_savestring = _savestring + format["%1,
", persistentsavedobjects select _i];
};

};
//The next will be saved in the objects.sqf file which is loaded on restart
savedpersistentobjects = "persistentobjects = [" + _savestring + "]";

sleep 300;
};