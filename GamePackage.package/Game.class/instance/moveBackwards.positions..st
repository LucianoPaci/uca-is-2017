movement
moveBackwards: aPlayer positions: anAmountOfPositions
	| aux |
	aux := aPlayer position + anAmountOfPositions.
	aPlayer changePreviousPosition: aPlayer position.
	aux < 0
	ifTrue: [ aPlayer changePosition: (board amountOfSquares + aux + 1).
		
		aPlayer modifyLaps: aPlayer lapsTravelled - (aPlayer lapsTravelled % self laps) ].
	
	aPlayer changePosition: (aux % board amountOfSquares) abs.
	aPlayer modifyLaps: aPlayer lapsTravelled + (aux / board amountOfSquares) integerPart