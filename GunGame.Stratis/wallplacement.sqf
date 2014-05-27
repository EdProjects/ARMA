_wallName = "Land_CncWall4_F";
_wallmultiplier = 0.25;
_numWalls = 2 * GUNGAME_wallradius * 3.14 * _wallmultiplier;
for[{_i = 0}, {_i <= 360}, {_i = _i + (GUNGAME_wallradius / _numWalls)}] do
{
	_x = (fightPosition select 0) + (GUNGAME_wallradius * sin(_i));
	_y = (fightPosition select 1) + (GUNGAME_wallradius * cos(_i));
	_w = _wallName createVehicle [_x, _y,0];
	_w setPos [_x, _y, 0];
	_vectorUp = surfaceNormal [_x, _y, 0];
	_w setDir _i;
	_w setVectorUp _vectorUp;
};