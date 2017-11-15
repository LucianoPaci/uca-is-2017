playing
move: aPlayer positions: anAmountOfPositions
	|  newLap newPosition |
	newPosition := aPlayer currentPosition + anAmountOfPositions.

	newPosition <= 0
		ifTrue: [ newLap := aPlayer lapsTravelled - (newPosition / board squares size) integerPart abs ]
		ifFalse: [ newLap := aPlayer lapsTravelled + (newPosition / board squares size) integerPart ].
	(newPosition % board squares size) abs == 0
		ifTrue: [ aPlayer changePosition: 1 andLapsTo: newLap ]
		ifFalse: [ aPlayer changePosition: (newPosition % board squares size) abs andLapsTo: newLap ]