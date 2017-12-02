Movement
testWhenPlayerFallsInLastSquareOfABoardPositiontLapMustKeepTheSame
| playerLuchoHistory playerLucho squares board dice game playerLuchoCards |
playerLuchoHistory := OrderedCollection new.
	playerLuchoHistory add: (PlayerPosition at: 1 withLaps: 0 withNumberOfSquaresTravelled:0).
	playerLuchoCards := OrderedCollection new.
	playerLuchoCards add: self aCollectionOfGameCards removeFirst ; add:(self aCollectionOfGameCards removeAt:2).
	playerLucho := Player named: 'Lucho' withCards: playerLuchoCards andPositionHistory: playerLuchoHistory.
	squares := (1 to: 8) collect: [ :n | SquareWithoutEffect initialize ].
	board := Board definedSquares: squares.
	dice := Dice faces: 6.
	game := Game
		playedBy: (OrderedCollection with: playerLucho)
		on: board
		throwing: (OrderedCollection with: dice)
		winningWhenCompleting: 1
		withACardDeck: self aCollectionOfGameCards.
	self assert: (game getPlayerAt: 1) positions last squareNumber equals: 1.
	game move: (game getPlayerAt: 1) positions: 5.
	self assert: (game getPlayerAt: 1) positions last squareNumber equals: 6.
	game move: (game getPlayerAt: 1) positions: 2.
	self assert: (game getPlayerAt: 1) positions last squareNumber equals: 8.
	self assert: (game getPlayerAt: 1) positions last lap equals: 0.