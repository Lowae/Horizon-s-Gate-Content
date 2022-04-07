hide_untilCalled_splash

a():move();

signal_setResponse('stopHiding', 'a():removeAVEffect("", false, "invisible"); a():removeAVEffect("invisible"); a():removeAVEffect("", false, "invincible"); a():removeAVEffect("invincible"); fx(a(), "waterSplash"); animate(a(), "emerge"); goto("chase")');

if(a().aiTarget == '') then
	a():applyAVEffect("invisible", 1, 9999999);
	a():applyAVEffect("invincible", 1, 9999999);
end
	
wait(-2);