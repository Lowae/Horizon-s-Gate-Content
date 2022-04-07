idle_sleep

a():move();


--wake up from noise, or if combat starts
signal_setResponse('attractAttention', 'a():removeAVEffect("", false, "sleep"); a():removeAVEffect("sleep"); fx(a(), "question")');
signal_setResponse('combatStart', 'a():removeAVEffect("", false, "sleep"); a():removeAVEffect("sleep");');

--wake up if player is adjacent
if(getActorsDistanceInTiles(a().ID, player().ID) <= 1) then
	a():removeAVEffect("", false, "sleep");
	a():removeAVEffect("sleep");
	a().aiTarget = "";
	fx(a(), "question");
	wait(-1);
end

if(a().aiTarget == '' and a().state.busyTimer <= 0) then
--if awake, look in each direction, then sleep again.
	if(a():getActorValue("sleep") <= 0 and a().aiVarX < 5) then

		if(detectEnemy(a().ID)) then
			a():playSpeechSound(); engageAiTarget(a());
		else
			if(a().aiVarX > 0) then
				a().facingRot = a().facingRot + 90;
			end
			a().state.busyTimer = 0.6;
			a().aiVarX = a().aiVarX + 1;
			wait(-1);
			return;
		end
	end

	if(a().aiTarget == '' and a().state.busyTimer <= 0) then
		a().aiVarX = 0;
		a():applyAVEffect("sleep", 1, -1);
	end
end
	
wait(-1);