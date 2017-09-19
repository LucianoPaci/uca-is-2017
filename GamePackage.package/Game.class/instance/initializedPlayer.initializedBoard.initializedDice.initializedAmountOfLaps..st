initialize
initializedPlayer: aCreator initializedBoard: aBoard initializedDice: aDice initializedAmountOfLaps: anAmountOfLaps
	player := OrderedCollection new.
	player add: aCreator.
	board := aBoard.
	dice := aDice.
	indexOfPlayer := 1.
	laps := anAmountOfLaps