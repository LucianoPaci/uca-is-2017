intialization
initializedNamed: aName 
	name := aName.
	position := 1.
	lapsTravelled := 0.
	cards := OrderedCollection new.
	permanentCardsToBePlayed := OrderedCollection new.
	permanentCardsToBePlayedAddedByAnotherPlayer := OrderedCollection new.