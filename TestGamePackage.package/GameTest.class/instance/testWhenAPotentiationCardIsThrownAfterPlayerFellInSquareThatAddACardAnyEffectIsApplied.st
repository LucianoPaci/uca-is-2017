cards tests
testWhenAPotentiationCardIsThrownAfterPlayerFellInSquareThatAddACardAnyEffectIsApplied
	| playerLuchoHistory squares board diceOneFace collectionOfDices collectionOfPlayers playerLuchoDeck cardToAffectPlayer playerLucho laps gameDeck game cardToBeAdded |
	playerLuchoHistory := OrderedCollection new.
	playerLuchoHistory add: (PlayerPosition at: 1 withLaps: 0 withNumberOfSquaresTravelled:0).
	squares := (1 to: 16) collect: [ :n | SquareWithoutEffect initialized].
	board := Board definedSquares: squares.
	cardToBeAdded:= SquareThatAddACard
				withACardToBeAdded: (self aCollectionOfGameCards removeAt: 7).
	squares at: 4 put: cardToBeAdded.
	diceOneFace := Dice faces: 1 obtainingValuesFrom: (FixedNumberSource providing: #(3)).
	collectionOfDices := OrderedCollection new.
	collectionOfDices add: diceOneFace.
	collectionOfPlayers := OrderedCollection new.
	playerLuchoDeck := OrderedCollection new.
	cardToAffectPlayer := CardPotentiation named: 'CardPotentiation1'.
	playerLuchoDeck
		add: cardToAffectPlayer;
		add: (CardOverloading named: 'CardOverloading1').
	playerLucho := Player named: 'Player1' withCards: playerLuchoDeck andPositionHistory: playerLuchoHistory.
	laps := 1.
	collectionOfPlayers add: playerLucho.
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
	self assert: playerLucho cards size equals: 2.
	game  affect: playerLucho withAnInstantCard: cardToAffectPlayer of: playerLucho.
	self assert: playerLucho cards size equals: 1.
	self assert: playerLucho positions last squareNumber equals: 1.
	game nextTurnFor: playerLucho.
	self assert: playerLucho positions last squareNumber equals: 4.