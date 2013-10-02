nsws
====

command line WebSocket Client for Mac.


###Send message with standard input

	tail -f something.txt | nsws -t ws://127.0.0.1:8823
	
will send tailed text to ws://127.0.0.1:8823 as WebSocket client.