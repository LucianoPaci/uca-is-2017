use of cards
assert: aPlayer with: aCard thatHasfrom: aGame
	cards indexOf: aCard ifAbsent: [ GameFailed signal: 'La carta  no se encuentra en la mano del jugador' ].
	aCard addToAPlayer: aPlayer fromAGame: aGame.
	cards remove: aCard.
		