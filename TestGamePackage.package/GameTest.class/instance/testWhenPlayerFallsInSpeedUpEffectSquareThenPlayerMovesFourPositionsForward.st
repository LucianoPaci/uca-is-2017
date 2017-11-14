squares tests
testWhenPlayerFallsInSpeedUpEffectSquareThenPlayerMovesFourPositionsForward
	| player game dice board squares playerHistory |
	playerHistory := OrderedCollection new.
	playerHistory add: (PlayerPosition at: 1 withLaps: 0).
	player := Player named: 'Nahuel' withCards: self aCollectionOfGameCards removeFirst andPositionHistory: playerHistory.
	squares := (1 to: 9) collect: [ :n | SquareWithoutEffect onPosition: n ].
	squares at: 2 put: (SquareSpeedUp onPosition: 2).
	board := Board definedSquares: squares.
	dice := Dice faces: 6 obtainingValuesFrom: (FixedNumberSource providing: #(1 5 3 4 5 6)).
	game := Game
		playedBy: (OrderedCollection with: player)
		on: board
		throwing: (OrderedCollection with: dice)
		winningWhenCompleting: 1
		withACardDeck: self aCollectionOfGameCards.
	self assert: player currentPosition equals: 1.
	game nextTurnFor: player.
	self assert: player currentPosition equals: 6.
	game nextTurnFor: player.
	self assert: player currentPosition equals: 6.
	self assert: player lapsTravelled equals: 1