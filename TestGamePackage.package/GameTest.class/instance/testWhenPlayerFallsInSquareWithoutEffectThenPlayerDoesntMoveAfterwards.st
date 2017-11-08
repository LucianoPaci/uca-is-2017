Movement
testWhenPlayerFallsInSquareWithoutEffectThenPlayerDoesntMoveAfterwards
	| player game dice board squares |
	player := Player named: 'JaimeLannister'.
	squares := (1 to: 6) collect: [ :n | SquareWithoutEffect onPosition: n ].
	board := Board definedSquares: squares.
	dice := Dice faces: 6 obtainingValuesFrom: (FixedNumberSource providing: #(1 2 3 4 5 6)).
	game := Game
		playedBy: (OrderedCollection with: player)
		on: board
		throwing: (OrderedCollection with: dice)
		winningWhenCompleting: 1
		withACardDeck: self aCollectionOfGameCards.
	self assert: player position equals: 1.
	game nextTurnFor: player.
	self assert: player position equals: 2