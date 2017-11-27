cards tests
testWhenGameCardDeckDoesntHaveACardOfAParticularKind
	| board game playerLucho squares dice gameDeck playerLuchoDeck playerLuchoHistory |
	playerLuchoHistory := OrderedCollection new.
	playerLuchoHistory add: (PlayerPosition at: 1 withLaps: 0).
	gameDeck := OrderedCollection new.
	gameDeck
		add: (CardSpeed named: 'CardSpeed1');
		add: (CardSpeed named: 'CardSpeed2').
	playerLuchoDeck := OrderedCollection new.
	playerLuchoDeck
		add: self aCollectionOfGameCards removeFirst;
		add: (self aCollectionOfGameCards removeAt: 2).
	playerLucho := Player named: 'Lucho' withCards: playerLuchoDeck andPositionHistory: playerLuchoHistory.
	squares := (1 to: 8) collect: [ :n | SquareWithoutEffect onPosition: n ].
	board := Board definedSquares: squares.
	dice := Dice faces: 6.
	game := Game
		playedBy: (OrderedCollection with: playerLucho)
		on: board
		throwing: (OrderedCollection with: Dice)
		winningWhenCompleting: 1
		withACardDeck: gameDeck.
	cardNotInDeck := CardDamping named: 'CardDamping3'.
	self should: [game removeACardFromDeck: cardNotInDeck ] raise: 	GameFailed.

