idle_sm
--only pursues player, and destroys itself when out of range.

a():move(); 
dist = getActorsDistance(a().ID, player().ID);
if(dist < 9) then
	a().aiTarget = player().ID;
	if(dist <= 1.5) then
		a().engageAiTarget(a());
	end
else
	fx(a(), "waterSplash_small");
	fx(a(), "sfx_quietSplash");
	removeActor(a());
end
wait(-1);