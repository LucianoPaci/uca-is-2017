playing
assertExpectedPlayer
	indexOfExpectedPlayer := (indexOfExpectedPlayer >= self numberOfPlayers)
		ifTrue: [ 1 ]
		ifFalse: [ indexOfExpectedPlayer + 1 ]