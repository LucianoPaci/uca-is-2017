as yet unclassified
named: aName withCards: aCollectionOfCards
	self assertShouldNotBeEmpty: aName.
	^ self new initializedNamed: aName initializedWithACardDeck: aCollectionOfCards.