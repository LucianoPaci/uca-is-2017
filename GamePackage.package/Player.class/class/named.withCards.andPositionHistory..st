instantiation
named: aName withCards: aCollectionOfCards andPositionHistory: aCollectionOfPositions
	self assertShouldNotBeEmpty: aName.
	self assertMustHaveTwoCards: aCollectionOfCards.
	^ self new initializedNamed: aName initializedWithACardDeck: aCollectionOfCards initializedPositionHistory: aCollectionOfPositions 