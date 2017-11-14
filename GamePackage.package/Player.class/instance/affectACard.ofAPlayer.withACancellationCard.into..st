as yet unclassified
affectACard: aCard ofAPlayer: aPlayer withACancellationCard: aCancellationCard into: aGame
| cardToBeRemoved  cancellationCards |
	(self cards select: [ :each | self aCard: aCancellationCard isEqualTo: each ]) isEmpty
		ifTrue: [ InstantCardIsNotInPlayerDeckError signal: 'La carta instantanea no se encuentra en la mano del jugador' ]
		ifFalse: [ (cardToBeRemoved :=((aPlayer permanentCardsToBePlayed) select:  [:each | self  aCard:aCard isEqualTo:  each ])) isEmpty
					  
					  ifTrue: [ PermanentCardIsNotInPlayerDeckError signal: 'La carta permanente no se encuentra en juego' ]
					  ifFalse:[ aCancellationCard addAPermanentCardToBeRemoved: cardToBeRemoved. 
									cancellationCards := OrderedCollection new.
									cancellationCards add: aCancellationCard.
									aPlayer addInstantCardsToBePlayed: cancellationCards.
									self cards remove: aCancellationCard.].
					].
			
					     