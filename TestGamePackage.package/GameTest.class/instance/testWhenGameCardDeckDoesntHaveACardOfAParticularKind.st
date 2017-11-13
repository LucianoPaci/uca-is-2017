tests
testWhenGameCardDeckDoesntHaveACardOfAParticularKind
|  board   game player squares dice aGameDeckCards collectionOfPlayerCards playerHistory |
	playerHistory := OrderedCollection new.
	playerHistory add: (PlayerPosition at: 1 withLaps: 0).
	aGameDeckCards := OrderedCollection new.
	aGameDeckCards add: CardSpeed new;
						add: CardUndo new.
	collectionOfPlayerCards:= OrderedCollection new.
	collectionOfPlayerCards add: (self aCollectionOfGameCards )removeFirst ; add: (self aCollectionOfGameCards )removeFirst.
	player := Player named: 'jorge' withCards:collectionOfPlayerCards andPositionHistory: playerHistory.
	squares := (1 to: 8) collect: [ :n | SquareWithoutEffect onPosition: n ].
	board := Board definedSquares: squares.
	dice := Dice faces: 6.
	game := Game
		playedBy: (OrderedCollection with: player) on: board throwing: ( OrderedCollection with: Dice) winningWhenCompleting: 1 withACardDeck:  aGameDeckCards.
	self should: [game removeACardFromDeck: CardDamping ] raise: 	NoCardForAKindOfInGameCardError.
		
	