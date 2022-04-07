talkWhenWithin3OfPlayer

a():move();
if(getActorsDistance(a().ID, player().ID) <= 3) then
	talk();
end 

wait(-1);