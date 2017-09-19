tests
testWhenPlayerMovesForward
	| player board dice game |
	player := Player named: 'jorge'.
	board := Board squares: 30.
	dice := Dice faces: 6.
	game := Game startWith: player definedBoard: board definedDice: dice definedAmountOfLaps: 1.
	self assert: player position equals: 0.
	game moveForward: player positions: 5 intoABoard: board.
	self assert: player position equals: 5.
	game moveForward: player positions: 2 intoABoard: board.
	self assert: player position equals: 7