cards tests
testWhenAPotentiationCardIsThrownAfterPlayerFellInSpeedUpSquare
	| player1History squares board diceOneFace collectionOfDices collectionOfplayers cardsPlayer1 |
	
	player1History := OrderedCollection new.
	player1History add: (PlayerPosition at: 1 withLaps: 0).
	squares:= (1 to: 12) collect: [:n | SquareWithoutEffect onPosition: n ].
	board := Board definedSquares: squares.
	squares at: 4 put: (SquareSpeedUp onPosition: 4).
	diceOneFace := Dice faces: 1 obtainingValuesFrom: (FixedNumberSource providing: #(3)).
	collectionOfDices := OrderedCollection new.
	collectionOfDices add: diceOneFace.
	collectionOfplayers := OrderedCollection new.
	cardsPlayer1 := OrderedCollection new.