_id = _this select 0;
_name = _this select 1;

sleep 1;
_id publicVariableClient "GAME_progress";
if(!isNil "GUNGAME_WEAPONARRAY") then
{_id publicVariableClient "GUNGAME_WEAPONARRAY"};