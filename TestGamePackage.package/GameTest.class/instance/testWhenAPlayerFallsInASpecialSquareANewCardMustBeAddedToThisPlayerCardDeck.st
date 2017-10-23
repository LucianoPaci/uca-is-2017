tests
testWhenAPlayerFallsInASpecialSquareANewCardMustBeAddedToThisPlayerCardDeck
| player game dice board squares |
	player := Player named: 'Johny Maidana' withACardDeck: self aCollectionOfCards.
	squares := (1 to: 3) collect: [ :n | SquareWithoutEffect onPosition: n ].
	squares at: 1 put: (SquareThatAddADampingCard  onPosition: 1).
	squares at: 3 put: (SquareThatAddADampingCard  onPosition: 3).
	board := Board definedSquares: squares.
	dice := Dice faces: 6 obtainingValuesFrom: (FixedNumberSource providing: #(1 2 3 4 5 6)).
	game := Game
		playedBy: (OrderedCollection with: player)
		on: board
		throwing: (OrderedCollection with: dice)
		winningWhenCompleting: 1.
	self assert: player numberOfCards equals:2.
	game nextTurnFor: player.
	self assert: player numberOfCards equals:2.
	game nextTurnFor: player.
	self assert: player numberOfCards equals:3.
	game nextTurnFor: player.
	self assert: player numberOfCards equals:4.