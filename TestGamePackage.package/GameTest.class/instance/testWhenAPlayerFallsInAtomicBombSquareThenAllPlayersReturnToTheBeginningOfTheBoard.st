tests
testWhenAPlayerFallsInAtomicBombSquareThenAllPlayersReturnToTheBeginningOfTheBoard
	| player1 player2 player3 game dice board squares |
	player1 := Player named: 'JaimeLannister' withCards: (self aCollectionOfGameCards )removeFirst.
	player2 := Player named: 'NedStark' withCards: (self aCollectionOfGameCards )removeFirst.
	player3 := Player named: 'Jon Snow' withCards: (self aCollectionOfGameCards )removeFirst.
	squares := (1 to: 8) collect: [ :n | SquareWithoutEffect onPosition: n ]. 
	squares at: 6 put: (AtomicBombSquare onPosition: 6).
	board := Board definedSquares: squares.
	dice := Dice faces: 6 obtainingValuesFrom: (FixedNumberSource providing: #(1 2 3 4 5 6)).
	game := Game
		playedBy: (OrderedCollection with: player1 with: player2 with: player3)
		on: board
		throwing: (OrderedCollection with: dice)
		winningWhenCompleting: 1
		withACardDeck: self aCollectionOfGameCards.
	self assert: player1 position equals: 1.
	self assert: player2 position equals: 1.
	self assert: player3 position equals: 1.
	game nextTurnFor: player1.
	self assert: player1 position equals: 2.
	game nextTurnFor: player2.
	self assert: player2 position equals: 3.
	game nextTurnFor: player3.
	self assert: player3 position equals: 4.
	game nextTurnFor: player1.
	self
		assert: player1 position equals: 1;
		assert: player1 lapsTravelled equals: 0;
		assert: player2 position equals: 1;
		assert: player2 lapsTravelled equals: 0;
		assert: player3 position equals: 1;
		assert: player3 lapsTravelled equals: 0