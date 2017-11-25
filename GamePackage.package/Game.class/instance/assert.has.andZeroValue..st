playing
assert: aPlayer has: newLap andZeroValue: newPosition
	(newPosition % board numberOfSquares) abs == 0
		ifTrue: [ aPlayer changePosition: 1 andLapsTo: newLap ]
		ifFalse: [ aPlayer
				changePosition: (newPosition % board numberOfSquares) abs
				andLapsTo: newLap ]