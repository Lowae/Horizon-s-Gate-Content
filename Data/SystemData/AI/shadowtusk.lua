shadowtusk

if(a().state.busyTimer <= 0) then
	if(not zm.safe) then
		a():useAction('tuskAttack',0,0);
		a().state.busyTimer = 11;
	end
end
	
wait(-1);