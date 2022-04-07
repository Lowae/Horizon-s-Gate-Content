idle_talkEveryTurn

a():move();

signal_setResponse('startTurn', 'if(zm.combatMode) then talk(); end');
	
if(a().aiTarget == '') then
	if(detectEnemy(a().ID) and a().state.busyTimer <= 0) then
		a():playSpeechSound(); engageAiTarget(a());
	end 
elseif(detectEnemy(a().ID)) 
	then engageAiTarget(a());
end

wait(-1);