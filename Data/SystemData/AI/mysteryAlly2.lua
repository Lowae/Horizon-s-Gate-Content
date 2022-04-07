mysteryAlly2

zm.safe = true;

if(a():getActorValue('stun') > 0) then
	a():updateActiveEffects(80);
end

if(a().aiTarget ~= '') then
	if(a().state.busyTimer <= 0) then
		if(a():canMove(1,0)) then
			a():move(1,0);
		else
			zm:removeActor(a().ID);
		end
	end
else
	a():lookAtActor(player().ID);
	a():useAction('throw_whitexbow', player().positionTC);
	a().aiTarget = player().ID;
end

	
wait(-1);