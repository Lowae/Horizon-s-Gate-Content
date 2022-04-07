wyrm_tongueAtk

animate(a(), 's_HoldAttackPose',1,0,true);
a().intelligence = 1;

if(child() ~= null) then
	a():lookAtActor(child().ID)
end

if(compareV2(a().movement.X,a().movement.Y,0,0) and a().state.childActors.Count == 0) then
	a():lookAtActor(a().aiTarget);
	fx(a(), 'enemyBloodSpray');
	spawnActor(a(), 'wyrmtongue');
elseif(child() ~= null and not zm.safe or a().bravery <= 0) then
	child().movementSpeed = 20;
	if(child():moveToTail()) then
		removeChild();
		if(a().bravery > 0) then
			a().aggressiveness = 4;
			goto 'wyrm';
		else
			a().aggressiveness = 0;
			fx(a(), 'highRoar');
			goto 'wyrm_flee';
		end
	end 
elseif(child() ~= null and child():getActorValue('stun') > 0 or getActorsDistanceInTiles(a().ID, child().ID) > 34) then
	child().movementSpeed = 20;
	child():playSpeechSound(1,0.8 - a().bravery);
	child().armorPalette = 'pBloodyMess';
	if(getActorsDistanceInTiles(a().ID, child().ID) > 34) then a().bravery = 0; end
	
	if(child():moveToTail()) then
		child().armorPalette = 'pR';
		child():bringTrailingPartsInward(1)
		if(a().bravery > 0.5) then
			child().movementSpeed = 2;
		else
			child().movementSpeed = 1 + (0.5 - a().bravery) * 10;
		end
		child():updateActiveEffects(80);
		a().bravery = a().bravery - 0.1;
	end
end

wait(-1)