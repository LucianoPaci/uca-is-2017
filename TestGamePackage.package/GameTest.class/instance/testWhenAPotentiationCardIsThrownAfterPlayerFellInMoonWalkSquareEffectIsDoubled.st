tests
testWhenAPotentiationCardIsThrownAfterPlayerFellInMoonWalkSquareEffectIsDoubled
	| playerJuanmaHistory squares board diceOneFace collectionOfDices collectionOfPlayers playerJuanmaDeck cardToAffectPlayer playerJuanma laps gameDeck game playerLuchoHistory playerLuchoDeck playerLucho |
	playerJuanmaHistory := OrderedCollection new.
	playerJuanmaHistory add: (PlayerPosition at: 1 withLaps: 0).
	playerLuchoHistory := OrderedCollection new.
	playerLuchoHistory add: (PlayerPosition at: 3 withLaps: 0).
	squares := (1 to: 16) collect: [ :n | SquareWithoutEffect onPosition: n ].
	board := Board definedSquares: squares.
	squares at: 4 put: (MoonWalkSquare onPosition: 4 withEffect: -1).
	diceOneFace := Dice faces: 1 obtainingValuesFrom: (FixedNumberSource providing: #(3)).
	collectionOfDices := OrderedCollection new.
	collectionOfDices add: diceOneFace.
	collectionOfPlayers := OrderedCollection new.
	playerJuanmaDeck := OrderedCollection new.
	cardToAffectPlayer := CardPotentiation named: 'CardPotentiation1'.
	playerJuanmaDeck
		add: cardToAffectPlayer;
		add: (CardOverloading named: 'CardOverloading1').
	playerJuanma := Player named: 'Juanma' withCards: playerJuanmaDeck andPositionHistory: playerJuanmaHistory.
	playerLuchoDeck := OrderedCollection new.
	playerLuchoDeck add: (CardSpeed named: 'CardSpeed1').
	playerLucho := Player named: 'Lucho' withCards: playerLuchoDeck andPositionHistory: playerLuchoHistory.
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
	self assert: playerJuanma numberOfCardsInDeck equals: 2.
	playerJuanma affect: playerJuanma withAnInstantCard: cardToAffectPlayer into: game.
	self assert: playerJuanma numberOfCardsInDeck equals: 1.
	self assert: playerLucho currentPosition equals: 3.
	self assert: playerJuanma currentPosition equals: 1.
	game nextTurnFor: playerJuanma.
	self assert: playerLucho currentPosition equals: 1.
	self assert: playerJuanma currentPosition equals: 4