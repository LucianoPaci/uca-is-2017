tests
testWhenAPlayerCardIsEqualsToAnotherCard
	| aPlayer aPlayerCard  aCollectionOfCards aPlayerHistory |
	aCollectionOfCards := OrderedCollection new.
	aPlayerCard := CardDamping named: 'CardDamping1'.
	aCollectionOfCards
		add: aPlayerCard.
	aPlayerHistory := OrderedCollection new.
	aPlayerHistory add: (PlayerPosition at: 1 withLaps: 0).
	aPlayer := Player named: 'Scorpion' withCards: aCollectionOfCards andPositionHistory:aPlayerHistory.
	self assert: (aPlayerCard isEqualTo: aPlayerCard) equals: true