tests
testWhenPlayerFallsInTimeMachineEffectSquareThenPlayerMovesBackToPRevoiusPosition
	| player1  game dice board wormHoleSquare squareNonEffect squares |
	player1 := Player named: 'Lucho'.
	squareNonEffect := SquareWithoutEffect  new.
	wormHoleSquare  := SquareWormHole new.
	squares := OrderedCollection new
		add: squareNonEffect;
		add: squareNonEffect;
		add: squareNonEffect;
		add: squareNonEffect;
		add: squareNonEffect;
		add: squareNonEffect;
		add: wormHoleSquare;
		add: squareNonEffect;
		add: squareNonEffect;
		add: squareNonEffect;
		yourself.
	board := Board definedSquares: squares.
	dice := Dice faces: 2 obtainingValuesFrom: (FixedNumberSource providing: #(1 6 6)).
	game := Game
		playedBy: (OrderedCollection with: player1)
		on: board
		throwing: (OrderedCollection with: dice)
		winningWhenCompleting: 1.
	self assert: player1 position equals: 0.
	game nextTurnFor: player1.
	self assert: player1 position equals: 1.
	game nextTurnFor: player1.
	self assert: player1 position equals: 3.
