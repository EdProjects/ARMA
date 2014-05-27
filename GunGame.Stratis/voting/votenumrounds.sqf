if(!isNil "voteNumRounds") exitWith {};
voteNumRounds = true;

if(isNil "GAME_progress") then
{
GAME_progress == 0;
};

[] spawn {
	_i = 14;
	while{_i >= 0 && GAME_progress == 0} do
	{
		hint format["You have %1 seconds to vote for the number of rounds", _i];
		sleep 1;
		_i = _i - 1;
	};
};

while {GAME_progress == 0 && isNil "votednumrounds"} do
{
	_dialog = createDialog "voteNumRounds";	
	lbAdd [3, "10"];
	lbSetData[3, 0, "10"];
	lbAdd [3, "20"];
	lbSetData[3, 1, "20"];
	lbAdd [3, "30"];
	lbSetData[3, 2, "30"];
	lbSetCurSel [3, 1];
	waitUntil{!dialog || GAME_progress != 0};
	if(dialog) then {closeDialog 0};
};

waitUntil {GAME_progress == 1};
execVM "voting\votegunprogress.sqf";