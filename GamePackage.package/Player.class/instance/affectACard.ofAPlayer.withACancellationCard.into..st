use of cards
affectACard: aCard ofAPlayer: aPlayer withACancellationCard: aCancellationCard into: aGame
| cardToBeRemoved   |
	(cards select: [ :each | self aCard: aCancellationCard isEqualTo: each ]) isEmpty
		ifTrue: [ GameFailed signal: 'La carta instantanea no se encuentra en la mano del jugador' ]
		ifFalse: [ (cardToBeRemoved :=(aPlayer selectAPermanentCardToBePlayedEqualsTo: aCard)) isEmpty
					  
					  ifTrue: [ GameFailed signal: 'La carta permanente no se encuentra en juego' ]
					  ifFalse:[ aCancellationCard addAPermanentCardToBeRemoved: cardToBeRemoved. 
									aPlayer addAnInstantCardToBePlayed: aCancellationCard.
									cards remove: aCancellationCard.] 
					].
			
					     