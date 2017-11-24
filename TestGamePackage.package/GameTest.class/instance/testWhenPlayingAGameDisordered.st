playing
testWhenPlayingAGameDisordered
	| squares board diceEightFaces diceSixFaces collectionOfDices collectionOfplayers playerScorpion playerJuanMa laps game playerRaiden playerScorpionHistory playerRaidenHistory playerJuanMaHistory |
	playerScorpionHistory := OrderedCollection new.
	playerScorpionHistory add: (PlayerPosition at: 1 withLaps: 0).
	playerRaidenHistory := OrderedCollection new.
	playerRaidenHistory add: (PlayerPosition at: 1 withLaps: 0).
	playerJuanMaHistory := OrderedCollection new.
	playerJuanMaHistory add: (PlayerPosition at: 1 withLaps: 0).
	squares := (1 to: 8) collect: [ :n | SquareWithoutEffect onPosition: n ].
	board := Board definedSquares: squares.
	diceEightFaces := Dice faces: 8 obtainingValuesFrom: (FixedNumberSource providing: #(1 2 3 4 5 6 7 8)).
	diceSixFaces := Dice faces: 6 obtainingValuesFrom: (FixedNumberSource providing: #(1 2 3 4 5 6)).
	collectionOfDices := OrderedCollection new.
	collectionOfDices
		add: diceSixFaces;
		add: diceEightFaces.
	collectionOfplayers := OrderedCollection new.
	playerScorpion := Player named: 'Scorpion' withCards: self aCollectionOfGameCards removeFirst andPositionHistory: playerScorpionHistory .
	playerRaiden := Player named: 'Raiden' withCards: self aCollectionOfGameCards removeFirst andPositionHistory: playerRaidenHistory .
	playerJuanMa := Player named: 'JuanMa' withCards: self aCollectionOfGameCards removeFirst andPositionHistory: playerJuanMaHistory .
	laps := 1.
	collectionOfplayers add: playerScorpion.
	collectionOfplayers add: playerRaiden.
	collectionOfplayers add: playerJuanMa.
	game := Game
		playedBy: collectionOfplayers
		on: board
		throwing: collectionOfDices
		winningWhenCompleting: laps
		withACardDeck: self aCollectionOfGameCards.
	self assert: game expectedPlayer equals: playerScorpion.
	game nextTurnFor: playerScorpion.
	self assert: game expectedPlayer equals: playerRaiden.
	game nextTurnFor: playerRaiden.
	self assert: game expectedPlayer equals: playerJuanMa.
	self should: [ game nextTurnFor: playerRaiden ] raise: GameFailed.
	self assert: game expectedPlayer equals: playerJuanMa.
	game nextTurnFor: playerJuanMa.
	self assert: game expectedPlayer equals: playerScorpion