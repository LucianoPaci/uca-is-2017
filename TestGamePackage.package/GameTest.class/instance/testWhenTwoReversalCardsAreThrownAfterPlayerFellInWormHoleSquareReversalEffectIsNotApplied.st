cards tests
testWhenTwoReversalCardsAreThrownAfterPlayerFellInWormHoleSquareReversalEffectIsNotApplied
	| playerLuchoHistory squares board diceOneFace collectionOfDices collectionOfPlayers playerLuchoDeck firstCardToAffectPlayer playerLucho laps gameDeck game secondCardToAffectPlayer |
	playerLuchoHistory := OrderedCollection new.
	playerLuchoHistory add: (PlayerPosition at: 1 withLaps: 0 withNumberOfSquaresTravelled:0).
	squares := (1 to: 16) collect: [ :n | SquareWithoutEffect initialized].
	board := Board definedSquares: squares.
	squares at: 10 put: (SquareWormHole initialized).
	diceOneFace := Dice faces: 1 obtainingValuesFrom: (FixedNumberSource providing: #(9)).
	collectionOfDices := OrderedCollection new.
	collectionOfDices add: diceOneFace.
	collectionOfPlayers := OrderedCollection new.
	playerLuchoDeck := OrderedCollection new.
	firstCardToAffectPlayer := ReversalCard  named: 'ReversalCard1'.
	secondCardToAffectPlayer := ReversalCard named: 'ReversalCard2'.
	playerLuchoDeck
		add: firstCardToAffectPlayer;
		add: secondCardToAffectPlayer.
	playerLucho := Player named: 'Lucho' withCards: playerLuchoDeck andPositionHistory: playerLuchoHistory.
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
	game affect: playerLucho withAPermanentCard: firstCardToAffectPlayer of: playerLucho.
	game affect: playerLucho withAPermanentCard: secondCardToAffectPlayer of: playerLucho.
	self assert: playerLucho cards size equals: 0.
	self assert: playerLucho positions last squareNumber equals: 1.
	game nextTurnFor: playerLucho.
	self assert: playerLucho positions last squareNumber equals: 6.