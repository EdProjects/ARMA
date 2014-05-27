spawn_in_line_of_sight =
{
	_los = false;
	_postocheck = [_this select 0, _this select 1, 1.6];
	{
		if(isPlayer _x && player != _x)
		then
		{
			if(lineIntersects [_postocheck, eyePos _x, _x])
			then
			{
				_los = true;
			};
		};
	}
	foreach playableUnits;

	_los;
};


while{true} do
{
	waitUntil{alive player};
	titleText ["", "BLACK OUT", 0.1];
	call spawnGuns;
	player addRating -100000;
	player addEventHandler["killed", {(_this select 1) call killFunc}];
	_spawning = true;
	while {_spawning} do
	{
		_x = (fightPosition select 0) + (GUNGAME_wallradius * sin(random(360)));
		_y = (fightPosition select 1) + (GUNGAME_wallradius * cos(random(360)));
		_pos = [_x, _y, 0];
		
		_newPos = [_pos, 0, 1, 1, 0, 50, 0] call BIS_fnc_findSafePos;	
		//Buildings//////////////////////////////////////////////////////////////////////////////////////////
		_buildings = nearestObjects[_pos, ["House"], GUNGAME_wallradius];
		if(random(100) > 50) then
		{	
			_buildingsPositions = [];		
			{
				
				_building = _x;
				_endloop = false;
				_poscount = 0;
				while {!_endloop} do {
					if(((_building buildingPos _poscount) select 0) != 0 && ((_building buildingPos _poscount) select 1) != 0) then {
						_buildingsPositions = _buildingsPositions + [_building buildingPos _poscount];
						_poscount = _poscount + 1;
					} else {
						_endloop = true;
					};
				};			
			}foreach _buildings;
			if(count(_buildingsPositions) > 0) then
			{
				_newPos = _buildingsPositions select (floor(random(count(_buildingsPositions))));
			};
		};
		//////////////////////////////////////////////////////////////////////////////////////////////////////
		

		if(((_newPos distance fightZone) < (GUNGAME_wallradius - 10)) && !(_newPos call spawn_in_line_of_sight)) then 
		{
			_spawning = false;
			player setPos _newPos select 0;
			player setDir random(360);
		};
	};
	titleText ["", "BLACK IN", 0.1];
	waitUntil{!alive player};
	GUNGAME_WASDEAD = true;
	gunGamePrevScore = gunGamePrevScore - 1;
};