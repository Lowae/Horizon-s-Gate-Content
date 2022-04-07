r

if(a():getActorValue("charging") <= 0 and a().state.busyTimer <= 0) then
	a():useAttack();
end
	
wait(-1);