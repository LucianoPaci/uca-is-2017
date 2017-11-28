asserting
assert: aPlayer has: aCard toBeAffectedBy: aCancellationCard of: anotherPlayer
	| cardToBeRemoved |
	(cardToBeRemoved := aPlayer selectAPermanentCardToBePlayedEqualsTo: aCard) isNotEmpty
		ifTrue: [ aCancellationCard addAPermanentCardToBeRemoved: cardToBeRemoved.
			aPlayer addAnInstantCardToBePlayed: aCancellationCard.
			anotherPlayer removeACardFromDeck: aCancellationCard ]
		ifFalse: [ GameFailed signal: 'La carta permanente no se encuentra en juego' ]