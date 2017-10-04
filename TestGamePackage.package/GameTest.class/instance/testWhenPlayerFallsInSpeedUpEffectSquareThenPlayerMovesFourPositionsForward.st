tests
testWhenPlayerFallsInSpeedUpEffectSquareThenPlayerMovesFourPositionsForward
	| player game dice board squareSpeedUp squareNonEffect squares |
	player := Player named: 'Nahuel'.
	
	squares:= (1 to: 6) collect: [:n | SquareWithoutEffect onPosition: n ].
	squares at: 1 put: (SquareSpeedUp onPosition:1).
	
	board := Board definedSquares: squares.
	dice := Dice faces: 6 obtainingValuesFrom: (FixedNumberSource providing: #(1 2 3 4 5 6)).
	game := Game
		playedBy: (OrderedCollection with: player)
		on: board
		throwing: (OrderedCollection with: dice)
		winningWhenCompleting: 1.
	self assert: player position equals: 0.
	game nextTurnFor: player.
	self assert: player position equals: 5