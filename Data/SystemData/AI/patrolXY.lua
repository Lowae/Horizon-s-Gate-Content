patrolXY

a():move();


--prevent attractAttention from messing up your routine
a().ai_lua.allowChangingFromBaseScript = false;

if(getActorsDistanceInTiles(a().ID, player().ID) <= 1) then
	a():lookAtActor(player().ID);
end

if(a().aiTarget == '') then
	if(detectEnemy(a().ID) and a():isAbleToAct()) then
		a():playSpeechSound(); engageAiTarget(a()); a().movementSpeed = a().aiVarY2;
	else
	
		if(compareV2(a().movement.X, a().movement.Y, 0,0) and a().state.busyTimer <= 0) then
			if(a():canMove(a():getFacingDirection_Vector2())) then
				if((a():getFacingDirection_Vector2().X ~= 0 and a().aiVarX2 < a().aiVarX)
					or (a():getFacingDirection_Vector2().Y ~= 0 and a().aiVarX2 < a().aiVarY)) then
					a():move(a():getFacingDirection_Vector2());
					a().aiVarX2 = a().aiVarX2 + 1;
					if(a().movementSpeed ~= 4) then
						a().aiVarY2 = a().movementSpeed;
						a().movementSpeed = 4;
					end
				else
					a().facingRot = a().facingRot + 90;
					a().aiVarX2 = 0;
					a().state.busyTimer = 1;
				end
			else
				a().facingRot = a().facingRot + 90;
				a().aiVarX2 = 0;
				a().state.busyTimer = 1;
			end
		end
		
	end 
elseif(detectEnemy(a().ID)) 
	then engageAiTarget(a()); a().movementSpeed = a().aiVarY2;
end

	
wait(-1);