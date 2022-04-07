idle_talkCombatStartAndTurns

a():move();

signal_setResponse('combatStart', 'if(zm.combatMode) then talk(); end');
signal_setResponse('startTurn', 'if(zm.combatMode) then talk(); end');
signal_setResponse('aggro', 'modGlobal(a().ID .. "_aggro", 1)');
signal_setResponse('incapped', 'modGlobal(a().ID .. "_incapped", 1)');
	
if(a().aiTarget == '') then
	if(detectEnemy(a().ID) and a().state.busyTimer <= 0) then
		a():playSpeechSound(); engageAiTarget(a());
	end 
elseif(detectEnemy(a().ID)) 
	then engageAiTarget(a());
end

wait(-1);