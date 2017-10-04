tests
testGameIsPlayedUntilAWinnerIsDeclared
	| playerScorpion playerRaiden game collectionOfDices board laps collectionOfplayers squares squareWithoutEffect |
	squareWithoutEffect := SquareWithoutEffect new.
	squares := OrderedCollection new.
	8 timesRepeat: [ squares add: squareWithoutEffect ].
	board := Board definedSquares: squares.
	collectionOfDices := OrderedCollection new.
	collectionOfDices
		add:
			(Dice
				faces: 6
				obtainingValuesFrom: (FixedNumberSource providing: #(1 2 3 4 5 6)));
		add:
			(Dice
				faces: 8
				obtainingValuesFrom: (FixedNumberSource providing: #(1 2 3 4 5 6 7 8))).
	collectionOfplayers := OrderedCollection new.
	playerScorpion := Player named: 'Scorpion'.
	playerRaiden := Player named: 'Raiden'.
	laps := 1.
	collectionOfplayers add: playerScorpion.
	collectionOfplayers add: playerRaiden.
	game := Game
		definedPlayers: collectionOfplayers
		definedBoard: board
		definedDices: collectionOfDices
		definedAmountOfLaps: laps.
	self
		assert: collectionOfplayers size equals: 2;
		assert: playerScorpion position equals: 0;
		assert: playerRaiden position equals: 0;
		assert: playerScorpion lapsTravelled equals: 0;
		assert: playerRaiden lapsTravelled equals: 0.
	game nextTurnFor: playerScorpion.
	self
		assert: playerScorpion position equals: 2;
		assert: playerRaiden position equals: 0;
		assert: playerScorpion lapsTravelled equals: 0;
		assert: playerRaiden lapsTravelled equals: 0.
	game nextTurnFor: playerRaiden.
	self
		assert: playerScorpion position equals: 2;
		assert: playerRaiden position equals: 4;
		assert: playerScorpion lapsTravelled equals: 0;
		assert: playerRaiden lapsTravelled equals: 0.
	game nextTurnFor: playerScorpion.
	self
		assert: playerScorpion position equals: 8;
		assert: playerRaiden position equals: 4;
		assert: playerScorpion lapsTravelled equals: 0;
		assert: playerRaiden lapsTravelled equals: 0.
	game nextTurnFor: playerRaiden.
	self
		assert: playerScorpion position equals: 8;
		assert: playerRaiden position equals: 0;
		assert: playerScorpion lapsTravelled equals: 0;
		assert: playerRaiden lapsTravelled equals: 1.
	self assert: game winner equals: playerRaiden