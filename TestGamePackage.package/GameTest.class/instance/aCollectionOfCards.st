as yet unclassified
aCollectionOfCards
	| aCollectionOfCards |
	aCollectionOfCards := OrderedCollection new.
	aCollectionOfCards add: CardUndo initializate;
							 add: CardUndo initializate.
	^aCollectionOfCards.