tests
testWhenAPlayerThrowsADampingCardASpeedCardAndAnOverloadingCardSevenPositionsMustBeMovedFromOrigin
| squares board  diceOneFace collectionOfDices collectionOfplayers  playerRaiden cardsPlayerRaiden laps gameDeckCard game firstCardToAffectPlayer secondCardToAffectPlayer thirdCardToAffectPlayer |
	squares:= (1 to: 10) collect: [:n | SquareWithoutEffect onPosition: n ].
	squares at: 4 put: (SquareSpeedUp  onPosition: 4).
	board := Board definedSquares: squares.
	diceOneFace := Dice
		faces: 1
		obtainingValuesFrom: (FixedNumberSource providing: #(4)).
	collectionOfDices := OrderedCollection new.
	collectionOfDices
		add: diceOneFace.
	collectionOfplayers := OrderedCollection new.
	cardsPlayerRaiden := OrderedCollection new.
	firstCardToAffectPlayer := CardSpeed named: 'CardSpeed1'.
	secondCardToAffectPlayer := CardOverloading named: 'CardOverloading1'.
	thirdCardToAffectPlayer :=CardDamping named: 'CardDamping1'.
	cardsPlayerRaiden add: firstCardToAffectPlayer;add: secondCardToAffectPlayer; add: thirdCardToAffectPlayer .
	playerRaiden := Player named: 'Raiden' withCards:cardsPlayerRaiden.
	collectionOfplayers add: playerRaiden.
	laps := 1.
	gameDeckCard:= OrderedCollection new.
	gameDeckCard add: (CardUndo named: 'CardUndo2');add: (CardSpeed named: 'CardSpeed2') .
	game := Game
		playedBy: collectionOfplayers on: board throwing: collectionOfDices  winningWhenCompleting: laps 	withACardDeck: gameDeckCard.
	playerRaiden affectAPlayer: playerRaiden withAPermanentCard: firstCardToAffectPlayer   into: game. 
	playerRaiden affectAPlayer: playerRaiden withAPermanentCard: secondCardToAffectPlayer   into: game.
	playerRaiden affectAPlayer: playerRaiden withAPermanentCard: thirdCardToAffectPlayer   into: game.
	self assert: playerRaiden permanentCardsToBePlayed size equals:3.
	game nextTurnFor: playerRaiden.
	self assert: playerRaiden previousPosition equals:4.
	self assert: playerRaiden position equals: 6.
	
		
		
