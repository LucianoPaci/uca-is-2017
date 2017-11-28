accessing
selectAPermanentCardToBePlayedEqualsTo: aCard
	permanentCardsToBePlayed indexOf: aCard ifAbsent: [GameFailed signal: 'La carta permanente no se encuentra en juego'].
	^ permanentCardsToBePlayed  select: [ :each | aCard isEqualTo: each ]