use of cards
assert: aPlayer with: aCard thatHasfrom: aGame
	(cards select: [ :each | aCard isEqualTo: each ]) isNotEmpty
		ifTrue: [ aCard addToAPlayer: aPlayer fromAGame: aGame.
			cards remove: aCard ]
		ifFalse: [ GameFailed
				signal: 'La carta  no se encuentra en la mano del jugador' ]