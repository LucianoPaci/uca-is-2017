accessing
selectAPermanentCardToBePlayedEqualsTo: aCard
	^ permanentCardsToBePlayed copy select: [ :each | aCard isEqualTo: each ]