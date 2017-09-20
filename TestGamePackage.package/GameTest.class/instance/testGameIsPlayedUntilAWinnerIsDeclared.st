tests
testGameIsPlayedUntilAWinnerIsDeclared
	| playerScorpion playerRaiden dice1 "dice2" game arrayOfDices board laps |
	playerScorpion := Player named: 'Scorpion'.
	board := Board squares: 12.
	arrayOfDices := Array with: (dice1 := Dice faces: 8).	"with: (dice2 := Dice faces: 6)"
	dice1 setValue: 1.
	laps := 1.
	game := Game
		startWith: playerScorpion
		definedBoard: board
		definedDice: arrayOfDices
		definedAmountOfLaps: laps.
	playerRaiden := Player named: 'Raiden'.
	game addPlayer: playerRaiden.
	self
		assert: playerScorpion position equals: 0;
		assert: playerRaiden position equals: 0;
		assert: playerScorpion lapsTravelled equals: 0;
		assert: playerRaiden lapsTravelled equals: 0.
	game nextTurn.
	self
		assert: playerScorpion position equals: 1;
		assert: playerRaiden position equals: 0;
		assert: playerScorpion lapsTravelled equals: 0;
		assert: playerRaiden lapsTravelled equals: 0.
	game nextTurn.
	self
		assert: playerScorpion position equals: 1;
		assert: playerRaiden position equals: 2;
		assert: playerScorpion lapsTravelled equals: 0;
		assert: playerRaiden lapsTravelled equals: 0.
	game nextTurn.
	self
		assert: playerScorpion position equals: 4;
		assert: playerRaiden position equals: 2;
		assert: playerScorpion lapsTravelled equals: 0;
		assert: playerRaiden lapsTravelled equals: 0.
	game nextTurn.
	self
		assert: playerScorpion position equals: 4;
		assert: playerRaiden position equals: 6;
		assert: playerScorpion lapsTravelled equals: 0;
		assert: playerRaiden lapsTravelled equals: 0.
	game nextTurn.
	self
		assert: playerScorpion position equals: 9;
		assert: playerRaiden position equals: 6;
		assert: playerScorpion lapsTravelled equals: 0;
		assert: playerRaiden lapsTravelled equals: 0.
	game nextTurn.
	self
		assert: playerScorpion position equals: 9;
		assert: playerRaiden position equals: 0;
		assert: playerScorpion lapsTravelled equals: 0;
		assert: playerRaiden lapsTravelled equals: 1.
	"self assert: game isOver."
	self assert: game winner equals: playerRaiden