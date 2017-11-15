tests
testRandomlyGeneratedBoardWithDefinedAmountOfSquares
	| board |
	
	board := Board definedSquares: self aCollectionOfBoardSquares .
	self assert: (board squares select: [ :each | each isKindOf: SquareWithoutEffect ]) size equals: 40.
	self assert: (board squares select: [ :each | each isKindOf: SquareWormHole ]) size equals: 15.
	self assert: (board squares select: [ :each | each isKindOf: SquareSpeedUp ]) size equals: 15.
	self assert: (board squares select: [ :each | each isKindOf: SquareTimeMachine ]) size equals: 23.
	self assert: (board squares select: [ :each | each isKindOf: MoonWalkSquare ]) size equals: 5.
	self assert: (board squares select: [ :each | each isKindOf: AtomicBombSquare ]) size equals: 2