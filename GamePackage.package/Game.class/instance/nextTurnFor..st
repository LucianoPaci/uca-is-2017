playing
nextTurnFor: aPlayer
	(players 	reject: [ :player | player = (players at: indexOfExpectedPlayer) ])
		detect: [ :player | player = aPlayer ] ifFound: [ GameFailed signal: 'Al jugador no le corresponde jugar en este turno ' ] ifNone: [self makePlayATurn: aPlayer].