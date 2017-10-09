tests
testPlayerCreationWithNameAndStartingPositionAndStartingLapsTravelled
	| player |
	player := Player named: 'Jorge'.
	self
		assert: player name equals: 'Jorge';
		assert: player lapsTravelled equals: 0;
		assert: player position equals: 1