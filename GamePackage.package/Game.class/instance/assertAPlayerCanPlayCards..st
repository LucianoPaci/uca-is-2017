playing
assertAPlayerCanPlayCards: aPlayer
	| movesToBeMade actualSquare cardEffect |
	(self detect: aPlayer)
		ifTrue: [ movesToBeMade := dices sumNumbers: [ :dice | dice roll ].
			self throwsCancellationCardsTo: aPlayer.
			movesToBeMade := movesToBeMade
				+ (self throwsPermamentCardsProducingAnEffectOnADiceRollTo:aPlayer).
			self move: aPlayer positions: movesToBeMade.
			actualSquare := board squareAtPosition: (aPlayer positions last) squareNumber.
			cardEffect := (self
				throwsPermanentCardsAddingAnEffectOnASquareEffectTo: aPlayer).
			actualSquare
				provokesAnEffectInto: self
				with: aPlayer
				addingEffect: cardEffect.
			self
				throwsPotentiationCardsToASquare: actualSquare
				affecting: aPlayer
				withACard: cardEffect.
			aPlayer emptyInstantCardsToBePlayed.
			self checkIsAWinnerOfGame: aPlayer.
			self changeIndexOfExpectedPlayer ]
		ifFalse: [ GameFailed
				signal: 'Al jugador no le corresponde jugar en este turno ' ]