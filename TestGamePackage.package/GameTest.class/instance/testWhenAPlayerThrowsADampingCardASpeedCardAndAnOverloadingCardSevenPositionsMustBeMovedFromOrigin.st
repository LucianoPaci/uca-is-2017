cards tests
testWhenAPlayerThrowsADampingCardASpeedCardAndAnOverloadingCardSevenPositionsMustBeMovedFromOrigin
	| squares board diceOneFace collectionOfDices collectionOfPlayers playerRaiden playerRaidenDeck playerRaidenHistory laps gameDeck game firstCardToAffectPlayer secondCardToAffectPlayer thirdCardToAffectPlayer |
	playerRaidenHistory := OrderedCollection new.
	playerRaidenHistory add: (PlayerPosition at: 1 withLaps: 0 withNumberOfSquaresTravelled:0).
	squares := (1 to: 10) collect: [ :n | SquareWithoutEffect initialized].
	thirdCardToAffectPlayer := CardDamping named: 'CardDamping1'.
	squares at: 4 put: (SquareSpeedUp initialized).
	squares at: 1 put:(SquareThatAddACard withACardToBeAdded: thirdCardToAffectPlayer).
	board := Board definedSquares: squares.
	diceOneFace := Dice faces: 1 obtainingValuesFrom: (FixedNumberSource providing: #(1 4)).
	collectionOfDices := OrderedCollection new.
	collectionOfDices add: diceOneFace.
	collectionOfPlayers := OrderedCollection new.
	playerRaidenDeck := OrderedCollection new.
	firstCardToAffectPlayer := CardSpeed named: 'CardSpeed1'.
	secondCardToAffectPlayer := CardOverloading named: 'CardOverloading1'.
	playerRaidenDeck
		add: firstCardToAffectPlayer;
		add: secondCardToAffectPlayer.
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
	self assert: playerRaiden permanentCardsToBePlayed size equals: 2.
	game nextTurnFor: playerRaiden.
	game affect: playerRaiden withAPermanentCard: thirdCardToAffectPlayer of: playerRaiden.
	game nextTurnFor: playerRaiden.
	self assert: (playerRaiden getPositionAt: playerRaiden positions size -1) squareNumber equals: 4.
	self assert: playerRaiden positions last squareNumber equals: 6