Movement
testWhenPlayerCompletesALapThenLapsAreCorrectlyUpdated
	| player board dice game squares playerHistory |
	playerHistory := OrderedCollection new.
	playerHistory add: (PlayerPosition at: 1 withLaps: 0).
	player := Player named: 'jorge' withCards: (self aCollectionOfGameCards )removeFirst andPositionHistory: playerHistory.
	squares := (1 to: 8) collect: [ :n | SquareWithoutEffect onPosition: n ].
	board := Board definedSquares: squares.
	dice := Dice faces: 6.
	game := Game
		playedBy: (OrderedCollection with: player)
		on: board
		throwing: (OrderedCollection with: dice)
		winningWhenCompleting: 1
		withACardDeck: self aCollectionOfGameCards.
	self assert: (game getPlayerAtIndex:  1) currentPosition equals: 1.
	self assert: (game getPlayerAtIndex:  1) lapsTravelled equals: 0.
	game move: (game getPlayerAtIndex:  1) positions: 5.
	self assert: (player previousNPositions:1) squareNumber equals:1.
	self assert: (player previousNPositions:1) lap equals:0.
	self assert: (game getPlayerAtIndex:  1) lapsTravelled equals: 0.
	self assert: (game getPlayerAtIndex:  1) currentPosition equals: 6.
	game move: (game getPlayerAtIndex:  1) positions: 4.
	self assert: (player previousNPositions:1) squareNumber equals:6.
	self assert: (player previousNPositions:1) lap equals:0.
	self assert: (game getPlayerAtIndex:  1) currentPosition equals: 2.
	self assert: (game getPlayerAtIndex:  1) lapsTravelled equals: 1