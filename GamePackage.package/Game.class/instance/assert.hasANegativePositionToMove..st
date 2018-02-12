playing
assert: aPlayer hasANegativePositionToMove: newPosition
	| newLap |
	newLap := newPosition <= 0
		ifTrue: [ aPlayer positions last lap
				- (newPosition / board squares size) integerPart abs ]
		ifFalse: [ aPlayer positions last lap
				+ (newPosition / board squares size) integerPart ].
	^ newLap