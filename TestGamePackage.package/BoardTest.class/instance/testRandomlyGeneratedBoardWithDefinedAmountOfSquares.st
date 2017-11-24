tests
testRandomlyGeneratedBoardWithDefinedAmountOfSquares
	| board |
	
	board := Board definedSquares: self aCollectionOfBoardSquares .
	self assert: (board returnACollectionOfSquaresFromASpecificKind: SquareWithoutEffect ) size equals: 40.
	self assert: (board returnACollectionOfSquaresFromASpecificKind: SquareWormHole ) size equals: 15.
	self assert: (board returnACollectionOfSquaresFromASpecificKind: SquareSpeedUp ) size equals: 15.
	self assert: (board returnACollectionOfSquaresFromASpecificKind: SquareTimeMachine ) size equals: 23.
	self assert: (board returnACollectionOfSquaresFromASpecificKind: MoonWalkSquare ) size equals: 5.
	self assert: (board returnACollectionOfSquaresFromASpecificKind: AtomicBombSquare ) size equals: 2