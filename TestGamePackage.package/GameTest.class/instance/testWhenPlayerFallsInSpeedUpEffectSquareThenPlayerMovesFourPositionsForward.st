squares tests
testWhenPlayerFallsInSpeedUpEffectSquareThenPlayerMovesFourPositionsForward
	| playerLucho game dice board squares playerLuchoHistory |
	playerLuchoHistory := OrderedCollection new.
	playerLuchoHistory add: (PlayerPosition at: 1 withLaps: 0).
	playerLucho := Player named: 'Lucho' withCards: self aCollectionOfGameCards removeFirst andPositionHistory: playerLuchoHistory.
	squares := (1 to: 9) collect: [ :n | SquareWithoutEffect initializate].
	squares at: 2 put: (SquareSpeedUp initializate).
	board := Board definedSquares: squares.
	dice := Dice faces: 6 obtainingValuesFrom: (FixedNumberSource providing: #(1 5 3 4 5 6)).
	game := Game
		playedBy: (OrderedCollection with: playerLucho)
		on: board
		throwing: (OrderedCollection with: dice)
		winningWhenCompleting: 1
		withACardDeck: self aCollectionOfGameCards.
	self assert: playerLucho positions last squareNumber equals: 1.
	game nextTurnFor: playerLucho.
	self assert: playerLucho positions last squareNumber equals: 6.
	game nextTurnFor: playerLucho.
	self assert: playerLucho positions last squareNumber equals: 6.
	self assert: playerLucho positions last lap equals: 1