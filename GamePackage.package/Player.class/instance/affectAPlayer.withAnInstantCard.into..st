use of cards
affectAPlayer: aPlayer withAnInstantCard: aCard into: aGame
	| cardToBeAdded |
	(cardToBeAdded := self cards select: [ :each | self aCard: aCard isEqualTo: each ]) isEmpty
		ifTrue: [ InstantCardIsNotInPlayerDeckError signal: 'La carta instantanea no se encuentra en la mano del jugador' ]
		ifFalse: [ aCard addToAPlayer: aPlayer fromAGame: aGame.
			self cards remove: aCard ]