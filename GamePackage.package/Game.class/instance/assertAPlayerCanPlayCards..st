playing
assertAPlayerCanPlayCards: aPlayer
	| movesToBeMade actualSquare cardEffect |
	(self detect: aPlayer)
		ifTrue: [ movesToBeMade := dices sumNumbers: [ :dice | dice roll ].
			aPlayer throwsCancellationCards.
			movesToBeMade := movesToBeMade
				+ aPlayer throwsPermamentCardsProducingAnEffectOnADiceRoll.
			self move: aPlayer positions: movesToBeMade.
			actualSquare := board squareAtPosition: aPlayer currentPosition.
			cardEffect := aPlayer
				throwsPermanentCardsAddingAnEffectOnASquareEffect.
			actualSquare
				provokesAnEffectInto: self
				with: aPlayer
				addingEffect: cardEffect.
			aPlayer
				throwsPotentiationCardsToASquare: actualSquare
				fromAGame: self
				withACard: cardEffect.
			aPlayer emptyInstantCardsToBePlayed.
			self checkIsAWinnerOfGame: aPlayer.
			self changeIndexOfExpectedPlayer ]
		ifFalse: [ GameFailed
				signal: 'Al jugador no le corresponde jugar en este turno ' ]