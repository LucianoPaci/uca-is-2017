accessing
winnerOfGame: aPlayer
	(aPlayer lapsTravelled  >= laps) ifTrue: [winner:=aPlayer ].