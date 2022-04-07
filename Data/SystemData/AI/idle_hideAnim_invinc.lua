idle_hideAnim_invinc

a():move();

signal_setResponse('combatStart', 'a():removeAVEffect("", false, "invisible"); a():removeAVEffect("invisible"); a():removeAVEffect("", false, "invincible"); a():removeAVEffect("invincible"); animate(a(), "emerge", 1,0,false,false,0);');
	
if(a().aiTarget == '') then
	animate(a(), "hide");
	a():applyAVEffect("invincible", 1, 9999999);
	if(detectEnemy(a().ID) and a().state.busyTimer <= 0) then
		animate(a(), "emerge", 1,0,false,false,0); a():playSpeechSound(); 
		a():removeAVEffect("invincible");
		a():removeAVEffect("", false, "invincible");
		zm:enterCombatMode(a().position, 11, a().ID, true);
	end 
elseif(detectEnemy(a().ID)) 
	then 
		animate(a(), "emerge", 1,0,false,false,0); 
		a():removeAVEffect("invincible");
		a():removeAVEffect("", false, "invincible");
		engageAiTarget(a());
		zm:enterCombatMode(a().position, 11, a().ID, true);
end
	
wait(-2);