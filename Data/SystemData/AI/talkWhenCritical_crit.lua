talkWhenCritical_crit

a():move();

signal_setResponse('critical', 'if(zm.combatMode) then a():removeAVEffect("", false, "", true); talk(a().ID, a().dialogNodeID .. "_crit"); end');

wait(-1);