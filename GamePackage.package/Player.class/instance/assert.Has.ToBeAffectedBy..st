use of cards
assert: aPlayer Has: aCard ToBeAffectedBy: aCancellationCard
	| cardToBeRemoved |
	(cardToBeRemoved := aPlayer
		selectAPermanentCardToBePlayedEqualsTo: aCard) isNotEmpty
		ifTrue: [ aCancellationCard addAPermanentCardToBeRemoved: cardToBeRemoved.
			aPlayer addAnInstantCardToBePlayed: aCancellationCard.
			cards remove: aCancellationCard ]
		ifFalse: [ GameFailed signal: 'La carta permanente no se encuentra en juego' ]