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
		assert: (player getPositionAt:1) lap equals: 0;
		assert: (player getPositionAt:1) squareNumber equals: 1;
		assert: player cards size equals: 2