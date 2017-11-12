intialization
initializedNamed: aName initializedWithACardDeck: aCollectionOfCards
	name := aName.
	position := OrderedCollection new.
	lapsTravelled := 0.
	cards := aCollectionOfCards.
	permanentCardsToBePlayed := OrderedCollection new.
	instantCardsToBePlayed := OrderedCollection new