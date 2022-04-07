chase_forever

signal_setResponse('huntPlayer', 'a().aiTarget = player().ID;');

if(a().aiTarget == '') then
	if(detectEnemy(a().ID) and a().state.busyTimer <= 0) then
		a():lookAtActor(a().aiTarget);
		a():playSpeechSound();
		signal_send('stopHiding', 12, a().aiTarget);
	end 
else
	signal_send('stopHiding', 12, a().aiTarget);
	if(getActorsDistance(a().ID, a().aiTarget) <= 2) then 	
		engageAiTarget(a());
	end
end

a():move();
	
wait(1);