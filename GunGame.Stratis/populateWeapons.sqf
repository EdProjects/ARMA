lbClear 4;
if((lbData [3, lbCurSel 3]) == "hand") then
{
	_count = 0;
	{
		lbAdd [4, _x select 1];
		lbSetData[4, _count, _x select 0];
		_count = _count + 1;
	} foreach ED_dynamicWeapons_HandGun;
} else {
	_count = 0;
	{
		lbAdd [4, _x select 1];
		lbSetData[4, _count, _x select 0];
		_count = _count + 1;
	} foreach ED_dynamicWeapons_Primary;
};
lbSetCurSel [4, 0];