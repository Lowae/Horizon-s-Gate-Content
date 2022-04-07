wait_untilCalled

a():move();

signal_setResponse('stopHiding', 'goto("enterCombat")');
signal_setResponse('stopWaiting', 'goto("enterCombat")');

	
wait(-2);