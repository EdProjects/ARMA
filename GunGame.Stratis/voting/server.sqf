GUNGAMEVOTES_ROUNDS = [];
GUNGAMEVOTES_WEAPONS = [];

"castVote" addPublicVariableEventHandler
{
	if(GAME_progress == 0) then
	{
		GUNGAMEVOTES_ROUNDS = GUNGAMEVOTES_ROUNDS + [castVote];
		castVote = "";
	}
	else 
	{
		if(GAME_progress == 1) then
		{
			GUNGAMEVOTES_WEAPONS = GUNGAMEVOTES_WEAPONS + [castVote];
			castVote = "";
		};
	};
};



//////////////////////////////////////////////////////////

publicVariable "GAME_progress";
sleep 15;


_rounds = 10;
_roundvotes = [0,0,0];
{
	switch (_x) do {
	case 10: {_roundvotes = [(_roundvotes select 0) + 1, _roundvotes select 1, _roundvotes select 2];};
	case 20: {_roundvotes = [(_roundvotes select 0), (_roundvotes select 1) + 1, _roundvotes select 2];};
	case 30: {_roundvotes = [(_roundvotes select 0), _roundvotes select 1, (_roundvotes select 2) + 1];};
		default {};
	};
}foreach GUNGAMEVOTES_ROUNDS;

if((_roundvotes select 1) > (_roundvotes select 0)) then
{
	_rounds = 20;
};

if((_roundvotes select 2) > (_roundvotes select 1)) then
{
	_rounds = 30;
};

GUNGAME_ROUNDS = _rounds;
publicVariable "GUNGAME_ROUNDS";

///////////////////////////////////////////////////////////////////////////////////////
getDynamicWeaponInfo = {
	_ar = [];
	{
		if((_x select 0) == _this) then
		{
			_ar = _x;
		}
	}foreach (ED_dynamicWeapons_Primary + ED_dynamicWeapons_HandGun);
	_ar;
};


GAME_progress = 1;
publicVariable "GAME_progress";
//sleep 60;
_numvoteprogressions = count(GUNGAMEVOTES_WEAPONS);
_gungameweaponarray = [];
if(_numvoteprogressions > 0) then {
	_selectedprogression = GUNGAMEVOTES_WEAPONS select floor(random(_numvoteprogressions));
	{
		_gungameweaponarray = _gungameweaponarray + [_x call getDynamicWeaponInfo];
	}foreach _selectedprogression
} else
{
	for "_i" from 0 to GUNGAME_ROUNDS do {
		_gungameweaponarray = _gungameweaponarray + [(ED_dynamicWeapons_Primary + ED_dynamicWeapons_HandGun) 
		select floor(random(count(ED_dynamicWeapons_Primary + ED_dynamicWeapons_HandGun)))];
	};
};
GUNGAME_WEAPONARRAY = _gungameweaponarray;
publicVariable "GUNGAME_WEAPONARRAY";
//////////////////////////////////////////////////////////////////////////////////////////
GAME_progress = 2;
publicVariable "GAME_progress";