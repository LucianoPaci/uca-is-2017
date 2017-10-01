tests
testWhenPlayerMovesForwardWithoutDice
	| player board dice game squareWithoutEffect squares |
	player := Player named: 'jorge'.
	squareWithoutEffect := SquareWithoutEffect new.
	squares:= OrderedCollection new.
	8 timesRepeat: [ squares add: squareWithoutEffect ].
	
	board:= Board definedSquares: squares.
	dice := Dice faces: 6.
	game := Game
		playedBy: (OrderedCollection with:player)
		on: board
		throwing: (OrderedCollection with:dice)
		winningWhenCompleting: 1.
	self assert: (game players at:1) position equals: 0.
	game move: (game players at:1)positions: 5.
	self assert: (game players at:1) position equals: 5.
	game move: (game players at:1) positions: 2.
	self assert: (game players at:1)position equals: 7