tests
testPlayerCreationWithNameAndStartingPositionAndStartingLapsTravelled
	| player playerDeck playerHistory |
	playerHistory := OrderedCollection new.
	playerHistory add: (PlayerPosition at: 1 withLaps: 0).
	playerDeck := OrderedCollection new.
	playerDeck
		add: (CardSpeed named: 'CardSpeed1');
		add: (CardOverloading named: 'CardOverloading1').
	player := Player named: 'Jorge' withCards: playerDeck andPositionHistory: playerHistory.
	self
		assert: player name equals: 'Jorge';
		assert: player lapsTravelled equals: 0;
		assert: player currentPosition equals: 1;
		assert: player numberOfCardsInDeck equals: 2