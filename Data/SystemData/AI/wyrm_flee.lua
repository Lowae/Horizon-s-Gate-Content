wyrm_flee

wait(-1)


if(a().aiTarget ~= '') then
	a():lookAtActor(a().aiTarget);
	a().aiTarget = '';
	a().aggressiveness = 1;
end

if(a().aggressiveness > 0) then
	if(detectEnemy(a().ID) and not zm.safe and a().bravery > 0) then
		goto 'wyrm';
	else
		a():lookAtActor(a().aiTarget);
		a().aiTarget = '';
		a().aggressiveness = a().aggressiveness - 0.1;
		if(a().aggressiveness <= 0) then
			a():lookAtActor(a().aiTarget);
			a().facingRot = a().facingRot + 180;
		end
	end
end

if(a().aggressiveness <= 0) then
	a().movementSpeed = 8;
	moveV(a(), a():getFacingDirection_Vector2());
	a().movementSpeed = 11;
	if(a():bringTrailingPartsInward(0.05)) then
		fx(a(), 'thunder');
		fx(a(), 'sandSplash');
		zm:removeActor(a().ID);
	else
		actionOnSelf(a(), 'quakeAttack');
	end
	a().movementSpeed = 3.3;
end

