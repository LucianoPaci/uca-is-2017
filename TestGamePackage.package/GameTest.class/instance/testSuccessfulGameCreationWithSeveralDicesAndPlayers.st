tests
testSuccessfulGameCreationWithSeveralDicesAndPlayers
	| player1 player2 board dice1 dice2 game laps players dices |
	player1 := Player named: 'Scorpion'.
	board := Board squares: 20.
	dice1 := Dice faces: 6.
	dice2 := Dice faces: 9.
	laps := 1.
	players := OrderedCollection new.
	players add: player1.
	dices := OrderedCollection new.
	dices
		add: dice1;
		add: dice2.
	game := Game
		startWith: players
		definedBoard: board
		definedDice: dices
		definedAmountOfLaps: laps.
	player2 := Player named: 'Raiden'.
	game addPlayer: player2.
	self
		assert: players size equals: 2;
		assert: dices size equals: 2;
		assert: game board equals: board;
		assert: game laps equals: laps