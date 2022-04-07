idle_talkWhen1HP

a():move();

signal_setResponse('damaged', 'if(zm.combatMode and a():getActorValue("HP") - a().lastHPDamageTaken < 2) then a():removeAVEffect("", false, "", true); talk(); end');
	
if(a().aiTarget == '') then
	if(detectEnemy(a().ID) and a().state.busyTimer <= 0) then
		a():playSpeechSound(); engageAiTarget(a());
	end 
elseif(detectEnemy(a().ID)) 
	then engageAiTarget(a());
end

wait(-2);