seekerZomb

a().intelligence = 0;
a().facingRot = a().facingRot - a().facingRot % 90;

signal_setResponse('allyKilled', 'signal_removeResponse("allyKilled"); a().aggressiveness = a().aggressiveness + 0.5; a():playSpeechSound(a().aggressiveness + 0.3,a().aggressiveness * 2); animate(a(), "shake", a().aggressiveness * 2,0,true,true,-1,true); a().state.busyTimer = 0.1; wait(0.1); a().aiTarget = player().ID; if(a().aggressiveness >= 1) then engageAiTarget(a()); end');

if(a().aggressiveness < 1 and a().state.busyTimer <= 0) then
	if(detectEnemy(a().ID)) then
		if(getFacingDifference(a(), aiTarget(), true) <= 0) then
			if(a().aggressiveness >= 1) then
			else
				a().aggressiveness = a().aggressiveness + 0.15;
				a():playSpeechSound(a().aggressiveness + 0.3,a().aggressiveness * 2);
				animate(a(), 'shake', a().aggressiveness * 2,0,true,true,-1,true);
				a().state.busyTimer = 0.1;
				wait(0.1);
				if(a().aggressiveness >= 1) then
					engageAiTarget(a());
				end
			end
		else
			a().aiTarget = '';
		end
	end 
elseif(detectEnemy(a().ID)) then
	if(a().aggressiveness >= 1) then
	
	else
		a().aiTarget = '';
	end
end

a().facingRot = a().facingRot - a().facingRot % 90;

wait(-2);