cards tests
testWhenGameCardDeckDoesntHaveACardOfAParticularKind
|  board   game player squares dice aGameDeckCards collectionOfPlayerCards playerHistory cardNotInDeck |
	playerHistory := OrderedCollection new.
	playerHistory add: (PlayerPosition at: 1 withLaps: 0).
	aGameDeckCards := OrderedCollection new.
	aGameDeckCards add: (CardSpeed named: 'CardSpeed1');
						add: (CardSpeed named:'CardSpeed2').
	collectionOfPlayerCards:= OrderedCollection new.
	collectionOfPlayerCards add: (self aCollectionOfGameCards )removeFirst ; add: ((self aCollectionOfGameCards )removeAt:2).
	player := Player named: 'jorge' withCards:collectionOfPlayerCards andPositionHistory: playerHistory.
	squares := (1 to: 8) collect: [ :n | SquareWithoutEffect onPosition: n ].
	board := Board definedSquares: squares.
	dice := Dice faces: 6.
	game := Game
		playedBy: (OrderedCollection with: player) on: board throwing: ( OrderedCollection with: Dice) winningWhenCompleting: 1 withACardDeck:  aGameDeckCards.
	cardNotInDeck := CardDamping named: 'CardDamping3'.
	self should: [game removeACardFromDeck: cardNotInDeck ] raise: 	GameFailed.
		
	