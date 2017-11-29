playing
assert: aPlayer hasANegativePositionToMove: newPosition
	| newLap |
	(newPosition <= 0)
		ifTrue: [ newLap := (aPlayer positions last) lap - (newPosition / board numberOfSquares) integerPart abs ]
		ifFalse: [ newLap := (aPlayer positions last) lap 	+ (newPosition / board numberOfSquares) integerPart ].
	^ newLap