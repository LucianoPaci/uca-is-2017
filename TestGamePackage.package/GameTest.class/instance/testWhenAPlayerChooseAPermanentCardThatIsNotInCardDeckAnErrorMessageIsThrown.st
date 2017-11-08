tests
testWhenAPlayerChooseAPermanentCardThatIsNotInCardDeckAnErrorMessageIsThrown
	| player cardSpeed aCollectionOfUndoCards |
	cardSpeed := CardSpeed named: 'cardSpeed'.
	player := Player named: 'JaimeLannister'.
	aCollectionOfUndoCards := OrderedCollection new.
	aCollectionOfUndoCards:= self aCollectionOfGameCards select: [:each | each isMemberOf: CardUndo ].
	player cards add: aCollectionOfUndoCards removeFirst.
	player addAPermanentCardToBePlayed: (self aCollectionOfGameCards select: [:each | each isMemberOf: CardUndo ]) removeFirst.
	self assert: player permanentCardsToBePlayed size equals: 1.
	self should: [player addAPermanentCardToBePlayed: cardSpeed] raise: 	PermanentCardIsNotInPlayerDeckError.
		
		
	