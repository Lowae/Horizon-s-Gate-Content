mimic

--moves reverse of aiTarget inputs. attacks any hated foe in front of it.
--look behavior requires intelligence = 0 (to disable auto aiTarget look)

a():move();

--prevent attractAttention from messing up your routine
a().ai_lua.allowChangingFromBaseScript = false;


if(a().aiTarget ~= '') then
	if(getActorsDistanceInTiles(a().ID, aiTarget().ID) < 18) then
		a().movementSpeed = aiTarget().movementSpeed + 1;
		if(a().aggressiveness <= 0.5) then
			a():move(-aiTarget().movement.X, -aiTarget().movement.Y);
			if(a().state.busyTimer <= 0) then
				a().facingRot = aiTarget().facingRot + 180;
			end
		else
			a():move(aiTarget().movement.X, aiTarget().movement.Y);
			if(a().state.busyTimer <= 0) then
				a().facingRot = aiTarget().facingRot;
			end
		end
	else
		a().movementSpeed = a():getBaseMovementSpeed();
	end
	engageAiTarget(a());
else
	detectEnemy(a().ID);
end
	
	
wait(-1);