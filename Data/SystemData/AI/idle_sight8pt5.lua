idle_sight8pt5

a():move();

if(a().aiTarget == '') then
	if(detectEnemy(a().ID, true, 8.5) and a().state.busyTimer <= 0) then
		a():playSpeechSound(); engageAiTarget(a());
	end 
elseif(detectEnemy(a().ID, true, 8.5)) 
	then engageAiTarget(a());
end
	
wait(-1);