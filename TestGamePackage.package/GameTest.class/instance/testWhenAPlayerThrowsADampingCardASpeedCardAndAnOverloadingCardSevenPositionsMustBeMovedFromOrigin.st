cards tests
testWhenAPlayerThrowsADampingCardASpeedCardAndAnOverloadingCardSevenPositionsMustBeMovedFromOrigin
	| squares board diceOneFace collectionOfDices collectionOfPlayers playerRaiden playerRaidenDeck playerRaidenHistory laps gameDeck game firstCardToAffectPlayer secondCardToAffectPlayer thirdCardToAffectPlayer |
	playerRaidenHistory := OrderedCollection new.
	playerRaidenHistory add: (PlayerPosition at: 1 withLaps: 0).
	squares := (1 to: 10) collect: [ :n | SquareWithoutEffect onPosition: n ].
	squares at: 4 put: (SquareSpeedUp onPosition: 4).
	board := Board definedSquares: squares.
	diceOneFace := Dice faces: 1 obtainingValuesFrom: (FixedNumberSource providing: #(4)).
	collectionOfDices := OrderedCollection new.
	collectionOfDices add: diceOneFace.
	collectionOfPlayers := OrderedCollection new.
	playerRaidenDeck := OrderedCollection new.
	firstCardToAffectPlayer := CardSpeed named: 'CardSpeed1'.
	secondCardToAffectPlayer := CardOverloading named: 'CardOverloading1'.
	thirdCardToAffectPlayer := CardDamping named: 'CardDamping1'.
	playerRaidenDeck
		add: firstCardToAffectPlayer;
		add: secondCardToAffectPlayer;
		add: thirdCardToAffectPlayer.
	playerRaiden := Player named: 'Raiden' withCards: playerRaidenDeck andPositionHistory: playerRaidenHistory.
	collectionOfPlayers add: playerRaiden.
	laps := 1.
	gameDeck := OrderedCollection new.
	gameDeck
		add: (CardSpeed named: 'CardSpeed3');
		add: (CardSpeed named: 'CardSpeed2').
	game := Game
		playedBy: collectionOfPlayers
		on: board
		throwing: collectionOfDices
		winningWhenCompleting: laps
		withACardDeck: gameDeck.
	game affect: playerRaiden withAPermanentCard: firstCardToAffectPlayer of: playerRaiden.
	game affect: playerRaiden withAPermanentCard: secondCardToAffectPlayer of: playerRaiden.
	game affect: playerRaiden withAPermanentCard: thirdCardToAffectPlayer of: playerRaiden.
	self assert: playerRaiden permanentCardsToBePlayed size equals: 3.
	game nextTurnFor: playerRaiden.
	self assert: (playerRaiden previousNPositions: 1) squareNumber equals: 4.
	self assert: playerRaiden lastPosition squareNumber equals: 6