use of cards
affect: aPlayer withAnInstantCard: aCard into: aGame
	cards indexOf: aCard ifAbsent: [ GameFailed signal: 'La carta  no se encuentra en la mano del jugador' ].
	aCard addToAPlayer: aPlayer fromAGame: aGame.
	cards remove: aCard.