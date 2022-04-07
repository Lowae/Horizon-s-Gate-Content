cart

canChangeFromBaseScript(false);

if(a().mountedBy ~= '') then
	
	if(a():canMove(a():getFacingDirection_Vector2())) then
		mountedBy().state.busyTimer=0.1;
		animate(mountedBy(), "kneel");
		a():move(a():getFacingDirection_Vector2());
	elseif(a():canMove(a():getFacingDirection_Vector2(90))) then
		mountedBy().state.busyTimer=0.1;
		animate(mountedBy(), "kneel");
		a():move(a():getFacingDirection_Vector2(90));
	elseif(a():canMove(a():getFacingDirection_Vector2(-90))) then
		mountedBy().state.busyTimer=0.1;
		animate(mountedBy(), "kneel");
		a():move(a():getFacingDirection_Vector2(-90));
	else

	end
	
	if(a().state.busyTimer <= 0 and
		not compareV2(a().movement.X,a().movement.Y,0,0)) then
		a():playSpeechSound(rand() - 0.3,rand() * 0.2);
	end
	
end

wait(-1);