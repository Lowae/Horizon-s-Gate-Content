idle_combatWhenAllyKilled

a():move();

signal_setResponse('allyKilled', 'signal_removeResponse("allyKilled"); goto("enterCombat");');

if(a().aiTarget == '') then
	if(detectEnemy(a().ID) and a().state.busyTimer <= 0) then
		a():playSpeechSound(); engageAiTarget(a());
	end 
elseif(detectEnemy(a().ID)) 
	then engageAiTarget(a());
end
	
wait(-2);