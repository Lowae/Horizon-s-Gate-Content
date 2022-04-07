hide_thenChase

a():move();

signal_setResponse('stopHiding', 'a():removeAVEffect("", false, "invisible"); a():removeAVEffect("invisible"); a():removeAVEffect("", false, "invincible"); a():removeAVEffect("invincible"); animate(a(), "emerge"); goto("chase")');

if(a().aiTarget == '') then
	a():applyAVEffect("invisible", 1, 9999999);
	a():applyAVEffect("invincible", 1, 9999999);
	if(detectEnemy(a().ID) and getActorsDistance(a().ID, a().aiTarget) <= 3) then
		a():removeAVEffect("", false, "invisible");
		a():removeAVEffect("invisible");
		a():removeAVEffect("", false, "invincible");
		a():removeAVEffect("invincible");
		a():playSpeechSound();
		animate(a(), "emerge");
		signal_send('stopHiding', 12, a().aiTarget);
		goto("chase");
	else
		a().aiTarget = '';
	end 
end
	
wait(-2);