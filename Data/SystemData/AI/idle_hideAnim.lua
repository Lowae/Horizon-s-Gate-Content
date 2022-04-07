idle_hideAnim

a():move();

signal_setResponse('combatStart', 'a():removeAVEffect("", false, "invisible"); a():removeAVEffect("invisible"); a():removeAVEffect("", false, "invincible"); a():removeAVEffect("invincible"); animate(a(), "emerge", 1,0,false,false,0);');
	
if(a().aiTarget == '') then
	animate(a(), "hide");
	if(detectEnemy(a().ID) and a().state.busyTimer <= 0) then
		animate(a(), "emerge", 1,0,false,false,0); a():playSpeechSound(); engageAiTarget(a());
	end 
elseif(detectEnemy(a().ID)) 
	then 
		animate(a(), "emerge", 1,0,false,false,0); engageAiTarget(a());
end
	
wait(-2);