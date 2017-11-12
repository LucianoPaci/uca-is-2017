tests
testWhenAPlayerCardIsEqualsToAnotherCard
	| aPlayer aPlayerCard anotherCard aCollectionOfCards |
	anotherCard := CardUndo named: 'CardUndo1'.
	aPlayerCard := CardUndo named: 'CardUndo1'.
	aCollectionOfCards := OrderedCollection new.
	aCollectionOfCards
		add: anotherCard;
		add: aPlayerCard.
	aPlayer := Player named: 'Scorpion' withCards: aCollectionOfCards.
	self assert: (aPlayer aCard: aPlayerCard isEqualTo: anotherCard) equals: true