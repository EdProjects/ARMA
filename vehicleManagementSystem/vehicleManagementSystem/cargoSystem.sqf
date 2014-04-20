vehicleManagementSystemCargo = createDialog "vehicleManagementSystemDialogCargo";

{
	lbAdd [31, _x];
} foreach (getWeaponCargo vehicleManagementSystemCurrentVehicle select 0);

{
	lbAdd [31, _x];
} foreach (getMagazineCargo vehicleManagementSystemCurrentVehicle select 0);

{
	lbAdd [31, _x];
} foreach (getItemCargo vehicleManagementSystemCurrentVehicle select 0);
{
	lbAdd [31, _x];
} foreach (getBackPackCargo vehicleManagementSystemCurrentVehicle select 0);