tests
aCollectionOfBoardSquares
	| allSquaresCollection fixedNumberSource squares |
	squares := OrderedCollection new.
	allSquaresCollection := OrderedCollection new.
	40 timesRepeat: [allSquaresCollection add: (SquareWithoutEffect initializate) ].
	15 timesRepeat: [ allSquaresCollection add: (SquareWormHole initializate) ].
	15 timesRepeat: [ allSquaresCollection add: (SquareSpeedUp initializate)].
	23 timesRepeat: [ allSquaresCollection add: (SquareTimeMachine initializate) ].
	5 timesRepeat: [  allSquaresCollection add: (MoonWalkSquare initializeWithEffect:1) ].
	2 timesRepeat: [ allSquaresCollection add: (AtomicBombSquare initializate) ].
	fixedNumberSource := FixedNumberSource providing: allSquaresCollection.
	100 timesRepeat: [ squares add: (fixedNumberSource nextInt: 100) ].
	^ squares