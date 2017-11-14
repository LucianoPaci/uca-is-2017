cards tests
testAPlayerCanThrowAnInstantCardNotOnHisTurn
	| player1History player2History squares board diceEightFaces collectionOfDices  collectionOfplayers cardsPlayer1 cardsPlayer2 cardsToAffectPlayer  player1  player2 laps gameDeckCard game |
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
	cardsPlayer1 add: (CardDamping named: 'CardDamping1');add:(CardUndo named: 'CardUndo1') .
	cardsToAffectPlayer := CardSpeed named: 'CardSpeed1'.
	cardsPlayer2 add: cardsToAffectPlayer;add: (CardOverloading named: 'CardOverloading1') .
	player1 := Player named: 'Scorpion' withCards: cardsPlayer1 andPositionHistory: player1History.
	player2 := Player named: 'Raiden' withCards: cardsPlayer2 andPositionHistory: player2History .
	laps := 1.
	collectionOfplayers add: player1.
	collectionOfplayers add: player2.
	gameDeckCard:= OrderedCollection new.
	gameDeckCard add: (CardUndo named: 'CardUndo2');add: (CardSpeed named: 'CardSpeed2') .
	game := Game
		playedBy: collectionOfplayers on: board throwing: collectionOfDices  winningWhenCompleting: laps 	withACardDeck: gameDeckCard.
	self assert: player2 cards size equals:2.
	player2 affectAPlayer: player1 withAnInstantCard: cardsToAffectPlayer into: game.
	self assert: player2  ~= game expectedPlayer.
	self assert: player2 cards size equals:1.
	
