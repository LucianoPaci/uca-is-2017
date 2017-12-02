Movement
testWhenPlayerCompletesALapThenLapsAreCorrectlyUpdated
	| playerLucho board dice game squares playerLuchoHistory playerLuchoCards |
	playerLuchoHistory := OrderedCollection new.
	playerLuchoHistory add: (PlayerPosition at: 1 withLaps: 0 withNumberOfSquaresTravelled:0).
	playerLuchoCards := OrderedCollection new.
	playerLuchoCards add: self aCollectionOfGameCards removeFirst ; add:(self aCollectionOfGameCards removeAt:2).
	playerLucho := Player named: 'Lucho' withCards: playerLuchoCards andPositionHistory: playerLuchoHistory.
	squares := (1 to: 8) collect: [ :n | SquareWithoutEffect initialize].
	board := Board definedSquares: squares.
	dice := Dice faces: 6.
	game := Game
		playedBy: (OrderedCollection with: playerLucho)
		on: board
		throwing: (OrderedCollection with: dice)
		winningWhenCompleting: 1
		withACardDeck: self aCollectionOfGameCards.
	self assert: (game getPlayerAt: 1) positions last squareNumber equals: 1.
	self assert: (game getPlayerAt: 1) positions last lap equals: 0.
	game move: (game getPlayerAt: 1) positions: 5.
	self assert: (playerLucho getPositionAt:  (playerLucho positions size -1)) squareNumber equals: 1.
	self assert: (playerLucho getPositionAt:  (playerLucho positions size -1)) lap equals: 0.
	self assert: (game getPlayerAt: 1) positions last lap equals: 0.
	self assert: (game getPlayerAt: 1) positions last squareNumber equals: 6.
	game move: (game getPlayerAt: 1) positions: 4.
	self assert: (playerLucho getPositionAt:  (playerLucho positions size -1)) squareNumber equals: 6.
	self assert: (playerLucho getPositionAt:  (playerLucho positions size -1)) lap equals: 0.
	self assert: (game getPlayerAt: 1) positions last squareNumber equals: 2.
	self assert: (game getPlayerAt: 1) positions last lap equals: 1