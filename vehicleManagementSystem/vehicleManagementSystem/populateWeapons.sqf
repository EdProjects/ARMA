_index = lbCurSel 21;
_weapons = (vehicleManagementSystemCurrentVehicleTurretsArray select _index) select 1;
lbClear 22;
lbClear 23;
_count = 0;
{
	_text = format["%1", _x select 0];
	lbAdd [22, _text];
	_count = _count + 1;
} foreach _weapons;

((findDisplay 482) displayCtrl 22) ctrlSetEventHandler ["LBSelChanged","execVM 'vehicleManagementSystem\populateMagazines.sqf'"];
lbSetCurSel [22, 0];