tests
testBoardCreationWithDefinedAmountOfSquares
	| board |
	board := Board squares: 30.
	self assert: board amountOfSquares  equals: 30