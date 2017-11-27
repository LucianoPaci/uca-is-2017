use of cards
assert: aPlayer canThrow: aCard into: aGame
	(aGame detect: self)
		ifTrue: [ self assert: aPlayer with: aCard thatHasfrom: aGame ]
		ifFalse: [ GameFailed signal: 'El jugador no puede jugar cartas, ya que no es su turno' ]