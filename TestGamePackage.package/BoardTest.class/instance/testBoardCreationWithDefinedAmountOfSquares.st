tests
testBoardCreationWithDefinedAmountOfSquares
	| board squares   |
	squares:= OrderedCollection new.
	squares add: (SquareWormHole initialize).
	squares add: (AtomicBombSquare  initialize).
	board:= Board definedSquares: squares.
	self assert: board squares size equals: 2