idle_attackAnim

a():move();

signal_setResponse('combatStart', 'animate(a(), "idle"); goto("idle")');

signal_setResponse('attractAttention', 'animate(a(), "idle"); goto("idle")');

if(a().aiTarget == '') then
	if(detectEnemy(a().ID) and a().state.busyTimer <= 0) then
		a():playSpeechSound(); engageAiTarget(a());
	end 
	if(a().state.busyTimer <= 0) then
		a():useUnarmedAttack(true);
	end
elseif(detectEnemy(a().ID))
	then engageAiTarget(a());
end
	
wait(-1);