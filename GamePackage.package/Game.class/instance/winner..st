accessing
winner: aPlayer
	aPlayer lapsTravelled >= laps
	ifTrue: [ winner:= aPlayer ]