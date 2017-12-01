asserting
assert: aPlayer canThrow: aCard of: anotherPlayer
	(self detect: anotherPlayer)
		ifTrue: [ (anotherPlayer cards) indexOf: aCard ifAbsent: [ GameFailed signal: 'La carta  no se encuentra en la mano del jugador' ].
					 aCard addToAPlayer: aPlayer fromAGame: self.
					anotherPlayer removeACardFromDeck: aCard.
		 ]
		ifFalse: [ GameFailed signal: 'El jugador no puede jugar cartas, ya que no es su turno' ]