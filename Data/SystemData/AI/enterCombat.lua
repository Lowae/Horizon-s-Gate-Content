enterCombat

a():move();

if(a():isAbleToAct()) then
	zm:enterCombatMode(a().position, 11, a().ID, true);
end
	
wait(-2);