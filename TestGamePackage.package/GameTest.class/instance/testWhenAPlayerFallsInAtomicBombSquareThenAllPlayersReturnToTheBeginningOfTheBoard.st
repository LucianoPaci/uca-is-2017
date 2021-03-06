squares tests
testWhenAPlayerFallsInAtomicBombSquareThenAllPlayersReturnToTheBeginningOfTheBoard
	| playerLannister playerStark playerSnow game dice board squares playerLannisterHistory playerStarkHistory playerSnowHistory playerLannisterCardsDeck playerStarkCardsDeck playerSnowCardsDeck |
	playerLannisterHistory := OrderedCollection new.
	playerStarkHistory := OrderedCollection new.
	playerSnowHistory := OrderedCollection new.
	playerLannisterHistory add: (PlayerPosition at: 1 withLaps: 0 withNumberOfSquaresTravelled:0).
	playerStarkHistory add: (PlayerPosition at: 1 withLaps: 0 withNumberOfSquaresTravelled:0).
	playerSnowHistory add: (PlayerPosition at: 1 withLaps: 0 withNumberOfSquaresTravelled:0).
	playerLannisterCardsDeck := OrderedCollection new.
	playerStarkCardsDeck := OrderedCollection new.
	playerSnowCardsDeck := OrderedCollection new.
	playerLannisterCardsDeck add: self aCollectionOfGameCards removeFirst ; add: (self aCollectionOfGameCards removeAt:2).
	playerSnowCardsDeck add: (self aCollectionOfGameCards removeAt: 3); add: (self aCollectionOfGameCards removeAt:4).
	playerStarkCardsDeck add: (self aCollectionOfGameCards removeAt: 5); add: (self aCollectionOfGameCards removeAt:6).
	playerLannister := Player named: 'Lannister' withCards: playerLannisterCardsDeck  andPositionHistory: playerLannisterHistory.
	playerStark := Player named: 'Stark' withCards: playerStarkCardsDeck andPositionHistory: playerStarkHistory.
	playerSnow := Player named: 'Snow' withCards: playerSnowCardsDeck andPositionHistory: playerSnowHistory.
	squares := (1 to: 8) collect: [ :n | SquareWithoutEffect initialized].
	squares at: 6 put: (AtomicBombSquare initialized).
	board := Board definedSquares: squares.
	dice := Dice faces: 6 obtainingValuesFrom: (FixedNumberSource providing: #(1 2 3 4 5 6)).
	game := Game
		playedBy: (OrderedCollection with: playerLannister with: playerStark with: playerSnow)
		on: board
		throwing: (OrderedCollection with: dice)
		winningWhenCompleting: 1
		withACardDeck: self aCollectionOfGameCards.
	self assert: playerLannister positions last squareNumber equals: 1.
	self assert: playerStark positions last squareNumber equals: 1.
	self assert: playerSnow positions last squareNumber equals: 1.
	game nextTurnFor: playerLannister.
	self assert: playerLannister positions last squareNumber equals: 2.
	game nextTurnFor: playerStark.
	self assert: playerStark positions last squareNumber equals: 3.
	game nextTurnFor: playerSnow.
	self assert: playerSnow positions last squareNumber equals: 4.
	game nextTurnFor: playerLannister.
	self
		assert: playerLannister positions last squareNumber equals: 1;
		assert: playerLannister positions last lap equals: 0;
		assert: playerStark positions last squareNumber equals: 1;
		assert: playerStark positions last lap equals: 0;
		assert: playerSnow positions last squareNumber equals: 1;
		assert: playerSnow positions last lap equals: 0