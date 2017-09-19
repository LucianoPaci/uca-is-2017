tests
testSuccessfulGameCreationWithSeveralDicesAndPlayers
	| player1 player2 board dice1 dice2 arrayOfDices game laps |
	player1 := Player named: 'Scorpion'.
	board := Board squares: 20.
	dice1 := Dice faces: 6.
	dice2 := Dice faces: 9.
	arrayOfDices := Array with: dice1 with: dice2.
	laps := 1.
	game := Game
		startWith: player1
		definedBoard: board
		definedDice: arrayOfDices
		definedAmountOfLaps: laps.
	player2 := Player named: 'Raiden'.
	game addPlayer: player2.
	self
		assert: player1 equals: player1;
		assert: player2 equals: player2;
		assert: player1 position equals: 0;
		assert: player2 position equals: 0;
		assert: player1 lapsTravelled equals: 0;
		assert: player2 lapsTravelled equals: 0;
		assert: arrayOfDices equals: arrayOfDices;
		assert: board equals: board;
		assert: game laps equals: laps