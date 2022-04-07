zombCreepy

if(a():getActorValue('stun') > 0) then
		zm:removeActor(a().ID);
elseif(getActorsDistanceInTiles(a().ID, player().ID) < 8 or a().aiTarget ~= '') then
	a().aiTarget = player().ID;
	a():lookAtActor(player().ID);
	if(a():canMove(1,0)) then
		a():move(1,0);
	else
		zm:removeActor(a().ID);
	end

	a():lookAtActor(player().ID);
end

	
wait(-1);