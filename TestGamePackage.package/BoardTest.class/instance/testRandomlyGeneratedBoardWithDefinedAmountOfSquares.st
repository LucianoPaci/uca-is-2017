tests
testRandomlyGeneratedBoardWithDefinedAmountOfSquares
	| board squaresWithOutEffect squaresWornHole squaresSpeedUp squaresTimeMachine moonWalkSquares atomicBombSquares |
	
	board := Board definedSquares: self aCollectionOfBoardSquares .
	squaresWithOutEffect := (board squares) select: [ :square | square isMemberOf: SquareWithoutEffect].
	squaresWornHole := (board squares) select: [ :square | square isMemberOf: SquareWormHole].
	squaresSpeedUp := (board squares) select: [ :square | square isMemberOf: SquareSpeedUp ].
	squaresTimeMachine := (board squares) select: [ :square | square isMemberOf: SquareTimeMachine ].
	moonWalkSquares := (board squares) select: [ :square | square isMemberOf: MoonWalkSquare ].
	atomicBombSquares := (board squares) select: [ :square | square isMemberOf: AtomicBombSquare].
	self assert: (squaresWithOutEffect ) size equals: 40.
	self assert: (squaresWornHole) size equals: 15.
	self assert: (squaresSpeedUp) size equals: 15.
	self assert: (squaresTimeMachine ) size equals: 23.
	self assert: (moonWalkSquares) size equals: 5.
	self assert: (atomicBombSquares) size equals: 2.
	