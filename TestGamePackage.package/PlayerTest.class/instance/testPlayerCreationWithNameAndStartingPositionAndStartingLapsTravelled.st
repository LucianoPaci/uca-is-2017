tests
testPlayerCreationWithNameAndStartingPositionAndStartingLapsTravelled
	| player cardsCollection |
	cardsCollection := OrderedCollection new.
	cardsCollection add: (CardSpeed named: 'CardSpeed1') ; add:(CardUndo named: 'CardUndo1') .
	player := Player named: 'Jorge' withCards: cardsCollection.
	self
		assert: player name equals: 'Jorge';
		assert: player lapsTravelled equals: 0;
		assert: player position equals: 1;
		assert: player cards size equals:2.
	
	