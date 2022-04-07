reacher

if(a().state.childActors.Count > 0 or not zm.safe) then
	detectEnemy(a().ID);
end

if(a():getActorValue('stun') > 0 and child() ~= null) then
	removeChild();
end

if(a().aiTarget ~= '' or a().state.childActors.Count > 0) then
	if(a().state.childActors.Count == 0 and a().state.busyTimer <= 0) then
		a():lookAtActor(a().aiTarget);
		a():playSpeechSound(1,rand());
		spawnActor(a(), 'reacherHand');
	elseif(child() ~= null) then
		animate(a(), 'reacherCrouchAtk', 1, 0, true, false);
		child():setTrailPartsPos(a().position,30);
		
		if(child().aiTarget ~= '') then
			a().aiTarget = child().aiTarget;
		elseif(a().aiTarget ~= '') then
			child().aiTarget = a().aiTarget;
		end
		
			
		--withdraw if stunned or too far away
		if(a().aiTarget == ''
			or child().aiTarget == ''
			or aiTarget().positionTC:distanceInTiles(a().positionTC) > 28
			or a():getActorValue('stun') > 0
			or child():getActorValue('stun') > 0 
			or getActorsDistanceInTiles(a().ID, child().ID) > 27
			or child():getTailTC(2):distanceInTiles(a().positionTC) > 3) then
			
			child().movementSpeed = 20;
			child():updateActiveEffects(80);
			
			if(child().aiTarget ~= '') then
				if(childAiTarget().mountedOn == '' or childAiTarget().mountedOn == child().ID) then
					childAiTarget():removeAVEffect('', false, 'immob');
					childAiTarget().mountedOn = '';
				end
				child().aiTarget = '';
				child().mountedBy = '';
			end
			
		end
		
		if(child().movementSpeed == 20) then
			--reel the child in
			child():moveTowardTail();
			animate(a(), 'crouch', 1, 0, true, false);
			if(getActorsDistanceInTiles(a().ID, child().ID) <= 1) then
				removeChild();
				a().state.busyTimer = 2;
			end
		
		elseif(child().aiTarget ~= '' and a().state.busyTimer <= 0) then
		
			if(getActorsDistance(child().ID, childAiTarget().ID) <= 1.5) then
				
				--grab! but only if he's not already grabbed
				if(childAiTarget().mountedOn == '') then
					actionOnTarget(child(), childAiTarget(), 'reacherHandGrab');
				end
				
				if(childAiTarget().mountedOn == '' or childAiTarget().mountedOn == child().ID) then
					if(childAiTarget():getActorValue('immob') > 0
						and compareV2(childAiTarget().movement.X,childAiTarget().movement.Y,0,0)) then
						aiTarget():applyAVEffect('immob', 1, 3);
						child().mountedBy = child().aiTarget;
						childAiTarget().mountedOn = child().ID;
						child():moveTowardTail();
					end
					
					if(child().mountedBy ~= '') then
						if(getActorsDistanceInTiles(a().ID, child().mountedBy) < 8) then
							a():playSpeechSound(0.1 * (12 - getActorsDistanceInTiles(a().ID, child().mountedBy)), 0.1 * (11 - getActorsDistanceInTiles(a().ID, child().mountedBy)) );
						end
					
						if(getActorsDistanceInTiles(a().ID, child().mountedBy) <= 1) then
							aiTarget():removeAVEffect('', false, 'immob');
							aiTarget():applyAVEffect('immob', 1, 8);
							
							--aiTarget().position = a():getFacingDirection_Vector2() + a().position;
							removeChild();
							engageAiTarget(a());
						end
					end
				end
				
			end
		end
		
	
	end
end


if(a().state.childActors.Count > 0) then
	wait(-1);
else
	wait(-2);
end