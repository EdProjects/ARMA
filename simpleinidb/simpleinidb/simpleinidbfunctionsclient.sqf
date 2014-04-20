SiniDB_buildSaveArray =
{
/*
builds an array in the correct format to allow the server to process it into a string that will be saved in the iniDB.
*/
	private ["_varNameAr","_saveArray"];
	_varNameAr = _this;
	_saveArray = [];
	{
		_saveArray = _saveArray + [[_x, call compile _x]];
	}foreach _varNameAr;
	_saveArray;
};

SiniDB_save =
{
	private ["_file", "_key", "_data"];
	_file = _this select 0;
	_key = _this select 1;
	_data = _this select 2;
	_data = _data call SiniDB_buildSaveArray;
	SiniDB_PublicVar = ["saveDB",[_file, _key, _data]];
	publicVariableServer "SiniDB_PublicVar";
};

SiniDB_load =
{
	private ["_file", "_key"];
	_file = _this select 0;
	_key = _this select 1;
	SiniDB_loadResVal = nil;
	SiniDB_PublicVar = ["loadDB", [_file, _key], owner player];
	publicVariableServer "SiniDB_PublicVar";
	waitUntil {!isNil "SiniDB_loadResVal"};
	SiniDB_loadResVal = call compile SiniDB_loadResVal;
	call compile format["%1 = SiniDB_loadResVal", _this select 2];
};

SiniDB_loadRes =
{
	SiniDB_loadResVal = _this;
};