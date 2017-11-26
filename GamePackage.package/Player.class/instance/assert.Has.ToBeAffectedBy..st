use of cards
assert: aPlayer has: aCard toBeAffectedBy: aCancellationCard
	| cardToBeRemoved |
	(cardToBeRemoved := aPlayer
		selectAPermanentCardToBePlayedEqualsTo: aCard) isNotEmpty
		ifTrue: [ aCancellationCard addAPermanentCardToBeRemoved: cardToBeRemoved.
			aPlayer addAnInstantCardToBePlayed: aCancellationCard.
			cards remove: aCancellationCard ]
		ifFalse: [ GameFailed signal: 'La carta permanente no se encuentra en juego' ]