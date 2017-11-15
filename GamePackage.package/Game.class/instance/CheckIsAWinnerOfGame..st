accessing
checkIsAWinnerOfGame: aPlayer
	aPlayer lapsTravelled  >= laps
		ifTrue: [ winner := aPlayer ]