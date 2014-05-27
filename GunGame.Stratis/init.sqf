enableSaving [false, false];
removeAllWeapons player;
titleText ["", "BLACK OUT", 1];
GUNGAME_wallradius = 150;
giveScore = "";
fightPosition = getPos fightZone;
_h = execVM "dynamicWeapons.sqf";
waitUntil {scriptDone _h};
if(isServer) then {
	GAME_progress = 0;
	onPlayerConnected "[_id, _name] execVM ""PlayerConnected.sqf""";
	execVM "wallplacement.sqf";	
	execVM "voting\server.sqf";	
};

"winner" addPublicVariableEventHandler
{
	[] spawn {
	removeAllWeapons player;
	hint format["%1 won the game!", winner];
	sleep 10;
	endMission "END1";
	};
};

if(!isServer) then {
	
};

if(!isDedicated) then
{
	player enableSimulation false;
	"GAME_progress" addPublicVariableEventHandler
	{
		switch(GAME_progress) do
		{
		case 0: {execVM "voting\votenumrounds.sqf";};
		case 1: {execVM "voting\votegunprogress.sqf";};
			default {};
		};
	};
	
	execVM "voting\votenumrounds.sqf";

	waitUntil{!isNil "GUNGAME_ROUNDS"};
	player groupChat format["Total rounds: %1", GUNGAME_ROUNDS];
	waitUntil{!isNil "GUNGAME_WEAPONARRAY"};

	player enableSimulation true;	

	"giveScore" addPublicVariableEventHandler
	{
		if (giveScore == getPlayerUID player) then
		{
			giveScore = "";
			call gunGameFunc;
		};
	};
	GUNGAME_WASDEAD = false;
	_h = execVM "gungamefuncs.sqf";
	waitUntil{scriptDone _h};
	_h = execVM "respawn.sqf";
};