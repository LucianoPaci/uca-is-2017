playing
assert: aPlayer hasANegativePositionToMove: newPosition
	| newLap |
	(newPosition <= 0)
		ifTrue: [ newLap := (aPlayer positions last) lap - (newPosition / board squares size) integerPart abs ]
		ifFalse: [ newLap := (aPlayer positions last) lap 	+ (newPosition / board squares size) integerPart ].
	^ newLap