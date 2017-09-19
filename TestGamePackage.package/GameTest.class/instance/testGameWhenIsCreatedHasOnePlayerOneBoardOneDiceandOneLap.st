tests
testGameWhenIsCreatedHasOnePlayerOneBoardOneDiceandOneLap
	| player board dice game laps |
	player := Player named: 'jorge'.
	board := Board squares: 30.
	dice := Dice faces: 6.
	laps:= 1.
	game := Game startWith: player definedBoard: board definedDice: dice definedAmountOfLaps: laps.
	self
		assert: player  equals: player;
		assert: player position equals: 0;
		assert: player lapsTravelled equals: 0;
		assert: dice equals:dice;
		assert: board equals: board;
		assert: game laps equals: laps.