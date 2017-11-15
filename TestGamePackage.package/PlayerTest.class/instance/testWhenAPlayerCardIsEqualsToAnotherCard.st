tests
testWhenAPlayerCardIsEqualsToAnotherCard
	| aPlayer aPlayerCard anotherCard aCollectionOfCards aPlayerHistory |
	anotherCard := CardDamping  named: 'CardDamping1'.
	aPlayerCard := CardDamping  named: 'CardDamping1'.
	aCollectionOfCards := OrderedCollection new.
	aCollectionOfCards
		add: anotherCard;
		add: aPlayerCard.
	aPlayerHistory := OrderedCollection new.
	aPlayerHistory add: (PlayerPosition at: 1 withLaps: 0).
	aPlayer := Player named: 'Scorpion' withCards: aCollectionOfCards andPositionHistory:aPlayerHistory.
	self assert: (aPlayer aCard: aPlayerCard isEqualTo: anotherCard) equals: true