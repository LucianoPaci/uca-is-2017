cards tests
testWhenPlayerAffectsWithACardAnotherPlayerNotOnHisTurnAnErrorMessageIsThrown
	| squares board diceEightFaces diceSixFaces collectionOfDices collectionOfPlayers playerScorpion playerRaiden playerJuanma laps game cardToAffectPlayer playerScorpionDeck playerRaidenDeck playerJuanmaDeck playerScorpionHistory playerRaidenHistory playerJuanmaHistory |
	playerScorpionHistory := OrderedCollection new.
	playerScorpionHistory add: (PlayerPosition at: 1 withLaps: 0 withNumberOfSquaresTravelled:0).
	playerRaidenHistory := OrderedCollection new.
	playerRaidenHistory add: (PlayerPosition at: 1 withLaps: 0 withNumberOfSquaresTravelled:0).
	playerJuanmaHistory := OrderedCollection new.
	playerJuanmaHistory add: (PlayerPosition at: 1 withLaps: 0 withNumberOfSquaresTravelled:0).
	squares := (1 to: 8) collect: [ :n | SquareWithoutEffect initialized].
	board := Board definedSquares: squares.
	diceEightFaces := Dice faces: 8 obtainingValuesFrom: (FixedNumberSource providing: #(1 2 3 4 5 6 7 8)).
	diceSixFaces := Dice faces: 6 obtainingValuesFrom: (FixedNumberSource providing: #(1 2 3 4 5 6)).
	collectionOfDices := OrderedCollection new.
	collectionOfDices
		add: diceSixFaces;
		add: diceEightFaces.
	collectionOfPlayers := OrderedCollection new.
	playerScorpionDeck := OrderedCollection new.
	playerRaidenDeck := OrderedCollection new.
	playerJuanmaDeck := OrderedCollection new.
	playerScorpionDeck
		add: self aCollectionOfGameCards removeFirst;
		add: (self aCollectionOfGameCards removeAt: 2).
	playerRaidenDeck
		add: (self aCollectionOfGameCards removeAt: 3);
		add: (self aCollectionOfGameCards removeAt: 4).
	playerJuanmaDeck
		add: (self aCollectionOfGameCards removeAt: 5);
		add: (self aCollectionOfGameCards removeAt: 6).
	playerScorpion := Player named: 'Scorpion' withCards: playerScorpionDeck andPositionHistory: playerScorpionHistory.
	playerRaiden := Player named: 'Raiden' withCards: playerRaidenDeck andPositionHistory: playerRaidenHistory.
	playerJuanma := Player named: 'Juanma' withCards: playerJuanmaDeck andPositionHistory: playerJuanmaHistory.
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
	game nextTurnFor: playerScorpion.
	cardToAffectPlayer := self aCollectionOfGameCards removeFirst.
	self should: [ game affect: playerRaiden withAPermanentCard: cardToAffectPlayer of: playerScorpion ] raise: GameFailed