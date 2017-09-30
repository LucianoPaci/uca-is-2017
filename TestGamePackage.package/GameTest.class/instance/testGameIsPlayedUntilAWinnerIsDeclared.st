tests
testGameIsPlayedUntilAWinnerIsDeclared
	| playerScorpion playerRaiden diceSixFaces diceEightFaces game collectionOfDices board laps collectionOfplayers squares |
	
	squares :=  (1 to: 12) collect: [:a | SquareWithoutEffect new].
	board := Board definedSquares: squares.
	diceEightFaces := Dice
		faces: 8
		obtainingValuesFrom: (FixedNumberSource providing: #(1 2 3 4 5 6 7 8)).
	diceSixFaces := Dice
		faces: 6
		obtainingValuesFrom: (FixedNumberSource providing: #(1 2 3 4 5 6)).
	collectionOfDices := OrderedCollection new.
	collectionOfDices
		add: diceSixFaces;
		add: diceEightFaces.
	collectionOfplayers := OrderedCollection new.
	playerScorpion := Player named: 'Scorpion'.
	playerRaiden := Player named: 'Raiden'.
	laps := 1.
	collectionOfplayers add: playerScorpion.
	collectionOfplayers add: playerRaiden.
	game := Game
		playedBy: collectionOfplayers
		on: board
		throwing: collectionOfDices
		winningWhenCompleting: laps.
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