//Persistent Scripts by ZA-Gamers. www.za-gamers.co.za
//Author: {ZAG}Ed!
//Date: 06/01/2013

//Loading scripts

if(isServer) then {
execVM "persistentdb\loadplayers.sqf";
execVM "persistentdb\loadobjects.sqf";
execVM "persistentdb\saveobjects.sqf";
execVM "persistentdb\saveplayerserver.sqf";
};
if(!isDedicated) then {
execVM "persistentscripts\saveplayers.sqf";
execVM "persistentscripts\loadrequest.sqf";
};