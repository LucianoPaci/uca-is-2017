playing
testGameIsPlayedUntilAWinnerIsDeclared
	| playerScorpion playerRaiden game collectionOfDices board laps collectionOfplayers squares playerScorpionHistory playerRaidenHistory |
	squares := (1 to: 10) collect: [ :n | SquareWithoutEffect onPosition: n ].
	board := Board definedSquares: squares.
	collectionOfDices := OrderedCollection new.
	collectionOfDices
		add: (Dice faces: 6 obtainingValuesFrom: (FixedNumberSource providing: #(1 2 3 4 5 6)));
		add: (Dice faces: 8 obtainingValuesFrom: (FixedNumberSource providing: #(1 2 3 4 5 6 7 8))).
	collectionOfplayers := OrderedCollection new.
	playerScorpionHistory := OrderedCollection new.
	playerScorpionHistory add: (PlayerPosition at: 1 withLaps: 0).
	playerRaidenHistory := OrderedCollection new.
	playerRaidenHistory add: (PlayerPosition at: 1 withLaps: 0).
	playerScorpion := Player named: 'Scorpion' withCards: (self aCollectionOfGameCards )removeFirst andPositionHistory: playerScorpionHistory.
	playerRaiden := Player named: 'Raiden' withCards: (self aCollectionOfGameCards )removeFirst andPositionHistory: playerRaidenHistory.
	laps := 1.
	collectionOfplayers add: playerScorpion.
	collectionOfplayers add: playerRaiden.
	game := Game
		playedBy: collectionOfplayers on: board  throwing: collectionOfDices winningWhenCompleting: laps withACardDeck: self aCollectionOfGameCards.
	self
		assert: collectionOfplayers size equals: 2;
		assert: playerScorpion currentPosition equals: 1;
		assert: playerRaiden currentPosition equals: 1;
		assert: playerScorpion lapsTravelled equals: 0;
		assert: playerRaiden lapsTravelled equals: 0.
	game nextTurnFor: playerScorpion.
	self
		assert: playerScorpion currentPosition equals: 3;
		assert: playerRaiden currentPosition equals: 1;
		assert: playerScorpion lapsTravelled equals: 0;
		assert: playerRaiden lapsTravelled equals: 0.
	game nextTurnFor: playerRaiden.
	self
		assert: playerScorpion currentPosition equals: 3;
		assert: playerRaiden currentPosition equals: 5;
		assert: playerScorpion lapsTravelled equals: 0;
		assert: playerRaiden lapsTravelled equals: 0.
	game nextTurnFor: playerScorpion.
	self
		assert: playerScorpion currentPosition equals: 9;
		assert: playerRaiden currentPosition equals: 5;
		assert: playerScorpion lapsTravelled equals: 0;
		assert: playerRaiden lapsTravelled equals: 0.
	game nextTurnFor: playerRaiden.
	self
		assert: playerScorpion currentPosition equals: 9;
		assert: playerRaiden currentPosition equals: 3;
		assert: playerScorpion lapsTravelled equals: 0;
		assert: playerRaiden lapsTravelled equals: 1.
	self assert: game winner equals: playerRaiden