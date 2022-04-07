zombCreepyStander

if(a():getActorValue('stun') > 0) then
		a():updateActiveEffects(80);
		a().state.busyTimer = 0;
		a().aiTarget = player().ID;
elseif(a().aiTarget ~= '' and a().state.busyTimer <= 0) then
	a():lookAtActor(player().ID);
	if(a():canMove(1,0)) then
		a():move(1,0);
	else
		zm:removeActor(a().ID);
	end

	a():lookAtActor(player().ID);
		
elseif(getActorsDistanceInTiles(a().ID, player().ID) < 12 and a().state.busyTimer <= 0) then
	a().state.busyTimer = 3;
	a().aiTarget = player().ID;
	a():lookAtActor(player().ID);
else
	a():lookAtActor(player().ID);
end

	
wait(-1);