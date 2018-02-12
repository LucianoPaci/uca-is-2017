squares tests
testWhenPlayerFallsInWormHoleEffectSquareThenPlayerMovesFourPositionsBackwards
	| playerLucho game dice board squares playerLuchoHistory playerLuchoCards |
	playerLuchoHistory := OrderedCollection new.
	playerLuchoHistory add: (PlayerPosition at: 1 withLaps: 0 withNumberOfSquaresTravelled: 0).
	playerLuchoCards := OrderedCollection new.
	playerLuchoCards add: self aCollectionOfGameCards removeFirst ; add:(self aCollectionOfGameCards removeAt:2).
	playerLucho := Player named: 'Lucho' withCards: playerLuchoCards andPositionHistory: playerLuchoHistory.
	squares := (1 to: 10) collect: [ :n | SquareWithoutEffect initialized ].
	squares at: 7 put: (SquareWormHole initialized).
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
	self assert: playerLucho positions last squareNumber equals: 3