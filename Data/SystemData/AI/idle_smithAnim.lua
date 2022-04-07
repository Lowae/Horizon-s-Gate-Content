idle_smithAnim

a():move();

signal_setResponse('combatStart', 'animate(a(), "idle"); goto("idle")');

canChangeFromBaseScript(false);

--don't do anything if the anvil is occupied
if(zm:numItemsAt(getTCInFrontOf(a()), true) > 1) then
	a().aiVarX = 15;
	setGlobal("temperSwordGlow", 0);
	a().aiVarY = 2;
	a():animateIdle();
	wait(20);
else

	--grab new item after talking
	if(isDialog()) then
		a().aiVarX = 15;
		setGlobal("temperSwordGlow", 0);
		a().aiVarY = 2;
	end

	if(a().animator:timeInAnim() > 5 and a().animator.animationName == "smith_swapWeapons") then
		setGlobal("temperSwordGlow", 1);
	end
	if(a().animator:timeInAnim() > 4 and a().animator.animationName == "smith_quench") then
		setGlobal("temperSwordGlow", 0);
	end

	if(isDialog() ~= true and a():isItTimeToAttackYet()) then
		if(a().state.busyTimer <= 0) then
			if(a().aiVarX < 15) then
				a().aiVarX = a().aiVarX + 1;
				animate(a(), "smithHammer", 1, 0, false, true);
			else 
				if(a().aiVarY == 1) then
					animate(a(), "smith_quench", 1, 0, false, true);
				elseif(a().aiVarY == 2) then
					animate(a(), "smith_swapWeapons", 1, 0, false, true);
				else
					animate(a(), "smith_rest", 1, 0, false, true);
					a().aiVarX = 0;
				end
				a().aiVarY = a().aiVarY + 1;
				if(a().aiVarY > 3) then
					a().aiVarY = 0;
				end
			end
		end
	end

end
	
wait(0.1);