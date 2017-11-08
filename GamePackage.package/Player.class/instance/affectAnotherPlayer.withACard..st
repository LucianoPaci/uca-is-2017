as yet unclassified
affectAnotherPlayer: aPlayer withACard: aCard
| aPermanentCard |
	
	((aPermanentCard := cards select: [ :each | self  aCard:aCard isEqualsTo:  each ]) isEmpty)
	
	ifTrue:[PermanentCardIsNotInPlayerDeckError signal: 'La carta no se encuentra en la mano del jugador']
	ifFalse: [aPlayer permanentCardsToBePlayedAddedByAnotherPlayer add: aPermanentCard ].