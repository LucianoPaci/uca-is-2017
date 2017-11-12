testing
nextTurnFor: aPlayer
	| movesToBeMade actualSquare cardEffect |
	cardEffect := 1.
	(self wrongTurnFor: aPlayer)
		ifFalse: [ movesToBeMade := dices sumNumbers: [ :dice | dice roll ].
			movesToBeMade := movesToBeMade + aPlayer throwsPermamentCardsProducingAnEffectOnADiceRoll.
			self move: aPlayer positions: movesToBeMade.
			actualSquare := board squareAtPosition: aPlayer position.
			cardEffect := aPlayer throwsPermanentCardsAddingAnEffectOnASquareEffect.
			actualSquare provokesAnEffectInto: self with: aPlayer addingEffect: cardEffect.
			actualSquare addToAPlayerCardDeck: aPlayer from: self.
			self CheckIsAWinnerOfGame: aPlayer.
			self changeIndexOfExpectedPlayer ]
		ifTrue: [ WrongTurnPlayerError signal: 'Al jugador no le corresponde jugar en este turno ' ]