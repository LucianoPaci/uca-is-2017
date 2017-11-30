tests
testWhenSquareIsNotFoundInBoard
| squares board |
squares:= OrderedCollection new.
squares add: (SquareWormHole initialize).
squares add: (AtomicBombSquare  initialize).
board:= Board definedSquares: squares.
self should: [ board squareAtPosition:  -1] raise: GameFailed.