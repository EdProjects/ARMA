if (isNil "votednumrounds") then
{
	votednumrounds = true;
	if(GAME_progress == 0) then
	{
	
		castVote = parseNumber(lbData [3, lbCurSel 3]);
		
		if(!isServer) then
		{
			publicVariableServer "castVote";
		}
		else
		{
			GUNGAMEVOTES_ROUNDS = GUNGAMEVOTES_ROUNDS + [castVote];
		};
	};
	closeDialog 0;
};