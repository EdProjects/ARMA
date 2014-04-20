_index = lbCurSel 21;
_weapons = [];
if(count((vehicleManagementSystemCurrentVehicleTurretsArray select _index) select 1) > 0) then
{
_weapons = (vehicleManagementSystemCurrentVehicleTurretsArray select _index) select 1;
};
lbClear 23;
lbClear 24;
_index2 = lbCurSel 22;
_magazines = [];
if(count(_weapons) > 0) then
{
	_magazines = _weapons select _index2 select 1;
};
_count = 0;
{
	private ["_text"];
	if((_x select 1) == "") then
	{
		_text = [_x select 0, "_", " "] call ED_strings_replace;	
	}
	else
	{
		_text = format["%1Rnd %2", _x select 2, _x select 1];
	};
	lbAdd [23, _text];
	_count = _count + 1;
} foreach _magazines;
lbSetCurSel [23, 0];


_turretPath = (vehicleManagementSystemCurrentVehicleTurretsArray select _index) select 2;

_magazinesCurrent = vehicleManagementSystemCurrentVehicle magazinesTurret _turretPath;
_count = 0;
{
	_class = _x;
	_description = getText(configFile >> "cfgMagazines" >> _class >> "displayName");
	if(_description == "") then
	{
		_description = [_class, "_", " "] call ED_strings_replace;	
	}
	else
	{
		_description = format["%1Rnd %2", getNumber(configFile >> "cfgMagazines" >> _class >> "count"), _description];
	};
	lbAdd [24, _description];
	lbSetData [24, _count, _class];	
	_count = _count + 1;
	lbSetCurSel [24, 0];
} foreach _magazinesCurrent;