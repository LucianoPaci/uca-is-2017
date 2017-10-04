tests
testRandomlyGeneratedBoardWithAmountOfSquares
	| board allSquaresCollection squares randomIndex|
	
	allSquaresCollection:=OrderedCollection new.
	40 timesRepeat: [ allSquaresCollection add: SquareWithoutEffect new ].
	15 timesRepeat: [ allSquaresCollection add: SquareWormHole new ].
	15 timesRepeat: [ allSquaresCollection add: SquareSpeedUp new ].
	23 timesRepeat: [ allSquaresCollection add: SquareTimeMachine new ].
	5 timesRepeat: [ allSquaresCollection add: SquareMoonWalk new ].
	2 timesRepeat: [ allSquaresCollection add: SquareAtomicBomb new ].
	
	squares:= OrderedCollection new.
	randomIndex :=Random new.
	30 timesRepeat:[squares add:(allSquaresCollection at: (randomIndex nextInt:100))].
	board:= Board definedSquares: squares.
	self assert: board amountOfSquares  equals: 30