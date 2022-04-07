idle_omni8

a():move();

if(a().aiTarget == '') then
	if(seekNearestEnemyActor(a().ID, 8, true, 360) and a().state.busyTimer <= 0) then
		a():playSpeechSound(); engageAiTarget(a());
	end 
elseif(seekNearestEnemyActor(a().ID, 8, true, 360)) 
	then engageAiTarget(a());
end
	
wait(-1);