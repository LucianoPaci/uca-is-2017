tests
testWhenPlayerCompletesALapThenLapsAreCorrectlyUpdated
	| player board dice game squareAtomicBomb squareWornHole squares |
	player := Player named: 'jorge'.
	squareAtomicBomb:= SquareAtomicBomb initialize.
	squareWornHole:= SquareWormHole initialize.
	squares:= OrderedCollection new.
	squares add: squareWornHole.
	squares add: squareAtomicBomb.
	board:= Board definedSquares: squares.
	dice := Dice faces: 6.
	game := Game
		playedBy: player
		on: board
		throwing: dice
		winningWhenCompleting: 1.
	self assert: player position equals: 0.
	game moveForward: player positions: 5.
	self assert: player position equals: 5.
	game moveForward: player positions: 7.
	self assert: player position equals: 2.
	self assert: player lapsTravelled equals: 1