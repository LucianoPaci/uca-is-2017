accessing
checkIsAWinnerOfGame: aPlayer
	aPlayer lastPosition lap  >= laps
		ifTrue: [ winner := aPlayer ]