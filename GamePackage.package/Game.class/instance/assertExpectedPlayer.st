playing
assertExpectedPlayer
	indexOfExpectedPlayer := (indexOfExpectedPlayer >= self players size)
		ifTrue: [ 1 ]
		ifFalse: [ indexOfExpectedPlayer + 1 ]