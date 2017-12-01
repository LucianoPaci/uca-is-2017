squares tests
testWhenPlayerFallsInTimeMachineEffectSquareThenPlayerMovesBackToPreviousPosition
	| playerLucho game dice board squares playerHistory |
	playerHistory := OrderedCollection new.
	playerHistory add: (PlayerPosition at: 1 withLaps: 0).
	playerLucho := Player named: 'Lucho' withCards: self aCollectionOfGameCards removeFirst andPositionHistory: playerHistory.
	squares := (1 to: 10) collect: [ :n | SquareWithoutEffect initialize].
	squares at: 7 put: (SquareTimeMachine initialize).
	board := Board definedSquares: squares.
	dice := Dice faces: 3 obtainingValuesFrom: (FixedNumberSource providing: #(1 5 6)).
	game := Game
		playedBy: (OrderedCollection with: playerLucho)
		on: board
		throwing: (OrderedCollection with: dice)
		winningWhenCompleting: 1
		withACardDeck: self aCollectionOfGameCards.
	self assert: playerLucho positions last squareNumber equals: 1.
	game nextTurnFor: playerLucho.
	self assert: playerLucho positions last squareNumber equals: 2.
	game nextTurnFor: playerLucho.
	self assert: playerLucho positions last squareNumber equals: 2