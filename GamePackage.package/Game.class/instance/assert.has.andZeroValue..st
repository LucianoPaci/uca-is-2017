playing
assert: aPlayer has: newLap andZeroValue: newPosition
	(newPosition % board squares size) abs == 0
		ifTrue: [ aPlayer changePosition: 1 andLapsTo: newLap ]
		ifFalse: [ aPlayer
				changePosition: (newPosition % board squares size) abs
				andLapsTo: newLap ]