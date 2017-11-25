playing
assert: aPlayer hasANegativePositionToMove: newPosition
	| newLap |
	(newPosition <= 0)
		ifTrue: [ newLap := aPlayer lapsTravelled - (newPosition / board numberOfSquares) integerPart abs ]
		ifFalse: [ newLap := aPlayer lapsTravelled 	+ (newPosition / board numberOfSquares) integerPart ].
	^ newLap