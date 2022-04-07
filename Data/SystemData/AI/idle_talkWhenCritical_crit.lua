idle_talkWhenCritical_crit

a():move();

signal_setResponse('critical', 'if(zm.combatMode) then a():removeAVEffect("", false, "", true); talk(a().ID, a().dialogNodeID .. "_crit"); end');
	
if(a().aiTarget == '') then
	if(detectEnemy(a().ID) and a().state.busyTimer <= 0) then
		a():playSpeechSound(); engageAiTarget(a());
	end 
elseif(detectEnemy(a().ID)) 
	then engageAiTarget(a());
end

wait(-2);