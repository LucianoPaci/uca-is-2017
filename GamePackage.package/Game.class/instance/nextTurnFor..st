playing
nextTurnFor: aPlayer
	| movesToBeMade actualSquare cardEffect previousSquare |
	cardEffect := 1.
	(self wrongTurnFor: aPlayer)
		ifFalse: [ 	movesToBeMade := dices sumNumbers: [ :dice | dice roll ].
						aPlayer throwsCancellationCards.
						movesToBeMade := movesToBeMade + aPlayer throwsPermamentCardsProducingAnEffectOnADiceRoll.
						self move: aPlayer positions: movesToBeMade.
						actualSquare := board squareAtPosition: aPlayer currentPosition.
						cardEffect := aPlayer throwsPermanentCardsAddingAnEffectOnASquareEffect.
						actualSquare provokesAnEffectInto: self with: aPlayer addingEffect: cardEffect.
						actualSquare addToAPlayerCardDeck: aPlayer from: self.
						previousSquare := board squareAtPosition: (aPlayer previousNPositions:1) squareNumber.
						aPlayer throwsPotentiationCardsToASquare: previousSquare fromAGame: self withACard: cardEffect.
						aPlayer emptyInstantCardsToBePlayed.
						self checkIsAWinnerOfGame: aPlayer.
						self changeIndexOfExpectedPlayer. 
					]
		ifTrue: [ WrongTurnPlayerError signal: 'Al jugador no le corresponde jugar en este turno ' ]