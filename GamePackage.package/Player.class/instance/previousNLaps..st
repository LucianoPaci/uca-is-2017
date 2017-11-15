accessing
previousNLaps: nLaps
	positions size >nLaps
	ifTrue: [ ^ (positions at: positions size - nLaps) playerLaps ]
	ifFalse: [ ^ (positions at: 1 ) playerLaps  ]