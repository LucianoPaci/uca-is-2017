as yet unclassified
move: aPlayer positions: anAmountOfPositions
	|  newLap newPosition |
	newPosition := aPlayer currentPosition + anAmountOfPositions.
	"aPlayer changePreviousPosition: aPlayer position."	"should be pointing previous (playerPosition) element in collection"
	"aPlayer changePreviousLap: aPlayer lapsTravelled.	"	"should be pointing previous (playerLaps) element in collection""Not needed?"
	newPosition <= 0
		ifTrue: [ newLap := aPlayer lapsTravelled - (newPosition / board squares size) integerPart abs ]
		ifFalse: [ newLap := aPlayer lapsTravelled + (newPosition / board squares size) integerPart ].
	(newPosition % board squares size) abs == 0
		ifTrue: [ aPlayer changePosition: 1 andLapsTo: newLap ]
		ifFalse: [ aPlayer changePosition: (newPosition % board squares size) abs andLapsTo: newLap ]