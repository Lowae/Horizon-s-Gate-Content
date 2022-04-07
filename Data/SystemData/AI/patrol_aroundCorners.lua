patrol_aroundCorners

a():move();

--prevent attractAttention from messing up your routine
a().ai_lua.allowChangingFromBaseScript = false;

if(getActorsDistanceInTiles(a().ID, player().ID) <= 1) then
	a():lookAtActor(player().ID);
end

if(a().aiTarget == '') then
	if(detectEnemy(a().ID) and a():isAbleToAct()) then
		a():playSpeechSound(); engageAiTarget(a());
	else
		if(compareV2(a().movement.X, a().movement.Y, 0,0) and a().state.busyTimer <= 0) then
		
			a().facingRot = getNearestRot(a().facingRot, 90);
		
			if(a():canMove(a():getFacingDirection_Vector2(90))) then
				a().facingRot = a().facingRot + 90;
			end
		
			if(a():canMove(a():getFacingDirection_Vector2())) then
				a():move(a():getFacingDirection_Vector2());
				a().movementSpeed = 4;
			else
				a().facingRot = a().facingRot + 90;
				a().state.busyTimer = 1;
			end
		end
		
	end 
elseif(detectEnemy(a().ID)) 
	then engageAiTarget(a());
end

	
wait(-1);