tests
testPlayerCreationWithNameAndStartingPositionAndStartingLapsTravelled
	| player collectionOfCards|
	collectionOfCards := OrderedCollection new.
	collectionOfCards add: Card new.
	collectionOfCards add: Card new.
	player := Player named: 'Jorge' withACardDeck: collectionOfCards .	
	self
		assert: player name equals: 'Jorge';
		assert: player lapsTravelled equals: 0;
		assert: player position equals: 1;
		assert: player numberOfCards equals:2