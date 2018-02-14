playing
makePlayATurn: aPlayer
| movesToBeMade actualSquare cardEffect |
 movesToBeMade := dices sumNumbers: [ :dice | dice roll ].
	self throwsCancellationCardsTo: aPlayer.
	movesToBeMade := movesToBeMade
		+ (self throwsPermanentCardsProducingAnEffectOnADiceRollTo: aPlayer).
	self move: aPlayer positions: movesToBeMade.
	actualSquare := board
		squareAtPosition: aPlayer positions last squareNumber.
	cardEffect := self
		throwsPermanentCardsAddingAnEffectOnASquareEffectTo: aPlayer.
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
	self changeIndexOfExpectedPlayer 