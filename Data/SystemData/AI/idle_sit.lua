idle_sit

a():move();

if(a().aiTarget == '') then
	animate(a(), "sit");
	if(detectEnemy(a().ID) and a().state.busyTimer <= 0) then
		a().state.busyTimer = 1;
		animate(a(), "idle", 1, 0, false, 0, true);
	end 
elseif(detectEnemy(a().ID)) 
	then 
		a().aiTarget = '';
		goto("idle");
end
	
wait(-1);