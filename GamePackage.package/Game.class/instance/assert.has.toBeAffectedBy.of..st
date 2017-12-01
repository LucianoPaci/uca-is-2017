asserting
assert: aPlayer has: aCard toBeAffectedBy: aCancellationCard of: anotherPlayer
	| cardToBeRemoved |
	(cardToBeRemoved := aPlayer selectAPermanentCardToBePlayedEqualsTo: aCard).
	aCancellationCard addAPermanentCardToBeRemoved: cardToBeRemoved.
	aPlayer addAnInstantCardToBePlayed: aCancellationCard.
	anotherPlayer removeACardFromDeck: aCancellationCard.
	