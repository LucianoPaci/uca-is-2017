as yet unclassified
move: aPlayer positions: anAmountOfPositions
	| aux |
	aux := aPlayer position + anAmountOfPositions.
	aPlayer changePreviousPosition: aPlayer position.
	aPlayer changePosition: (aux % board amountOfSquares) abs.
	(aux<0)ifTrue: [ aPlayer modifyLaps: aPlayer lapsTravelled -1].
	aPlayer modifyLaps: aPlayer lapsTravelled + (aux / board amountOfSquares) integerPart.
	