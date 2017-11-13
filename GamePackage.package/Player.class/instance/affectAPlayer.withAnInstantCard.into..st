as yet unclassified
affectAPlayer: aPlayer withAnInstantCard: aCard into: aGame
	| cardToBeAdded |
	(cardToBeAdded := self cards select: [ :each | self aCard: aCard isEqualTo: each ]) isEmpty
		ifTrue: [ InstantCardIsNotInPlayerDeckError signal: 'La carta no se encuentra en la mano del jugador' ]
		ifFalse: [ aCard addToAPlayer: aPlayer fromAGame: aGame.
			"self cards remove: aCard" ]