nsws
====

command line WebSocket Client for Mac.
ver 0.9.0

##Usage
###Send message via standard-input

	tail -f something.txt | nsws -t ws://127.0.0.1:8823
	
will send tailed text to ws://127.0.0.1:8823 as WebSocket client.


###Send specific 1st Message and kill

	nsws -t ws://127.0.0.1:8823 -m "Here comes daredevil!!" --q
	
	
	
###Send specific 1st Message then listen standard-input

	tail -f something.txt | nsws -t ws://127.0.0.1:8823 -m "Here comes daredevil!!"
	
	
##Installation 
* build xcode project
* find nsws.app from Product
* nsws is in the nsws.app/Contents/MacOS folder.
* get it!.