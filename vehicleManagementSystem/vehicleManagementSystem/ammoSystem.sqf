_vClass = typeOf vehicleManagementSystemCurrentVehicle;
_turrets = [];

vehicleManagementSystemAmmo = createDialog "vehicleManagementSystemDialogAmmo"; 
_getMagazines = 
{
	private ["_currentWeapon", "_muzzles", "_magazines", "_currentMagazinesArray", "_currentMagazine", "_magazineClass", "_model", "_magazineDescription", "_magCount"];
	_currentWeapon = configFile >> "cfgWeapons" >> _this;
	_muzzles = getArray(_currentWeapon >> "muzzles");
	_magazines = [];
	{
		_currentMagazinesArray = [];
		if(_x != "this") then 
		{
			_currentMagazinesArray = _currentMagazinesArray + getArray(_currentWeapon >> _x >> "magazines");
		} 
		else 
		{
			_currentMagazinesArray = _currentMagazinesArray + getArray(_currentWeapon >> "magazines");
		};
		for[{_k = 0}, {_k < count(_currentMagazinesArray)}, {_k = _k + 1}] do
		{
			_currentMagazine = _currentMagazinesArray select _k;
			_magazineClass = configName(configFile >> "cfgMagazines" >> _currentMagazine);
			_model = getText(configFile >> "cfgMagazines" >> _currentMagazine >> "model");
			_magCount = getNumber(configFile >> "cfgMagazines" >> _currentMagazine >> "count");
			if (!((toArray(" ") select 0) in toArray(_magazineClass)) && ((toArray(_model) select 0) == (toArray("\") select 0))) then
				{
				_magazineDescription = getText(configFile >> "cfgMagazines" >> _currentMagazine >> "displayName");			
				_magazines = _magazines + [[_magazineClass, _magazineDescription, _magCount]];
				};
			};
		}foreach (_muzzles);
		_magazines;
};

_turretCfg = configFile >> "cfgVehicles" >> _vClass >> "Turrets";
for "_i" from 0 to (count(_turretCfg) -1) do
{
	_curTur = _turretCfg select _i;
	_weapons = getArray(_curTur >> "Weapons");
	_weaponsEvaluated = [];
	{
		_mags = _x call _getMagazines;
		if(count (_mags) > 0) then
		{
		_weaponsEvaluated = _weaponsEvaluated + [[getText(configFile >> "cfgWeapons" >> _x >> "displayName"), _mags]];
		};
	} foreach _weapons;
	_turrets = _turrets + [[configName (_curTur), _weaponsEvaluated, [_i]]];
	_subTurs = _curTur >> "Turrets";
	for "_j" from 0 to (count(_subTurs) - 1) do
	{
		_curSub = _subTurs select _j;
		_weapons = getArray(_curSub >> "Weapons");
		_weaponsEvaluated = [];
	{
		_mags = _x call _getMagazines;
		if(count (_mags) > 0) then
		{
		_weaponsEvaluated = _weaponsEvaluated + [[getText(configFile >> "cfgWeapons" >> _x >> "displayName"), _mags]];
		};
	} foreach _weapons;
		_turrets = _turrets + [[configName(_curSub), _weaponsEvaluated, [_i, _j]]];
	};
};
_weapons = getArray(configFile >> "cfgVehicles" >> _vClass >> "Weapons");
_weaponsEvaluated = [];
	{
		_mags = _x call _getMagazines;
		if(count (_mags) > 0) then
		{
		_weaponsEvaluated = _weaponsEvaluated + [[getText(configFile >> "cfgWeapons" >> _x >> "displayName"), _mags]];
		};
	} foreach _weapons;
if(count(_weaponsEvaluated) != 0) then
{
_turrets = _turrets + [["Pilot" , _weaponsEvaluated, [-1]]];
};
vehicleManagementSystemCurrentVehicleTurretsArray = _turrets;
((findDisplay 482) displayCtrl 21) ctrlSetEventHandler ["LBSelChanged","execVM 'vehicleManagementSystem\populateWeapons.sqf'"];
_count = 0;
	{
		_text = format["%1", _x select 0];
		lbAdd [21, _text];
		_count = _count + 1;
	} foreach _turrets;
	if(_count > 0) then {lbSetCurSel [21, 0];};