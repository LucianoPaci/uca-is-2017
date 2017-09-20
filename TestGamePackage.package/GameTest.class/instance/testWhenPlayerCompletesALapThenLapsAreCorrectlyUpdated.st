tests
testWhenPlayerCompletesALapThenLapsAreCorrectlyUpdated
	| player board dice game |
	player := Player named: 'jorge'.
	board := Board squares: 10.
	dice := Dice faces: 6.
	game := Game
		definedPlayers: player
		definedBoard: board
		definedDices: dice
		definedAmountOfLaps: 1.
	self assert: player position equals: 0.
	game moveForward: player positions: 5.
	self assert: player position equals: 5.
	game moveForward: player positions: 7.
	self assert: player position equals: 2.
	self assert: player lapsTravelled equals: 1