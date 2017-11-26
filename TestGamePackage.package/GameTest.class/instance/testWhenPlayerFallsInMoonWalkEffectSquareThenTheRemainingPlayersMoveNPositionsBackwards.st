squares tests
testWhenPlayerFallsInMoonWalkEffectSquareThenTheRemainingPlayersMoveNPositionsBackwards
	| playerLucho playerJuanma game dice board squares playerLuchoHistory playerJuanmaHistory |
	playerLuchoHistory := OrderedCollection new.
	playerLuchoHistory add: (PlayerPosition at: 1 withLaps: 0).
	playerJuanmaHistory := OrderedCollection new.
	playerJuanmaHistory add: (PlayerPosition at: 1 withLaps: 0).
	playerLucho := Player named: 'Lucho' withCards: self aCollectionOfGameCards removeFirst andPositionHistory: playerLuchoHistory.
	playerJuanma := Player named: 'Juanma' withCards: (self aCollectionOfGameCards removeAt: 2) andPositionHistory: playerJuanmaHistory.
	squares := (1 to: 10) collect: [ :n | SquareWithoutEffect onPosition: n ].
	squares at: 7 put: (MoonWalkSquare onPosition: 7 withEffect: -6).
	board := Board definedSquares: squares.
	dice := Dice faces: 3 obtainingValuesFrom: (FixedNumberSource providing: #(1 7 5)).
	game := Game
		playedBy: (OrderedCollection with: playerLucho with: playerJuanma)
		on: board
		throwing: (OrderedCollection with: dice)
		winningWhenCompleting: 1
		withACardDeck: self aCollectionOfGameCards.
	self assert: playerLucho currentPosition equals: 1.
	self assert: playerJuanma currentPosition equals: 1.
	game nextTurnFor: playerLucho.
	self assert: playerLucho currentPosition equals: 2.
	game nextTurnFor: playerJuanma.
	self assert: playerJuanma currentPosition equals: 8.
	game nextTurnFor: playerLucho.
	self assert: playerLucho currentPosition equals: 7.
	self assert: playerJuanma currentPosition equals: 2