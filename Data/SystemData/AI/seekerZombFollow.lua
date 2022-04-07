seekerZombFollow


if(a().aiTarget == '') then
	addToParty(a().ID, false);
end


a():lookAtActor(a().aiTarget);

if(a().aiTarget ~= '' and a().aggressiveness >= 1) then
	a():playSpeechSound(0.8,1);
end

if(a().aggressiveness < 1 and a().state.busyTimer <= 0) then
	if(detectEnemy(a().ID)) then
		if(getFacingDifference(a(), aiTarget(), true) <= 0) then
			if(a().aggressiveness >= 1) then
				actionOnTarget(a(), aiTarget(), 'seekerZombAttack');
				a():lookAtActor(a().aiTarget);
				a().aggressiveness = 0;
				a().state.busyTimer = 0;
			else
				a():playSpeechSound(a().aggressiveness + 0.3,a().aggressiveness);
				a().aggressiveness = a().aggressiveness + 0.1;
				animate(a(), 'shake', a().aggressiveness * 2,0,true,true,-1,true);
				a().state.busyTimer = 0.1;
				wait(0.1);
			end
		end
	end 
elseif(detectEnemy(a().ID)) then
	if(a().aggressiveness >= 1) then
		actionOnTarget(a(), aiTarget(), 'seekerZombAttack');
		a():lookAtActor(a().aiTarget);
		a().aggressiveness = 0;
	end
end

if(a():getActorValue('stun') > 0) then
	a():updateActiveEffects(1);
	a().aggressiveness = 0.2;
elseif(a():getActorValue('HP') < a():getActorValue('HPMax')) then
	fx(a(), 'enemyBloodSpray');
	zm:removeActor(a().ID, false, true);
end

wait(-1)