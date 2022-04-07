mysteryAlly1


if(a():getActorValue('stun') > 0) then
	a():updateActiveEffects(80);
end

if(a().aiTarget ~= '') then
	if(a().state.busyTimer <= 0) then
		if(a():canMove(0,1)) then
			a():move(0,1);
		else
			zm:removeActor(a().ID);
		end
	end
elseif(isTriggered(3)) then
	actionOnSelf(a(), 'cutsc_stuncrossbow');
	a().aiTarget = player().ID;
end

	
wait(-1);