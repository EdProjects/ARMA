if((lbSize 6) <= GUNGAME_ROUNDS) then
{
	_gunText = lbText [4, lbCurSel 4];
	_gunClass = lbData [4, lbCurSel 4];
	lbAdd[6, _gunText];
	lbSetData [6, (lbSize 6) - 1, _gunClass];
	if((lbSize 6) == GUNGAME_ROUNDS) then
	{	
		castVote = [];
		for "_i" from 0 to (GUNGAME_ROUNDS - 1) do {
			castVote = castVote + [lbData[6,_i]];
		};
	
		if(!isServer) then
		{
			publicVariableServer "castVote";
		}
		else
		{
			GUNGAMEVOTES_WEAPONS = GUNGAMEVOTES_WEAPONS + [castVote];
		};
		closeDialog 0;
		gungameroundsvoted = true;
		player groupChat "Waiting for server to tally votes";
	};	
};