idle_ignoreAttention

--prevent attractAttention from messing up your routine
a().ai_lua.allowChangingFromBaseScript = false;

a():move();

if(a().aiTarget == '') then
	if(detectEnemy(a().ID) and a().state.busyTimer <= 0) then
		a():playSpeechSound(); engageAiTarget(a());
	end 
elseif(detectEnemy(a().ID)) 
	then engageAiTarget(a());
end
	
wait(-2);