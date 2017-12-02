squares tests
testWhenPlayerFallsInTimeMachineEffectSquareAfterCompletingALapThenPlayerMovesBackToPreviousPosition
	| playerLucho game dice board squares playerHistory |
	playerHistory := OrderedCollection new.
	playerHistory add: (PlayerPosition at: 1 withLaps: 0 withNumberOfSquaresTravelled:0).
	playerLucho := Player named: 'Lucho' withCards: self aCollectionOfGameCards removeFirst andPositionHistory: playerHistory.
	squares := (1 to: 3) collect: [ :n | SquareWithoutEffect initialized ].
	squares at: 2 put: (SquareTimeMachine initialized).
	board := Board definedSquares: squares.
	dice := Dice faces: 2 obtainingValuesFrom: (FixedNumberSource providing: #(4 2)).
	game := Game
		playedBy: (OrderedCollection with: playerLucho)
		on: board
		throwing: (OrderedCollection with: dice)
		winningWhenCompleting: 2
		withACardDeck: self aCollectionOfGameCards.
	self assert: playerLucho positions last squareNumber equals: 1.
	self assert: playerLucho positions last lap equals: 0.
	game nextTurnFor: playerLucho.
	self assert: playerLucho positions last squareNumber equals: 1.
	self assert: playerLucho positions last lap equals: 0.
	self assert: (playerLucho getPositionAt: playerLucho positions size -1) lap equals: 1.
	