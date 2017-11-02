testing
nextTurnFor: aPlayer
	| movesToBeMade actualSquare|
	(self wrongTurnFor: aPlayer)
		ifFalse: [ movesToBeMade := dices sumNumbers: [ :dice | dice roll ].
			self move: aPlayer positions: movesToBeMade.
			
			actualSquare:= board squareAtPosition: aPlayer position.
			actualSquare provokesAnEffectInto: self with: aPlayer.
			actualSquare addToAPlayerCardDeck: aPlayer from: self.
			self CheckIsAWinnerOfGame: aPlayer.
			self changeIndexOfExpectedPlayer  ]
		ifTrue: [ WrongTurnPlayerException signal: 'Al jugador no le corresponde jugar en este turno']