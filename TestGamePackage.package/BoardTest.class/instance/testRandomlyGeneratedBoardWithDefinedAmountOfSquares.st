tests
testRandomlyGeneratedBoardWithDefinedAmountOfSquares
| squares allSquaresCollection board fixedNumberSource |

squares:= OrderedCollection new.
allSquaresCollection := OrderedCollection new.

40 timesRepeat: [ allSquaresCollection add: SquareWithoutEffect new ].
15 timesRepeat: [ allSquaresCollection add: SquareWormHole new ].
15 timesRepeat: [ allSquaresCollection add: SquareSpeedUp new ].
23 timesRepeat: [ allSquaresCollection add: SquareTimeMachine new ].
5 timesRepeat: [ allSquaresCollection add: MoonWalkSquare new ].
2 timesRepeat: [ allSquaresCollection add: AtomicBombSquare new ].

fixedNumberSource := FixedNumberSource providing: allSquaresCollection. 
100 timesRepeat: [squares  add:(fixedNumberSource nextInt: 100)].

board:= Board definedSquares: squares.


self assert: (board squares select: [ :each | each isKindOf: SquareWithoutEffect] ) size equals: 40.
self assert: (board squares select: [ :each | each isKindOf: SquareWormHole] ) size equals: 15.
self assert: (board squares select: [ :each | each isKindOf: SquareSpeedUp] ) size equals: 15.
self assert: (board squares select: [ :each | each isKindOf: SquareTimeMachine] ) size equals: 23.
self assert: (board squares select: [ :each | each isKindOf: MoonWalkSquare] ) size equals: 5.
self assert: (board squares select: [ :each | each isKindOf: AtomicBombSquare] ) size equals: 2.


