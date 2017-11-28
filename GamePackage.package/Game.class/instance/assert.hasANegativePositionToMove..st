playing
assert: aPlayer hasANegativePositionToMove: newPosition
	| newLap |
	(newPosition <= 0)
		ifTrue: [ newLap := aPlayer lastPosition lap - (newPosition / board numberOfSquares) integerPart abs ]
		ifFalse: [ newLap := aPlayer lastPosition lap 	+ (newPosition / board numberOfSquares) integerPart ].
	^ newLap