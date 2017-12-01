tests
aCollectionOfBoardSquares
	| allSquaresCollection fixedNumberSource squares |
	squares := OrderedCollection new.
	allSquaresCollection := OrderedCollection new.
	40 timesRepeat: [allSquaresCollection add: (SquareWithoutEffect initialized) ].
	15 timesRepeat: [ allSquaresCollection add: (SquareWormHole initialized) ].
	15 timesRepeat: [ allSquaresCollection add: (SquareSpeedUp initialized)].
	23 timesRepeat: [ allSquaresCollection add: (SquareTimeMachine initialized) ].
	5 timesRepeat: [  allSquaresCollection add: (MoonWalkSquare initializeWithEffect:1) ].
	2 timesRepeat: [ allSquaresCollection add: (AtomicBombSquare initialized) ].
	fixedNumberSource := FixedNumberSource providing: allSquaresCollection.
	100 timesRepeat: [ squares add: (fixedNumberSource nextInt: 100) ].
	^ squares