playing
testWhenPlayingAGameDisordered
	| squares board diceEightFaces diceSixFaces collectionOfDices collectionOfPlayers playerScorpion playerJuanma laps game playerRaiden playerScorpionHistory playerRaidenHistory playerJuanmaHistory |
	playerScorpionHistory := OrderedCollection new.
	playerScorpionHistory add: (PlayerPosition at: 1 withLaps: 0).
	playerRaidenHistory := OrderedCollection new.
	playerRaidenHistory add: (PlayerPosition at: 1 withLaps: 0).
	playerJuanmaHistory := OrderedCollection new.
	playerJuanmaHistory add: (PlayerPosition at: 1 withLaps: 0).
	squares := (1 to: 8) collect: [ :n | SquareWithoutEffect initialized ].
	board := Board definedSquares: squares.
	diceEightFaces := Dice faces: 8 obtainingValuesFrom: (FixedNumberSource providing: #(1 2 3 4 5 6 7 8)).
	diceSixFaces := Dice faces: 6 obtainingValuesFrom: (FixedNumberSource providing: #(1 2 3 4 5 6)).
	collectionOfDices := OrderedCollection new.
	collectionOfDices
		add: diceSixFaces;
		add: diceEightFaces.
	collectionOfPlayers := OrderedCollection new.
	playerScorpion := Player named: 'Scorpion' withCards: self aCollectionOfGameCards removeFirst andPositionHistory: playerScorpionHistory.
	playerRaiden := Player named: 'Raiden' withCards: (self aCollectionOfGameCards removeAt: 2) andPositionHistory: playerRaidenHistory.
	playerJuanma := Player named: 'Juanma' withCards: (self aCollectionOfGameCards removeAt: 3) andPositionHistory: playerJuanmaHistory.
	laps := 1.
	collectionOfPlayers add: playerScorpion.
	collectionOfPlayers add: playerRaiden.
	collectionOfPlayers add: playerJuanma.
	game := Game
		playedBy: collectionOfPlayers
		on: board
		throwing: collectionOfDices
		winningWhenCompleting: laps
		withACardDeck: self aCollectionOfGameCards.
	self assert: game expectedPlayer equals: playerScorpion.
	game nextTurnFor: playerScorpion.
	self assert: game expectedPlayer equals: playerRaiden.
	game nextTurnFor: playerRaiden.
	self assert: game expectedPlayer equals: playerJuanma.
	self should: [ game nextTurnFor: playerRaiden ] raise: GameFailed.
	self assert: game expectedPlayer equals: playerJuanma.
	game nextTurnFor: playerJuanma.
	self assert: game expectedPlayer equals: playerScorpion