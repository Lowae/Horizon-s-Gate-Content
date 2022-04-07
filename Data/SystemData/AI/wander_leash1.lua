wander_leash1

a():moveRandom(a().aggressiveness * 0.5, true, 1);

if(a().aiTarget == '') then
	if(detectEnemy(a().ID) and a().state.busyTimer <= 0) then
		a():playSpeechSound(); engageAiTarget(a());
	end 
elseif(detectEnemy(a().ID)) 
	then engageAiTarget(a());
end
	
wait(-1);