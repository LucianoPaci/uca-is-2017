tests
testWhenPlayerFallsInWormHoleEffectSquareThenPlayerMovesFourPositionsBackwards
	| player1  game dice board timeMachineSquare squareNonEffect squares |
	player1 := Player named: 'Frodo'.
	squareNonEffect := SquareWithoutEffect  new.
	timeMachineSquare  := SquareWormHole new.
	squares := OrderedCollection new
		add: squareNonEffect;
		add: squareNonEffect;
		add: squareNonEffect;
		add: squareNonEffect;
		add: squareNonEffect;
		add: squareNonEffect;
		add: timeMachineSquare;
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
