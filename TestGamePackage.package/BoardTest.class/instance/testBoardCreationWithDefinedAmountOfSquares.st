tests
testBoardCreationWithDefinedAmountOfSquares
	| board squares squareAtomicBomb squareWormHole |
	squareAtomicBomb:= AtomicBombSquare initialize.
	squareWormHole:= SquareWormHole initialize.
	squares:= OrderedCollection new.
	squares add: squareWormHole.
	squares add: squareAtomicBomb.
	board:= Board definedSquares: squares.
	self assert: board squares size  equals: 2