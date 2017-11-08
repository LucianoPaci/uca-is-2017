tests
testGameIsPlayedUntilAWinnerIsDeclared
	| playerScorpion playerRaiden game collectionOfDices board laps collectionOfplayers squares |
	squares := (1 to: 10) collect: [ :n | SquareWithoutEffect onPosition: n ].
	board := Board definedSquares: squares.
	collectionOfDices := OrderedCollection new.
	collectionOfDices
		add: (Dice faces: 6 obtainingValuesFrom: (FixedNumberSource providing: #(1 2 3 4 5 6)));
		add: (Dice faces: 8 obtainingValuesFrom: (FixedNumberSource providing: #(1 2 3 4 5 6 7 8))).
	collectionOfplayers := OrderedCollection new.
	playerScorpion := Player named: 'Scorpion'.
	playerRaiden := Player named: 'Raiden'.
	laps := 1.
	collectionOfplayers add: playerScorpion.
	collectionOfplayers add: playerRaiden.
	game := Game
		playedBy: collectionOfplayers on: board  throwing: collectionOfDices winningWhenCompleting: laps withACardDeck: self aCollectionOfGameCards.
	self
		assert: collectionOfplayers size equals: 2;
		assert: playerScorpion position equals: 1;
		assert: playerRaiden position equals: 1;
		assert: playerScorpion lapsTravelled equals: 0;
		assert: playerRaiden lapsTravelled equals: 0.
	game nextTurnFor: playerScorpion.
	self
		assert: playerScorpion position equals: 3;
		assert: playerRaiden position equals: 1;
		assert: playerScorpion lapsTravelled equals: 0;
		assert: playerRaiden lapsTravelled equals: 0.
	game nextTurnFor: playerRaiden.
	self
		assert: playerScorpion position equals: 3;
		assert: playerRaiden position equals: 5;
		assert: playerScorpion lapsTravelled equals: 0;
		assert: playerRaiden lapsTravelled equals: 0.
	game nextTurnFor: playerScorpion.
	self
		assert: playerScorpion position equals: 9;
		assert: playerRaiden position equals: 5;
		assert: playerScorpion lapsTravelled equals: 0;
		assert: playerRaiden lapsTravelled equals: 0.
	game nextTurnFor: playerRaiden.
	self
		assert: playerScorpion position equals: 9;
		assert: playerRaiden position equals: 3;
		assert: playerScorpion lapsTravelled equals: 0;
		assert: playerRaiden lapsTravelled equals: 1.
	self assert: game winner equals: playerRaiden