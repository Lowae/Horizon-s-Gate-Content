wyrm_cartchase


if(a().bravery <= 0 and not isTriggered(0)) then
	a().aggressiveness = 0;
	fx(a(), 'highRoar');
	setTriggered(0);
	a().state.busyTimer = 15;
elseif(a().aiTarget == '') then
	if(detectEnemy(a().ID)) then
		a():playSpeechSound(); engageAiTarget(a()); 
		a().movementSpeed = 1;
	end 
else
	actionOnSelf(a(), 'quakeAttack');
	
	if(child() == null) then
		a().movementSpeed = a().movementSpeed + 0.045 * getActorsDistanceInTiles(a().ID, a().aiTarget);
		a():move();
	end
		
	
	if(child() ~= null) then
		
		a().aiTarget = player().ID;
		a():setPosition(aiTarget().position.X - 6, -1);
		animate(a(), 's_HoldAttackPose',1,0,true);
		
		--do first time child setup
		if(child().movementType == '') then
			child():setPosition(a().position.X + 2, a().position.Y);
			--child().movement.X = 1;
			child():setSpecialMovementType('burrowing');
			child().ai.script = 'wanderWyrmT';
			child().facingRot = 0;
			setChildTrailPartsPosInFrontOfMe(getActorsDistance(a().ID, child().ID),-1, 1);
		end
		
		if(a().state.busyTimer <= 0) then
			if(child().position.X < aiTarget().position.X) then
				a().state.busyTimer = getActorsDistanceInTiles(child().ID, a().aiTarget) - 1;
			else
				a().state.busyTimer = 0;
			end
			
		end
		
		child():setPosition(a().position.X + 6 - a().state.busyTimer, a().position.Y);
		
		
		
		a().facingRot = 0;
		child().facingRot = 0;
		child().movementSpeed = 0;
		--child().aiTarget= a().aiTarget;
		setChildTrailPartsPosInFrontOfMe(getActorsDistance(a().ID, child().ID),-1, 1);
		
		if(child():getActorValue('stun') > 0 or getActorsDistanceInTiles(a().ID, child().ID) > 34) then
			a():setPosition(a().position.X - 1, -1, false);
			a().state.busyTimer = 0;
			child():playSpeechSound(1,0.8 - a().bravery);
			removeChild();
			a().bravery = a().bravery - 0.1;
			
		elseif(getActorsDistance(child().ID, a().aiTarget) <= 1.5) then
			a().state.busyTimer = 0;
			removeChild();
			actionOnTarget(a(),aiTarget(), 'rangedBite');
		end
	else
		if(getActorsDistance(a().ID, a().aiTarget) <= 6 and a().state.childActors.Count == 0) then
			animate(a(), 's_HoldAttackPose',1,0,true);
			a():lookAtActor(a().aiTarget);
			a().state.busyTimer = 0;
			--fx(a(), 'enemyBloodSpray');
			spawnActor(a(), 'wyrmtongue', false, true);
		end
	
	end

	
end


wait(-1)