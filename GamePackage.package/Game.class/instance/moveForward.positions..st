behavior
moveForward: aPlayer positions: anAmountOfPositions
	| aux |
	aux := aPlayer position + anAmountOfPositions.
	aPlayer changePosition: aux % board amountOfSquares.
	aPlayer modifyLaps: aPlayer lapsTravelled + (aux / board amountOfSquares) integerPart