hide_inBush

a():move();

signal_setResponse('stopHiding', 'a():removeAVEffect("", false, "invisible"); a():removeAVEffect("invisible"); a():removeAVEffect("bushHide");  animate(a(), "emerge"); fx(a(), "aldbush_burst"); goto("enterCombat")');

signal_setResponse('combatStart', 'a():removeAVEffect("", false, "invisible"); a():removeAVEffect("invisible"); a():removeAVEffect("bushHide");  animate(a(), "emerge"); fx(a(), "aldbush_burst"); goto("enterCombat")');

signal_setResponse('allyKilled', 'a():removeAVEffect("", false, "invisible"); a():removeAVEffect("invisible"); a():removeAVEffect("bushHide");  animate(a(), "emerge"); fx(a(), "aldbush_burst"); goto("enterCombat")');

if(a().aiTarget == '') then
	a():applyAVEffect("invisible", 1, 9999999);
	a():applyAVEffect("bushHide", "PhysEva", -100, 9999999);
	a():applyAVEffect("bushHide", "MagEva", -100, 9999999);
	animate(a(), "aldbush_hide", 1, 0, false, false, 99999, false);
	fx(a(), "aldbush");
end
	
wait(-2);