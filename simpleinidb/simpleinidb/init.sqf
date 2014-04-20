_h = execVM "simpleinidb\iniDBfunctions.sqf";
waitUntil {scriptDone _h};
_h = execVM "simpleinidb\simpleinidbfunctionsserver.sqf";
waitUntil {scriptDone _h};
_h = execVM "simpleinidb\simpleinidbfunctionsclient.sqf";
waitUntil {scriptDone _h};




SiniDB_PublicVar = [];
SiniDB_PublicEventHandler = 
{
	private ["_EHcmd", "_EHdata"];
	_EHcmd = _this select 0;
	_EHdata = _this select 1;
	if(_EHcmd == "loadDB") then
	{
		_loadClient = _this select 2;
		SiniDB_PublicVar = ["loadRes", _EHdata call SiniDB_loadDB];
		_loadClient publicVariableClient "SiniDB_PublicVar";
	};
	if(_EHcmd == "saveDB") then
	{
		_Ehdata spawn SiniDB_saveDB;
	};
	if(_EHcmd == "loadRes") then
	{
		_Ehdata spawn SiniDB_loadRes;
	};
};





"SiniDB_PublicVar" addPublicVariableEventHandler 
{
	SiniDB_PublicVar spawn SiniDB_PublicEventHandler;
};