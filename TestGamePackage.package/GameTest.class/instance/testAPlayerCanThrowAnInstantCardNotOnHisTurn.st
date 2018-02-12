cards tests
testAPlayerCanThrowAnInstantCardNotOnHisTurn
	| playerJuanmaHistory playerLuchoHistory squares board diceEightFaces collectionOfDices collectionOfPlayers playerJuanmaDeck playerLuchoDeck cardToAffectPlayer playerJuanma playerLucho laps gameDeck game |
	playerJuanmaHistory := OrderedCollection new.
	playerJuanmaHistory add: (PlayerPosition at: 1 withLaps: 0 withNumberOfSquaresTravelled:0).
	playerLuchoHistory := OrderedCollection new.
	playerLuchoHistory add: (PlayerPosition at: 1 withLaps: 0 withNumberOfSquaresTravelled:0).
	squares := (1 to: 8) collect: [ :n | SquareWithoutEffect initialize].
	board := Board definedSquares: squares.
	diceEightFaces := Dice faces: 8 obtainingValuesFrom: (FixedNumberSource providing: #(1 2 3 4 5 6 7 8)).
	collectionOfDices := OrderedCollection new.
	collectionOfDices add: diceEightFaces.
	collectionOfPlayers := OrderedCollection new.
	playerJuanmaDeck := OrderedCollection new.
	playerLuchoDeck := OrderedCollection new.
	playerJuanmaDeck
		add: (CardDamping named: 'CardDamping1');
		add: (CardSpeed named: 'CardSpeed2').
	cardToAffectPlayer := CardSpeed named: 'CardSpeed1'.
	playerLuchoDeck
		add: cardToAffectPlayer;
		add: (CardOverloading named: 'CardOverloading1').
	playerJuanma := Player named: 'Juanma' withCards: playerJuanmaDeck andPositionHistory: playerJuanmaHistory.
	playerLucho := Player named: 'Lucho' withCards: playerLuchoDeck andPositionHistory: playerLuchoHistory.
	laps := 1.
	collectionOfPlayers add: playerJuanma.
	collectionOfPlayers add: playerLucho.
	gameDeck := OrderedCollection new.
	gameDeck
		add: (CardSpeed named: 'CardSpeed4');
		add: (CardSpeed named: 'CardSpeed3').
	game := Game
		playedBy: collectionOfPlayers
		on: board
		throwing: collectionOfDices
		winningWhenCompleting: laps
		withACardDeck: gameDeck.
	self assert: playerLucho cards size equals: 2.
	game affect: playerJuanma withAnInstantCard: cardToAffectPlayer of: playerLucho.
	self assert: playerLucho cards size equals: 1.
	self should: [ game nextTurnFor: playerLucho] 	raise: GameFailed.
	