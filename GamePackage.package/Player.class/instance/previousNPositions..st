accessing
previousNPositions: nPositions
	positions size >nPositions
	ifTrue: [ ^ (positions at: positions size - 1) playerPosition ]
	ifFalse: [ ^ (positions at: 1 ) playerPosition  ]