playing
move: aPlayer positions: anAmountOfPositions
	|  newLap newPosition |
	newPosition := aPlayer currentPosition + anAmountOfPositions.

	newPosition <= 0
		ifTrue: [ newLap := aPlayer lapsTravelled - (newPosition / board numberOfSquares ) integerPart abs ]
		ifFalse: [ newLap := aPlayer lapsTravelled + (newPosition / board numberOfSquares) integerPart ].
	(newPosition % board numberOfSquares) abs == 0
		ifTrue: [ aPlayer changePosition: 1 andLapsTo: newLap ]
		ifFalse: [ aPlayer changePosition: (newPosition % board numberOfSquares) abs andLapsTo: newLap ]