playing
testWhenAPlayerIsNotFoundInAGame
	| playerScorpionHistory  squares board diceEightFaces  collectionOfDices collectionOfPlayers playerScorpionDeck  playerScorpion  laps gameDeck game  |
	playerScorpionHistory := OrderedCollection new.
	playerScorpionHistory add: (PlayerPosition at: 1 withLaps: 0).
	squares := (1 to: 8) collect: [ :n | SquareWithoutEffect initialize].
	board := Board definedSquares: squares.
	diceEightFaces := Dice faces: 8 obtainingValuesFrom: (FixedNumberSource providing: #(1 2 3 4 5 6 7 8)).
	collectionOfDices := OrderedCollection new.
	collectionOfDices
		add: diceEightFaces.
	collectionOfPlayers := OrderedCollection new.
	playerScorpionDeck := OrderedCollection new.
	playerScorpionDeck
		add: (CardDamping named: 'CardDamping1');
		add: (CardCancellation named: 'CardCancellation2').
	playerScorpion := Player named: 'Scorpion' withCards: playerScorpionDeck andPositionHistory: playerScorpionHistory.
	laps := 1.
	collectionOfPlayers add: playerScorpion.
	gameDeck := OrderedCollection new.
	gameDeck
		add: (CardPotentiation named: 'CardPotentiation1');
		add: (CardSpeed named: 'CardSpeed2').
	game := Game
		playedBy: collectionOfPlayers
		on: board
		throwing: collectionOfDices
		winningWhenCompleting: laps
		withACardDeck: gameDeck.
	self should: [ game getPlayerAt: -1] raise: GameFailed.