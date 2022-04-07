wyrm

a():move()

if(a().aiTarget == '') then
	if(detectEnemy(a().ID)) then
		a():playSpeechSound(); engageAiTarget(a()); 
		a().aggressiveness = 4; a().movementSpeed = 1;
	end 
else
	if(not zm.safe or a().aggressiveness > 2) then
		actionOnSelf(a(), 'quakeAttack');
	end
	
	if(getActorsDistance(a().ID, a().aiTarget) > 16) then
		a().movementSpeed = 30;
	elseif(getActorsDistance(a().ID, a().aiTarget) <= 1.5) then
		a().movementSpeed = 3.5;
	elseif(a().movementSpeed < getActorsDistanceInTiles(a().ID, a().aiTarget)) then
		a().movementSpeed = a().movementSpeed + 0.048 * getActorsDistanceInTiles(a().ID, a().aiTarget);
	elseif(a().movementSpeed < a().state.path.Count) then
		a().movementSpeed = a().movementSpeed + 0.1;
	elseif(a().movementSpeed > 8) then
		a().movementSpeed = a().movementSpeed - 0.13;
	end
		
	
	if(a().aggressiveness < 0 and zm.safe) then
		if(a().bravery > 0 and getActorsDistanceInTiles(a().ID, a().aiTarget) > 1) then
			goto 'wyrm_tongueAtk';
		elseif(a().bravery <= 0) then
			goto 'wyrm_flee';
		end
	elseif(zm.safe) then
		a().aggressiveness = a().aggressiveness - 0.05;
	else
		a().aggressiveness = 4;
	end

	
end


wait(-1)