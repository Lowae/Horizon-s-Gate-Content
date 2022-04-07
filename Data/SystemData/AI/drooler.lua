drooler

detectEnemy(a().ID);
if(a().aiTarget ~= '' and a().state.busyTimer <= 0) then
	if(getActorsDistanceInTiles(a().ID, aiTarget().ID) <= 1) then
		engageAiTarget(a());
	elseif(not zm:anyItemsAt(a().positionTC)) then
		actionOnSelf(a(), 'minor_acid_drool');
		--a().state.busyTimer = 0.1;
		--a().movement.X = 0;
		--a().movement.Y = 0;
	end
end

if(rand() > 0.8) then
	a():moveRandom(1)
else
	a():move();
end

wait(-2);