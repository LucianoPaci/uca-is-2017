tests
testWhenPlayerFallsInWormHoleEffectSquareThenPlayerMovesFourPositionsBackwards
	| playerLucho game dice board squares playerLuchoHistory |
	playerLuchoHistory := OrderedCollection new.
	playerLuchoHistory add: (PlayerPosition at: 1 withLaps: 0).
	playerLucho := Player named: 'Lucho' withCards: self aCollectionOfGameCards removeFirst andPositionHistory: playerLuchoHistory.
	squares := (1 to: 10) collect: [ :n | SquareWithoutEffect onPosition: n ].
	squares at: 7 put: (SquareWormHole onPosition: 7).
	board := Board definedSquares: squares.
	dice := Dice faces: 3 obtainingValuesFrom: (FixedNumberSource providing: #(1 5 6)).
	game := Game
		playedBy: (OrderedCollection with: playerLucho)
		on: board
		throwing: (OrderedCollection with: dice)
		winningWhenCompleting: 1
		withACardDeck: self aCollectionOfGameCards.
	self assert: playerLucho lastPosition squareNumber equals: 1.
	game nextTurnFor: playerLucho.
	self assert: playerLucho lastPosition squareNumber equals: 2.
	game nextTurnFor: playerLucho.
	self assert: playerLucho lastPosition squareNumber equals: 3