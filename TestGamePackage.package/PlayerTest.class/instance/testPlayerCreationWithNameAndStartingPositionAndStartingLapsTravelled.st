tests
testPlayerCreationWithNameAndStartingPositionAndStartingLapsTravelled
	| player |
	player := Player named: 'Jorge'.
	player cards add:CardSpeed new.
	player cards add: CardUndo new.
	self
		assert: player name equals: 'Jorge';
		assert: player lapsTravelled equals: 0;
		assert: player position equals: 1;
		assert: player cards size equals:2