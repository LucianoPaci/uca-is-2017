testing
nextTurnFor: aPlayer
	| movesToBeMade actualSquare|
	(self wrongTurnFor: aPlayer)
		ifFalse: [ movesToBeMade := dices sumNumbers: [ :dice | dice roll ].
			self move: aPlayer positions: movesToBeMade.
			
			actualSquare:= board squareAtPosition: aPlayer position.
			actualSquare provokesAnEffectInto: self with: aPlayer.
			
			self winnerOfGame: aPlayer.
			self changeIndexOfExpectedPlayer  ]