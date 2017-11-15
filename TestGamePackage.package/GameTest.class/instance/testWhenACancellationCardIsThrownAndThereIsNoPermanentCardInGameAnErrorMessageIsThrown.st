cards tests
testWhenACancellationCardIsThrownAndThereIsNoPermanentCardInGameAnErrorMessageIsThrown
| player1History  squares board diceEightFaces collectionOfDices collectionOfplayers cardsPlayer1   player1  laps gameDeckCard game aCancellationCard aCard player2History cardsPlayer2 player2 |
	player1History := OrderedCollection new.
	player1History add: (PlayerPosition at: 1 withLaps: 0).
	player2History := OrderedCollection new.
	player2History add: (PlayerPosition at: 1 withLaps: 0).
	squares:= (1 to: 8) collect: [:n | SquareWithoutEffect onPosition: n ].
	board := Board definedSquares: squares.
	diceEightFaces := Dice
		faces: 8
		obtainingValuesFrom: (FixedNumberSource providing: #(1 2 3 4 5 6 7 8)).
	collectionOfDices := OrderedCollection new.
	collectionOfDices
		add: diceEightFaces.
	collectionOfplayers := OrderedCollection new.
	cardsPlayer1 := OrderedCollection new.
	cardsPlayer2 := OrderedCollection new.
	aCancellationCard := CardCancellation  named: 'CardCancellation1'.
	cardsPlayer1 add: aCancellationCard;add:(CardOverloading  named: 'CardOverloading1') .
	cardsPlayer2 add: (CardSpeed named: 'CardSpeed1'); add:(CardDamping named: 'CardDamping1').
	player1 := Player named: 'Scorpion' withCards: cardsPlayer1 andPositionHistory: player1History.
	player2 := Player named: 'Raiden' withCards: cardsPlayer2 andPositionHistory: player2History.
	laps := 1.
	collectionOfplayers add: player1; add: player2.
	gameDeckCard:= OrderedCollection new.
	gameDeckCard add: (CardDamping  named: 'CardDamping2');add: (CardSpeed named: 'CardSpeed2') .
	aCard:= CardSpeed named: 'CardSpeed1'.
	game := Game
		playedBy: collectionOfplayers on: board throwing: collectionOfDices  winningWhenCompleting: laps 	withACardDeck: gameDeckCard.
	self should: [player1 affectACard: aCard ofAPlayer: player2 withACancellationCard: aCancellationCard into: game] raise: PermanentCardIsNotInPlayerDeckError.
	
	