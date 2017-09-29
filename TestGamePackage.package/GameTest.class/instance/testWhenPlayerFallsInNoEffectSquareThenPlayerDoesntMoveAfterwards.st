tests
testWhenPlayerFallsInNoEffectSquareThenPlayerDoesntMoveAfterwards
	| player game dice board squareAtomicBomb squareWornHole squares |
	player := Player named: 'Nahuel'.
	squareAtomicBomb:= SquareAtomicBomb initialize.
	squareWornHole:= SquareWormHole initialize.
	squares:= OrderedCollection new.
	squares add: squareWornHole.
	squares add: squareAtomicBomb.
	board:= Board definedSquares: squares.
	dice := Dice faces: 6 obtainingValuesFrom: (FixedNumberSource providing: #(1 2 3 4 5 6)).
	game := Game
		playedBy: (OrderedCollection with: player)
		on: board
		throwing: (OrderedCollection with: dice)
		winningWhenCompleting: 1.
	self assert: player position equals: 0.
	game moveForward: player positions: 3.
	self assert: player position equals: 3.