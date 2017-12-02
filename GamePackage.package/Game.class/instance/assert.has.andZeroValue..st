playing
assert: aPlayer has: newLap andZeroValue: newPosition
	(newPosition % board squares size) abs == 0
		ifTrue: [ aPlayer changePosition: 1 lapsTo: newLap andNumberOfSquaresTravelledTo: 0]
		ifFalse: [ aPlayer
			
				changePosition: (((newPosition) abs % board squares size) ) +1 
				lapsTo: newLap 
				andNumberOfSquaresTravelledTo: ((newPosition)abs % board squares size) 
				]