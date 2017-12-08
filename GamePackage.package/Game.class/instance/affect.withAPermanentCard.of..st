addingEffect
affect: aPlayer withAPermanentCard: aCard of: anotherPlayer
	(players
		reject: [ :player | player = (players at: indexOfExpectedPlayer) ])
		detect: [ :player | player = anotherPlayer ]
		ifFound: [ GameFailed
				signal: 'Al jugador no le corresponde jugar en este turno ' ]
		ifNone: [ anotherPlayer cards
				indexOf: aCard
				ifAbsent: [ GameFailed
						signal: 'La carta  no se encuentra en la mano del jugador' ].
			self add: aCard to: aPlayer andRemoveFrom: anotherPlayer ]