behavior
moveForward: aPlayer positions: anAmountOfPositions intoABoard: aBoard
	| aux |
	aux:= aPlayer position + anAmountOfPositions.
	aPlayer changePosition: (aux % aBoard amountOfSquares ).
	aPlayer modifyLaps: (aPlayer lapsTravelled ) + ((aux / (aBoard amountOfSquares) ) integerPart) .
	