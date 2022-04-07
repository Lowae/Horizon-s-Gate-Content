wander_leash5_slow

a():moveRandom(a().aggressiveness * 0.1, true, 5);

if(a().aiTarget == '') then
	if(detectEnemy(a().ID) and a().state.busyTimer <= 0) then
		a():playSpeechSound(); engageAiTarget(a());
	end 
elseif(detectEnemy(a().ID)) 
	then engageAiTarget(a());
end
	
wait(-1);