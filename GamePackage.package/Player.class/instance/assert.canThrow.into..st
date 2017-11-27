use of cards
assert: aPlayer canThrow: aCard into: aGame
	(aGame detect: self)
		ifTrue: [ cards indexOf: aCard ifAbsent: [ GameFailed signal: 'La carta  no se encuentra en la mano del jugador' ].
					 aCard addToAPlayer: aPlayer fromAGame: aGame.
					cards remove: aCard.
		 ]
		ifFalse: [ GameFailed signal: 'El jugador no puede jugar cartas, ya que no es su turno' ]