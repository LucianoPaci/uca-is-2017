tests
testWhenPlayerFallsInWormHoleEffectSquareThenPlayerMovesFourPositionsBackwards
	| player1 game dice board squares |
	player1 := Player named: 'Frodo'.
	squares := (1 to: 10) collect: [ :n | SquareWithoutEffect onPosition: n ].
	squares at: 7 put: (SquareWormHole onPosition: 7).
	board := Board definedSquares: squares.
	dice := Dice faces: 3 obtainingValuesFrom: (FixedNumberSource providing: #(1 5 6)).
	game := Game
		playedBy: (OrderedCollection with: player1)
		on: board
		throwing: (OrderedCollection with: dice)
		winningWhenCompleting: 1.
	self assert: player1 position equals: 1.
	game nextTurnFor: player1.
	self assert: player1 position equals: 2.
	game nextTurnFor: player1.
	self assert: player1 position equals: 3