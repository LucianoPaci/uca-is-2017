asserting
assert: aPlayer has: aCard toBeAffectedBy: aCancellationCard of: anotherPlayer
	| cardToBeRemoved protCar|
	cardToBeRemoved := aPlayer selectAPermanentCardToBePlayedEqualsTo: aCard.
	protCar:=cardToBeRemoved first.
	( protCar protectionCards) ifNotEmpty: [ protCar removeProtectionCard ]
	ifEmpty:[aCancellationCard addAPermanentCardToBeRemoved: cardToBeRemoved.
	aPlayer addAnInstantCardToBePlayed: aCancellationCard. 
	anotherPlayer removeACardFromDeck: aCancellationCard.].
	