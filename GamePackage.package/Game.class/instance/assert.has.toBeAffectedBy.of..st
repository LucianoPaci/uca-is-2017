asserting
assert: aPlayer has: aCard toBeAffectedBy: aCancellationCard of: anotherPlayer
	| cardToBeRemoved |
	cardToBeRemoved := aPlayer selectAPermanentCardToBePlayedEqualsTo: aCard.
	(cardToBeRemoved  protectionCards ) ifNotEmpty: [ cardToBeRemoved removeProtectionCard ]
	ifEmpty:[aCancellationCard addAPermanentCardToBeRemoved: cardToBeRemoved.
	aPlayer addAnInstantCardToBePlayed: aCancellationCard.
	anotherPlayer removeACardFromDeck: aCancellationCard.].
	"if aCard has protection, borrar protection. Sino, lo de abajo"