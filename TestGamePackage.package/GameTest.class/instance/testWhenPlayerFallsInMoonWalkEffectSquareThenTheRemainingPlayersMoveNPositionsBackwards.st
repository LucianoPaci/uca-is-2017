squares tests
testWhenPlayerFallsInMoonWalkEffectSquareThenTheRemainingPlayersMoveNPositionsBackwards
	| player1 player2 game dice board squares player1History player2History |
	player1History := OrderedCollection new.
	player1History add: (PlayerPosition at: 1 withLaps: 0).
	player2History := OrderedCollection new.
	player2History add: (PlayerPosition at: 1 withLaps: 0).
	
	player1 := Player named: 'Lucho' withCards: (self aCollectionOfGameCards )removeFirst andPositionHistory: player1History.
	player2 := Player named: 'Juanma' withCards: ((self aCollectionOfGameCards )removeAt:2) andPositionHistory: player2History.
	squares := (1 to: 10) collect: [ :n | SquareWithoutEffect onPosition: n  ].
	squares at: 7 put: (MoonWalkSquare onPosition: 7 withEffect: -6).
	board := Board definedSquares: squares.
	dice := Dice faces: 3 obtainingValuesFrom: (FixedNumberSource providing: #(1 7 5)).
	game := Game
		playedBy: (OrderedCollection with: player1 with: player2)
		on: board
		throwing: (OrderedCollection with: dice)
		winningWhenCompleting: 1
		withACardDeck: self aCollectionOfGameCards.
	self assert: player1 currentPosition equals: 1.
	self assert: player2 currentPosition equals: 1.
	game nextTurnFor: player1.
	self assert: player1 currentPosition equals: 2.
	game nextTurnFor: player2.
	self assert: player2 currentPosition equals: 8.
	game nextTurnFor: player1.
	self assert: player1 currentPosition equals: 7.
	self assert: player2 currentPosition equals: 2