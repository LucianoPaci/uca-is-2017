tests
aCollectionOfBoardSquares
	| allSquaresCollection fixedNumberSource squares |
	squares := OrderedCollection new.
	allSquaresCollection := OrderedCollection new.
	40 timesRepeat: [allSquaresCollection add: (SquareWithoutEffect onPosition: allSquaresCollection size +1) ].
	15 timesRepeat: [ allSquaresCollection add: (SquareWormHole onPosition:  allSquaresCollection size +1) ].
	15 timesRepeat: [ allSquaresCollection add: (SquareSpeedUp onPosition: allSquaresCollection size +1) ].
	23 timesRepeat: [ allSquaresCollection add: (SquareTimeMachine onPosition: allSquaresCollection size +1) ].
	5 timesRepeat: [  allSquaresCollection add: (MoonWalkSquare onPosition: allSquaresCollection size +1 withEffect:1) ].
	2 timesRepeat: [ allSquaresCollection add: (AtomicBombSquare onPosition: allSquaresCollection size +1) ].
	fixedNumberSource := FixedNumberSource providing: allSquaresCollection.
	100 timesRepeat: [ squares add: (fixedNumberSource nextInt: 100) ].
	^ squares