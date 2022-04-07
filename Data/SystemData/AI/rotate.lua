rotate

a():move();

if(a().aiTarget == '') then
	if(detectEnemy(a().ID) and a().state.busyTimer <= 0) then
		a():playSpeechSound(1,0.2); engageAiTarget(a());
	elseif(a().state.busyTimer <= 0) then
		a().facingRot = a().facingRot + 1;
	
		
	end 
elseif(detectEnemy(a().ID)) 
	then engageAiTarget(a());
end
	
wait(-1);