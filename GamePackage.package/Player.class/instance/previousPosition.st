accessing
previousPosition
	positions size >1
	ifTrue: [ ^ (positions at: positions size - 1) playerPosition ]
	ifFalse: [ ^ (positions at: positions size ) playerPosition  ]