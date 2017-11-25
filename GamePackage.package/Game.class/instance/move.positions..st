playing
move: aPlayer positions: anAmountOfPositions
	| newLap newPosition |
	newPosition := aPlayer currentPosition + anAmountOfPositions.
	newLap := self 	assert: aPlayer hasANegativePositionToMove: newPosition.
	self assert: aPlayer has: newLap andZeroValue: newPosition