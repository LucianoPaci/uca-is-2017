accessing
CheckIsAWinnerOfGame: aPlayer
	aPlayer lapsTravelled  >= laps
		ifTrue: [ winner := aPlayer ]