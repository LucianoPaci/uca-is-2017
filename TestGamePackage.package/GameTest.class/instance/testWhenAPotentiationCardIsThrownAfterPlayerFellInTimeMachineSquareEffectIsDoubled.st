tests
testWhenAPotentiationCardIsThrownAfterPlayerFellInTimeMachineSquareEffectIsDoubled
	| playerJuanmaHistory playerLuchoHistory squares board diceOneFace collectionOfDices collectionOfPlayers playerJuanmaDeck cardToAffectPlayer playerJuanma playerLuchoDeck playerLucho laps gameDeck game |
	playerJuanmaHistory := OrderedCollection new.
	playerJuanmaHistory add: (PlayerPosition at: 1 withLaps: 0).
	playerLuchoHistory := OrderedCollection new.
	playerLuchoHistory add: (PlayerPosition at: 1 withLaps: 0).
	squares := (1 to: 16) collect: [ :n | SquareWithoutEffect onPosition: n ].
	board := Board definedSquares: squares.
	squares at: 4 put: (SquareTimeMachine onPosition: 4).
	diceOneFace := Dice faces: 1 obtainingValuesFrom: (FixedNumberSource providing: #(1 1 1 1 1 1)).
	collectionOfDices := OrderedCollection new.
	collectionOfDices add: diceOneFace.
	collectionOfPlayers := OrderedCollection new.
	playerJuanmaDeck := OrderedCollection new.
	cardToAffectPlayer := CardPotentiation named: 'CardPotentiation1'.
	playerJuanmaDeck
		add: cardToAffectPlayer;
		add: (CardOverloading named: 'CardOverloading1').
	playerJuanma := Player named: 'Player1' withCards: playerJuanmaDeck andPositionHistory: playerJuanmaHistory.
	playerLuchoDeck := OrderedCollection new.
	playerLuchoDeck add: (CardSpeed named: 'CardSpeed1').
	playerLucho := Player named: 'playerLucho' withCards: playerLuchoDeck andPositionHistory: playerLuchoHistory.
	laps := 1.
	collectionOfPlayers
		add: playerJuanma;
		add: playerLucho.
	gameDeck := OrderedCollection new.
	gameDeck
		add: (CardOverloading named: 'CardOverloading2');
		add: (CardSpeed named: 'CardSpeed2').
	game := Game
		playedBy: collectionOfPlayers
		on: board
		throwing: collectionOfDices
		winningWhenCompleting: laps
		withACardDeck: gameDeck.
	self assert: playerJuanma cards size equals: 2.
	self assert: playerJuanma cards size equals: 2.
	self assert: playerLucho positions last squareNumber equals: 1.
	self assert: playerJuanma positions last squareNumber equals: 1.
	game nextTurnFor: playerJuanma.
	self assert: playerLucho positions last squareNumber equals: 1.
	self assert: playerJuanma positions last squareNumber equals: 2.
	game nextTurnFor: playerLucho.
	self assert: playerJuanma positions last squareNumber equals: 2.
	self assert: playerLucho positions last squareNumber equals: 2.
	game nextTurnFor: playerJuanma.
	self assert: playerJuanma positions last squareNumber equals: 3.
	self assert: playerLucho positions last squareNumber equals: 2.
	game nextTurnFor: playerLucho.
	self assert: playerLucho positions last squareNumber equals: 3.
	self assert: playerJuanma positions last squareNumber equals: 3.
	game affect: playerJuanma withAnInstantCard: cardToAffectPlayer of: playerJuanma.
	game nextTurnFor: playerJuanma.
	self assert: playerJuanma positions last squareNumber equals: 3.
	self assert: playerJuanma instantCardsToBePlayed  size equals: 0