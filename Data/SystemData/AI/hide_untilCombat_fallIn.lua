hide_untilCombat_fallIn

a():move();

signal_setResponse('combatStart', 'a():removeAVEffect("", false, "invisible"); a():removeAVEffect("invisible"); a():removeAVEffect("", false, "invincible"); a():removeAVEffect("invincible"); animate(a(), "fallIn"); goto("idle")');

if(a().aiTarget == '') then
	a():applyAVEffect("invisible", 1, 9999999);
	a():applyAVEffect("invincible", 1, 9999999);
end
	
wait(-2);