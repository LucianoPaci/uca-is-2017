tests
testWhenPlayerFallsInMoonWalkEffectSquareThenTheRemainingPlayersMoveNPositionsBackwards
	| player1 player2 game dice board squares |
	player1 := Player named: 'Lucho' withACardDeck: self aCollectionOfCards.
	player2 := Player named: 'Juanma' withACardDeck: self aCollectionOfCards.
	squares := (1 to: 10) collect: [ :n | SquareWithoutEffect onPosition: n  ].
	squares at: 7 put: (MoonWalkSquare onPosition: 7 withEffect: -6).
	board := Board definedSquares: squares.
	dice := Dice faces: 3 obtainingValuesFrom: (FixedNumberSource providing: #(1 7 5)).
	game := Game
		playedBy: (OrderedCollection with: player1 with: player2)
		on: board
		throwing: (OrderedCollection with: dice)
		winningWhenCompleting: 1.
	self assert: player1 position equals: 1.
	self assert: player2 position equals: 1.
	game nextTurnFor: player1.
	self assert: player1 position equals: 2.
	game nextTurnFor: player2.
	self assert: player2 position equals: 8.
	game nextTurnFor: player1.
	self assert: player1 position equals: 7.
	self assert: player2 position equals: 2