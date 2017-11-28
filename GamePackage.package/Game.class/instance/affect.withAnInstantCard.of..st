as yet unclassified
affect: aPlayer withAnInstantCard: aCard of: anotherPlayer
   (anotherPlayer cards) indexOf: aCard ifAbsent: [ GameFailed signal: 'La carta  no se encuentra en la mano del jugador' ].
	aCard addToAPlayer: aPlayer fromAGame: self.
	anotherPlayer removeACardFromDeck: aCard.