idle_enterAnyCombat

a():move();

signal_setResponse('combatStart', 'zm:setFactionHostile(a().faction); signal_removeResponse("combatStart"); signal_send("combatStart", 30); goto("enterCombat");');

if(a().aiTarget == '') then
	if(detectEnemy(a().ID) and a().state.busyTimer <= 0) then
		a():playSpeechSound(); engageAiTarget(a());
	end 
elseif(detectEnemy(a().ID)) 
	then engageAiTarget(a());
end
	
wait(-2);