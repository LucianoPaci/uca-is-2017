tests
aCollectionOfBoardSquares
	| allSquaresCollection fixedNumberSource squares |
	squares := OrderedCollection new.
	allSquaresCollection := OrderedCollection new.
	40 timesRepeat: [ allSquaresCollection add: SquareWithoutEffect new ].
	15 timesRepeat: [ allSquaresCollection add: SquareWormHole new ].
	15 timesRepeat: [ allSquaresCollection add: SquareSpeedUp new ].
	23 timesRepeat: [ allSquaresCollection add: SquareTimeMachine new ].
	5 timesRepeat: [ allSquaresCollection add: MoonWalkSquare new ].
	2 timesRepeat: [ allSquaresCollection add: AtomicBombSquare new ].
	fixedNumberSource := FixedNumberSource providing: allSquaresCollection.
	100 timesRepeat: [ squares add: (fixedNumberSource nextInt: 100) ].
	^ squares