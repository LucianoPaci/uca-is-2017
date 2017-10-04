tests
testWhenAPlayerFallsInAtomicBombSquareThenAllPlayersReturnToTheBeginningOfTheBoard
	| player1 player2 player3 game dice board squareNonEffect squareAtomicBomb squares |
	player1 := Player named: 'JaimeLannister'.
	player2 := Player named: 'NedStark'.
	player3 := Player named: 'Jon Snow'.
	squares:= (1 to: 8) collect: [:n | SquareWithoutEffect onPosition: n ].
	squares at: 5 put: (SquareAtomicBomb  onPosition:5).
	
	board := Board definedSquares: squares.
	dice := Dice faces: 6 obtainingValuesFrom: (FixedNumberSource providing: #(1 2 3 4 5 6)).
	game := Game
		playedBy: (OrderedCollection with: player1 with: player2 with: player3)
		on: board
		throwing: (OrderedCollection with: dice)
		winningWhenCompleting: 1.
	self assert: player1 position equals: 0.
	self assert: player2 position equals: 0.
	self assert: player3 position equals: 0.
	game nextTurnFor: player1.
	self assert: player1 position equals: 1.
	game nextTurnFor: player2.
	self assert: player2 position equals: 2.
	game nextTurnFor: player3.
	self assert: player3 position equals: 3.
	
	game nextTurnFor: player1.
	self
		assert: player1 position equals: 0;
		assert: player2 position equals: 0;
		assert: player3 position equals: 0.