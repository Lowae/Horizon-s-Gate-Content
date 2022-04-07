untilCombat_invinc

--prevent attractAttention from messing up your routine
a().ai_lua.allowChangingFromBaseScript = false;

a():move();

signal_setResponse('combatStart', 'a():removeAVEffect("", false, "invisible"); a():removeAVEffect("invisible"); a():removeAVEffect("", false, "invincible"); a():removeAVEffect("invincible");');
	
a():applyAVEffect("invincible", 1, 9999999);
	
wait(-2);