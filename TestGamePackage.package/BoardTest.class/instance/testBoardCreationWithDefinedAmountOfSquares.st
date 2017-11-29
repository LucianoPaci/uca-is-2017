tests
testBoardCreationWithDefinedAmountOfSquares
	| board squares   |
	squares:= OrderedCollection new.
	squares add: (SquareWormHole onPosition: 1).
	squares add: (AtomicBombSquare  onPosition: 2).
	board:= Board definedSquares: squares.
	self assert: board squares size equals: 2