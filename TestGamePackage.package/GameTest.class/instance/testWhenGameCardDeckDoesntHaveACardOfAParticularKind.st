cards tests
testWhenGameCardDeckDoesntHaveACardOfAParticularKind
|  board   game player squares dice aGameDeckCards collectionOfPlayerCards |
	aGameDeckCards := OrderedCollection new.
	aGameDeckCards add: CardSpeed new;
						add: CardUndo new.
	collectionOfPlayerCards:= OrderedCollection new.
	collectionOfPlayerCards add: (self aCollectionOfGameCards )removeFirst ; add: (self aCollectionOfGameCards )removeFirst.
	player := Player named: 'jorge' withCards:collectionOfPlayerCards.
	squares := (1 to: 8) collect: [ :n | SquareWithoutEffect onPosition: n ].
	board := Board definedSquares: squares.
	dice := Dice faces: 6.
	game := Game
		playedBy: (OrderedCollection with: player) on: board throwing: ( OrderedCollection with: Dice) winningWhenCompleting: 1 withACardDeck:  aGameDeckCards.
	self should: [game removeACardFromDeck: CardDamping ] raise: 	NoCardForAKindOfInGameCardError.
		
	