as yet unclassified
named: aName withACardDeck: aCollectionOfCards
	self assertShouldNotBeEmpty: aName.
	^ self new initializedNamed: aName initializedWithACardDeck: aCollectionOfCards.