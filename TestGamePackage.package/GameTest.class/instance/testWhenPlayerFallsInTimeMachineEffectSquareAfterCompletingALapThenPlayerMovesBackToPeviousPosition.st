tests
testWhenPlayerFallsInTimeMachineEffectSquareAfterCompletingALapThenPlayerMovesBackToPeviousPosition
	| player1 game dice board squares | 
	player1 := Player named: 'Lucho' withACardDeck: self aCollectionOfCards.
	squares := (1 to: 3) collect: [ :n | SquareWithoutEffect onPosition: n ].
	squares at: 2 put: (SquareTimeMachine onPosition: 2).
	board := Board definedSquares: squares.
	dice := Dice faces: 2 obtainingValuesFrom: (FixedNumberSource providing: #(4 2)).
	game := Game
		playedBy: (OrderedCollection with: player1)
		on: board
		throwing: (OrderedCollection with: dice)
		winningWhenCompleting: 2.
	self assert: player1 position equals: 1.
	self assert: player1 lapsTravelled equals: 0.
	game nextTurnFor: player1.
	self assert: player1 position equals: 1.
	self assert: player1 lapsTravelled equals: 0.
	self assert: player1 previousLap equals: 0.
	game nextTurnFor: player1.
	self assert: player1 position equals: 1.
	self assert: player1 lapsTravelled equals: 1.	
	self assert: player1 previousLap equals: 0.