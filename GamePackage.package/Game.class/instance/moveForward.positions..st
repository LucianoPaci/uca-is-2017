behavior
moveForward: aPlayer positions: anAmountOfPositions
	| aux |
	aux := aPlayer position + anAmountOfPositions.
	aPlayer changePreviousPosition: aPlayer position.
	aux == board amountOfSquares
		ifTrue: [ aPlayer changePosition: 1 ]
	ifFalse:[aPlayer changePosition: (aux % board amountOfSquares) abs.
	aPlayer modifyLaps: aPlayer lapsTravelled + (aux / board amountOfSquares) integerPart].