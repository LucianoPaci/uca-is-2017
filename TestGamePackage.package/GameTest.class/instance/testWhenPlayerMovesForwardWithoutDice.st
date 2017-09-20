tests
testWhenPlayerMovesForwardWithoutDice
	| player board dice game |
	player := Player named: 'jorge'.
	board := Board squares: 30.
	dice := Dice faces: 6.
	game := Game
		definedPlayers: player
		definedBoard: board
		definedDices: dice
		definedAmountOfLaps: 1.
	self assert: player position equals: 0.
	game moveForward: player positions: 5.
	self assert: player position equals: 5.
	game moveForward: player positions: 2.
	self assert: player position equals: 7