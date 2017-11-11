tests
testWhenPlayerUsesInstaCardInHisTurnForHisBehalf
	| squares board diceEightFaces diceSixFaces collectionOfDices collectionOfplayers playerMe playerDude1 playerDude2 laps game |
	
	squares:= (1 to: 8) collect: [:n | SquareWithoutEffect onPosition: n ].
	
	board := Board definedSquares: squares.
	diceEightFaces := Dice
		faces: 8
		obtainingValuesFrom: (FixedNumberSource providing: #(1 2 3 4 5 6 7 8)).
	collectionOfDices := OrderedCollection new.
	collectionOfDices
		add: diceEightFaces.
	collectionOfplayers := OrderedCollection new.
	playerMe := Player named: 'Me'.
	playerDude1 := Player named: 'Dude1'.
	playerDude2 := Player named: 'Dude2'.
	laps := 1.
	collectionOfplayers add: playerMe .
	collectionOfplayers add: playerDude1 .
	collectionOfplayers add: playerDude2 .
	game := Game
		playedBy: collectionOfplayers on: board throwing: collectionOfDices  winningWhenCompleting: laps 		withACardDeck: self aCollectionOfGameCards.
				playerMe cards add: (game removeACardFromDeck: CardUndo).
	self assert: game expectedPlayer  equals: playerMe.
	game nextTurnFor: playerMe .
	self assert: game expectedPlayer equals: playerDude1 .
	game nextTurnFor: playerDude1.
	self assert: game expectedPlayer equals: playerDude2 .
	playerMe affectAnotherPlayer: playerDude1  withACard: (game removeACardFromDeck: CardUndo).
	self deny: game expectedPlayer = playerMe.
	
	