tests
testPlayerCreationWithNameAndStartingPositionAndStartingLapsTravelled
	| player cardsCollection playerHistory |
	playerHistory := OrderedCollection new.
	playerHistory add: (PlayerPosition at: 1 withLaps:0 ).
	cardsCollection := OrderedCollection new.
	cardsCollection add: (CardSpeed named: 'CardSpeed1') ; add:(CardUndo named: 'CardUndo1') .
	player := Player named: 'Jorge' withCards: cardsCollection andPositionHistory: playerHistory.
	self
		assert: player name equals: 'Jorge';
		assert: player lapsTravelled equals: 0;
		assert: player currentPosition equals: 1;
		assert: player cards size equals:2.
	
	