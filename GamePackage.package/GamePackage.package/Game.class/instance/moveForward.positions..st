behavior
moveForward: aPlayer positions: anAmountOfPositions
	| aux |
	aux := aPlayer position + anAmountOfPositions.
	aPlayer changePreviousPosition: aPlayer position.
	aPlayer changePosition: (aux % board amountOfSquares) abs.
	aPlayer modifyLaps: aPlayer lapsTravelled + (aux / board amountOfSquares) integerPart
	
