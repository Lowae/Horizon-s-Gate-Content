idle_sight9pt5

a():move();

if(a().aiTarget == '') then
	if(detectEnemy(a().ID, true, 9.5) and a().state.busyTimer <= 0) then
		a():playSpeechSound(); engageAiTarget(a());
	end 
elseif(detectEnemy(a().ID)) 
	then engageAiTarget(a());
end
	
wait(-1);