testing
nextTurnFor: aPlayer
	| movesToBeMade actualSquare|
	(self wrongTurnFor: aPlayer)
		ifFalse: [ movesToBeMade := dices sumNumbers: [ :dice | dice roll ].
			self moveForward: aPlayer positions: movesToBeMade.
			
			actualSquare:= board squareAtPosition: aPlayer position.
			actualSquare provokesAnEffectIntoAGame: self with: aPlayer.
			
			self winnerOfGame: aPlayer.
			self changePreviousTurnPlayer: aPlayer ]