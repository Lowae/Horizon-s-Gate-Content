talkWhenWithin5OfPlayer

a():move();
if(getActorsDistance(a().ID, player().ID) <= 5) then
	talk();
end 

wait(-1);