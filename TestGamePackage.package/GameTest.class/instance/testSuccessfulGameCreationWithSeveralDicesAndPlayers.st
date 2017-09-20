tests
testSuccessfulGameCreationWithSeveralDicesAndPlayers
	| player1 player2 board dice1 dice2 game laps players dices |
	player1 := Player named: 'Scorpion'.
	player2 := Player named: 'Raiden'.
	board := Board squares: 20.
	dice1 := Dice faces: 6.
	dice2 := Dice faces: 9.
	laps := 1.
	players := OrderedCollection new.
	players add: player1.
	dices := OrderedCollection new.
	players add: player2.
	dices
		add: dice1;
		add: dice2.
	game := Game
		definedPlayers: players
		definedBoard: board
		definedDices: dices
		definedAmountOfLaps: laps.
	self
		assert: game numberOfPlayers  equals: 2;
		assert: game numberOfDices  equals: 2;
		assert: game board equals: board;
		assert: game laps equals: laps