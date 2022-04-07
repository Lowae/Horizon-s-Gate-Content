talkWhenCritical

a():move();

signal_setResponse('critical', 'if(zm.combatMode) then a():removeAVEffect("", false, "", true); signal_removeResponse("critical"); talk(); end');

wait(-1);