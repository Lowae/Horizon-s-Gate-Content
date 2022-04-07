wiggle_enterCombat

a():move();

if(a():isAbleToAct()) then
	animate(a(), "wiggle");
	zm:enterCombatMode(a().position, 11, a().ID, true);
end
	
wait(-2);