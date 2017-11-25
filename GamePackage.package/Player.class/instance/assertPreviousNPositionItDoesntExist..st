accessing
assertPreviousNPositionItDoesntExist: anAmountOfPositions
	^ positions size > anAmountOfPositions
		ifTrue: [ positions at: positions size - anAmountOfPositions ]
		ifFalse: [ positions at: 1 ]