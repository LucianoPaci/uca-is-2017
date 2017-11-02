as yet unclassified
move: aPlayer positions: anAmountOfPositions
	| aux |
	aux := aPlayer position + anAmountOfPositions.
	aPlayer changePreviousPosition: aPlayer position.
	aPlayer changePreviousLap: aPlayer lapsTravelled.
	
	aux <= 0
		ifTrue: [ aPlayer modifyLaps: aPlayer lapsTravelled - (((aux / board squares size) integerPart) abs)]
		ifFalse: [ aPlayer modifyLaps: aPlayer lapsTravelled + (aux / board squares size) integerPart ].
		
	(aux % board squares size) abs ==0
		ifTrue: [ aPlayer changePosition: 1]
		ifFalse:[aPlayer changePosition: (aux % board squares size) abs].
	