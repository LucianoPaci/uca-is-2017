use of cards
affectAPlayer: aPlayer withAnInstantCard: aCard into: aGame
	| cardToBeAdded |
	(cardToBeAdded := cards select: [ :each | aCard isEqualTo: each ]) isEmpty
		ifTrue: [ GameFailed signal: 'La carta instantanea no se encuentra en la mano del jugador' ]
		ifFalse: [ aCard addToAPlayer: aPlayer fromAGame: aGame.
			cards remove: aCard ]