relentless

--pursue 1st detected aiTarget without needing further detection,
--and speeding up if aiTarget is too far away.
--only do this if not zm.safe.

a():move();

if(a().aiTarget == '') then
	if(detectEnemy(a().ID) and a().state.busyTimer <= 0) then
		a():playSpeechSound(); engageAiTarget(a());
	end 
	wait(-1);
elseif(not zm.safe) then
	if(getActorsDistanceInTiles(a().ID, aiTarget().ID) > 10) then
		a().movementSpeed = a().movementSpeed + 1;
	else
		a().movementSpeed = a():getBaseMovementSpeed();
	end
	engageAiTarget(a());
	wait(-1);
else
	a().movementSpeed = a():getBaseMovementSpeed();
	if(detectEnemy(a().ID)) then
		engageAiTarget(a());
	end
	wait(-2);
end
	