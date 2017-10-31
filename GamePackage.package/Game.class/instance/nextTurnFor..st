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
		ifTrue: [ Transcript show: 'El jugador no puede jugar este Turno'; cr.]