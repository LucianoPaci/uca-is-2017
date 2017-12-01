tests
aCollectionOfBoardSquares
	| allSquaresCollection fixedNumberSource squares |
	squares := OrderedCollection new.
	allSquaresCollection := OrderedCollection new.
	40 timesRepeat: [allSquaresCollection add: (SquareWithoutEffect initialize) ].
	15 timesRepeat: [ allSquaresCollection add: (SquareWormHole initialize) ].
	15 timesRepeat: [ allSquaresCollection add: (SquareSpeedUp initialize)].
	23 timesRepeat: [ allSquaresCollection add: (SquareTimeMachine initialize) ].
	5 timesRepeat: [  allSquaresCollection add: (MoonWalkSquare initializeWithEffect:1) ].
	2 timesRepeat: [ allSquaresCollection add: (AtomicBombSquare initialize) ].
	fixedNumberSource := FixedNumberSource providing: allSquaresCollection.
	100 timesRepeat: [ squares add: (fixedNumberSource nextInt: 100) ].
	^ squares