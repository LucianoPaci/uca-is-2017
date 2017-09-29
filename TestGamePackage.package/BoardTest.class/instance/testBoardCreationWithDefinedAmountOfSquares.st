tests
testBoardCreationWithDefinedAmountOfSquares
	| board squares squareAtomicBomb squareWormHole |
	squareAtomicBomb:= SquareAtomicBomb initialize.
	squareWormHole:= SquareWormHole initialize.
	squares:= OrderedCollection new.
	squares add: squareWormHole.
	squares add: squareAtomicBomb.
	board:= Board definedSquares: squares.
	self assert: board amountOfSquares  equals: 2