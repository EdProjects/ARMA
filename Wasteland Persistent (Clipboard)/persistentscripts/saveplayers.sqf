//Player save
//Author: {ZAG}Ed!

persistentstatsloaded = false;
waitUntil {persistentstatsloaded};
persistentdbsaveplayertimerrunning = false;
while {true} do {
waitUntil{alive player};
waitUntil{!respawnDialogActive};
persistentdbsaveplayertimer = false;
_team = side player;
[] spawn {if(persistentdbsaveplayertimerrunning) exitWith {}; persistentdbsaveplayertimerrunning = true; sleep 15; persistentdbsaveplayertimer = true; persistentdbsaveplayertimerrunning = false;};
//minor exploit prevention
_weapons = count(weapons player);
waitUntil {persistentdbsaveplayertimer or !alive player or (count(weapons player) != _weapons) or mutexScriptInProgress};
if(mutexScriptInProgress) then {sleep 0.5};

_itemarray = [player getVariable "cmoney",
player getVariable "canfood",
player getVariable "medkits",
player getVariable "water",
player getVariable "fuel",
player getVariable "repairkits",
player getVariable "fuelFull",
player getVariable "fuelEmpty",
player getVariable "bombs",
player getVariable "spawnBeacon",
player getVariable "camonet",
hungerLevel,
thirstLevel]
;


_locationarray = [getPos player, getDir player];

_weaponsarray = [weapons player, magazines player];


_damage = getDammage player;

if(!alive player) then {
_itemarray = [0,0,0,0,0,0,0,0,0,0,0,0,0];
_weaponsarray = [[],[]];
_damage = 1
};

playersavearray = [_itemarray, _locationarray, _weaponsarray, _damage];
call compile (format["%2%1playersave = playersavearray;
publicVariableServer ""%2%1playersave"";", getPlayerUID player, _team]);
};
