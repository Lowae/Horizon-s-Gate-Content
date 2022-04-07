idle_waitAnim

a():move();

if(a().aiTarget == '') then
	animate(a(), "wait");
	if(detectEnemy(a().ID) and a().state.busyTimer <= 0) then
		a().state.busyTimer = 1.4;
		animate(a(), "alert", 1, 0, false, 0, true);
	end 
elseif(detectEnemy(a().ID)) 
	then 
		a().aiTarget = '';
		goto("idle");
end
	
wait(-2);