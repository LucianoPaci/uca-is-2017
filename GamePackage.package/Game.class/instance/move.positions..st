movement
move: aPlayer positions: anAmountOfPositions
	anAmountOfPositions ~~ 0
		ifTrue: [
			anAmountOfPositions > 0
			
			ifTrue:[	 self moveForward: aPlayer positions: anAmountOfPositions 	]
			ifFalse: [ self moveBackwards: aPlayer positions: anAmountOfPositions ]
		]
		