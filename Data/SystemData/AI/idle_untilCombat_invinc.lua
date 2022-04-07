idle_untilCombat_invinc

a():move();

signal_setResponse('combatStart', 'a():removeAVEffect("", false, "invisible"); a():removeAVEffect("invisible"); a():removeAVEffect("", false, "invincible"); a():removeAVEffect("invincible");');
	
if(a().aiTarget == '') then
	a():applyAVEffect("invincible", 1, 9999999);
	if(detectEnemy(a().ID) and a().state.busyTimer <= 0) then
		a():playSpeechSound(); 
		a():removeAVEffect("invincible");
		a():removeAVEffect("", false, "invincible");
		zm:enterCombatMode(a().position, 11, a().ID, true);
	end 
elseif(detectEnemy(a().ID)) 
	then 
		a():removeAVEffect("invincible");
		a():removeAVEffect("", false, "invincible");
		engageAiTarget(a());
		zm:enterCombatMode(a().position, 11, a().ID, true);
end
	
wait(-2);