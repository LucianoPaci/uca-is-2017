Movement
testWhenPlayerMovesForwardWithoutDice
	| playerLucho board dice game squares playerLuchoHistory |
	playerLuchoHistory := OrderedCollection new.
	playerLuchoHistory add: (PlayerPosition at: 1 withLaps: 0).
	playerLucho := Player named: 'Lucho' withCards: self aCollectionOfGameCards removeFirst andPositionHistory: playerLuchoHistory.
	squares := (1 to: 8) collect: [ :n | SquareWithoutEffect onPosition: n ].
	board := Board definedSquares: squares.
	dice := Dice faces: 6.
	game := Game
		playedBy: (OrderedCollection with: playerLucho)
		on: board
		throwing: (OrderedCollection with: dice)
		winningWhenCompleting: 1
		withACardDeck: self aCollectionOfGameCards.
	self assert: (game getPlayerAtIndex: 1) lastPosition squareNumber equals: 1.
	game move: (game getPlayerAtIndex: 1) positions: 5.
	self assert: (game getPlayerAtIndex: 1) lastPosition squareNumber equals: 6.
	game move: (game getPlayerAtIndex: 1) positions: 2.
	self assert: (game getPlayerAtIndex: 1) lastPosition squareNumber equals: 1