hide_untilCalled_fallIn_chase

a():move();

signal_setResponse('stopHiding', 'a():removeAVEffect("", false, "invisible"); a():removeAVEffect("invisible"); a():removeAVEffect("", false, "invincible"); a():removeAVEffect("invincible"); animate(a(), "fallIn"); goto("chase")');

if(a().aiTarget == '') then
	a():applyAVEffect("invisible", 1, 9999999);
	a():applyAVEffect("invincible", 1, 9999999);
end
	
wait(-2);