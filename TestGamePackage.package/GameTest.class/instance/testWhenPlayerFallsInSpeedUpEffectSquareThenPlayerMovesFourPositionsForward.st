tests
testWhenPlayerFallsInSpeedUpEffectSquareThenPlayerMovesFourPositionsForward
	| player game dice board squareSpeedUp squareNonEffect squares |
	player := Player named: 'Nahuel'.
	
	squareNonEffect := SquareNonEffect new.
	squareSpeedUp := SquareSpeedUp new.
	squares := OrderedCollection new
		add: squareSpeedUp;
		add: squareNonEffect;
		add: squareNonEffect;
		add: squareNonEffect;
		add: squareNonEffect;
		add: squareNonEffect;
		yourself.
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