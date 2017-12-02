cards tests
testWhenACancellationCardIsThrownAndThereIsNoPermanentCardInGameAnErrorMessageIsThrown
	| playerScorpionHistory squares board diceEightFaces collectionOfDices collectionOfPlayers playerScorpionDeck playerScorpion laps gameDeck game aCancellationCard aCard playerRaidenHistory playerRaidenDeck playerRaiden |
	playerScorpionHistory := OrderedCollection new.
	playerScorpionHistory add: (PlayerPosition at: 1 withLaps: 0 withNumberOfSquaresTravelled:0).
	playerRaidenHistory := OrderedCollection new.
	playerRaidenHistory add: (PlayerPosition at: 1 withLaps: 0 withNumberOfSquaresTravelled:0).
	squares := (1 to: 8) collect: [ :n | SquareWithoutEffect initialize].
	board := Board definedSquares: squares.
	diceEightFaces := Dice faces: 8 obtainingValuesFrom: (FixedNumberSource providing: #(1 2 3 4 5 6 7 8)).
	collectionOfDices := OrderedCollection new.
	collectionOfDices add: diceEightFaces.
	collectionOfPlayers := OrderedCollection new.
	playerScorpionDeck := OrderedCollection new.
	playerRaidenDeck := OrderedCollection new.
	aCancellationCard := CardCancellation named: 'CardCancellation1'.
	playerScorpionDeck
		add: aCancellationCard;
		add: (CardOverloading named: 'CardOverloading1').
	playerRaidenDeck
		add: (CardSpeed named: 'CardSpeed1');
		add: (CardDamping named: 'CardDamping1').
	playerScorpion := Player named: 'Scorpion' withCards: playerScorpionDeck andPositionHistory: playerScorpionHistory.
	playerRaiden := Player named: 'Raiden' withCards: playerRaidenDeck andPositionHistory: playerRaidenHistory.
	laps := 1.
	collectionOfPlayers
		add: playerScorpion;
		add: playerRaiden.
	gameDeck := OrderedCollection new.
	gameDeck
		add: (CardDamping named: 'CardDamping2');
		add: (CardSpeed named: 'CardSpeed2').
	aCard := CardSpeed named: 'CardSpeed1'.
	game := Game
		playedBy: collectionOfPlayers
		on: board
		throwing: collectionOfDices
		winningWhenCompleting: laps
		withACardDeck: gameDeck.
	self
		should: [ game affect: aCard
				from: playerRaiden
				using: aCancellationCard
				of: playerScorpion ]
		raise: GameFailed