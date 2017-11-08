tests
testWhenPlayerFallsInSpeedUpEffectSquareThenPlayerMovesFourPositionsForward
	| player game dice board squares |
	player := Player named: 'Nahuel'.
	squares := (1 to: 9) collect: [ :n | SquareWithoutEffect onPosition: n ].
	squares at: 2 put: (SquareSpeedUp onPosition: 2).
	board := Board definedSquares: squares.
	dice := Dice faces: 6 obtainingValuesFrom: (FixedNumberSource providing: #(1 2 3 4 5 6)).
	game := Game
		playedBy: (OrderedCollection with: player)
		on: board
		throwing: (OrderedCollection with: dice)
		winningWhenCompleting: 1
		withACardDeck: self aCollectionOfGameCards.
	self assert: player position equals: 1.
	game nextTurnFor: player.
	self assert: player position equals: 6