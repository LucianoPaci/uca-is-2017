intialization
initializedNamed: aName initializedWithACardDeck: aCollectionOfCards initializedPositionHistory: aCollectionOfPositions
	name := aName.
	position := aCollectionOfPositions.
	lapsTravelled := 0.	"must be removed. Will be implemented inside positionHistory Collection"
	cards := aCollectionOfCards.
	permanentCardsToBePlayed := OrderedCollection new.
	instantCardsToBePlayed := OrderedCollection new