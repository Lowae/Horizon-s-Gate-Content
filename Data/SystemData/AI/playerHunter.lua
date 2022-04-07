playerHunter


if(not zm.safe and getActorsDistanceInTiles(a().ID, player().ID) <= 12) then
	a():move();


	if(a().aiTarget == '') then
		a().aiTarget = player().ID;
		--aiTarget():applyAVEffect('immob', 1, 20);
		a().movementSpeed = 22;
		a():move(9, 0);
		
	elseif(a().mountedBy ~= '') then
		a().movementSpeed = 2;
		if(a().position.X > 141) then
			aiTarget():applyAVEffect('immob', 1, 3);
			animate(aiTarget(), 'pain', 1,0);
			aiTarget().facingRot=0;
			a():move(-1,0);
		elseif(a().position.Y < 52) then
			if(aiTarget():unequipItem(1,1) ~= null) then
				fx(a(), 'click');
				fx(aiTarget(), 'slamSparks');
				fx(aiTarget(), 'hold_xbow');
				a():useAction('throw_xbow', -8,0);
				aiTarget().facingRot=90;
			end
			a():move(0,1);
		elseif(a().state.busyTimer <= 0) then
			animate(a(), 'forcefeed',1,0);
			a().state.busyTimer = 8;
			a().facingRot=90;
			aiTarget().facingRot=90;
			animate(aiTarget(), 'forcefed', 1,0);
		elseif(a().state.busyTimer <= 0.5) then
			aiTarget():setPosition(a().position.X - 1, a().position.Y);
			aiTarget().mountedOn = '';
			a().mountedBy = '';
			a().state.busyTimer = 0;
			a().facingRot=90;
			a():useAction('dropExplode',0,1);
			aiTarget().state.busyTimer = 3;
			--animate(a(), 'dodge',1,0);
			animate(aiTarget(), 'paincrouch',1,0);
			fx(a(), 'pop');
			fx(aiTarget(), 'pop');
			aiTarget().facingRot= 90;
		elseif(a().state.busyTimer <= 2.5) then
			fx(a(), 'redden');
		elseif(a().state.busyTimer <= 6.5) then
			fx(aiTarget(), 'intenseHeat', 'Red');
		end
		
	elseif(a().state.busyTimer <= 0) then
		if(aiTarget():getActorValue('stun') > 0) then
			a().movementSpeed = 2;
		elseif(aiTarget().state.busyTimer > 20) then
			a().movementSpeed = 2;
			if(getActorsDistanceInTiles(a().ID, a().aiTarget) <= 1 and a().movement.X == 0) then
				aiTarget().mountedOn = a().ID;
				fx(a(), 'step');
				fx(a(), 'scrundle');
				animate(a(), 'use');
				--fx(a(), 'bloodSpray');
				a().mountedBy = aiTarget();
				a().state.busyTimer = 1;
			end
		else
			if(aiTarget().state.busyTimer > 0) then
				a().movementSpeed = 12;
			else
				a().movementSpeed = 3;
			end
			engageAiTarget(a());
		end
	end
end
	
wait(-1);