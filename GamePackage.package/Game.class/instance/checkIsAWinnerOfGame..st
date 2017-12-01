accessing
checkIsAWinnerOfGame: aPlayer
	(aPlayer positions last) lap  >= laps
		ifTrue: [ winner := aPlayer ]