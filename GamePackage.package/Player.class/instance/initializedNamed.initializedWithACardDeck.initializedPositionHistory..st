intialization
initializedNamed: aName initializedWithACardDeck: aCollectionOfCards initializedPositionHistory: aCollectionOfPositions
	name := aName.
	positions := aCollectionOfPositions.
	cards := aCollectionOfCards.
	permanentCardsToBePlayed := OrderedCollection new.
	instantCardsToBePlayed := OrderedCollection new.
	