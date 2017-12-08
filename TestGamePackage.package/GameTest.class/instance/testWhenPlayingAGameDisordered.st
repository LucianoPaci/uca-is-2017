playing
testWhenPlayingAGameDisordered
	| squares board diceEightFaces diceSixFaces collectionOfDices collectionOfPlayers playerScorpion playerJuanma laps game playerRaiden playerScorpionHistory playerRaidenHistory playerJuanmaHistory playerRaidenCards playerScorpionCards playerJuanMaCards |
	playerScorpionHistory := OrderedCollection new.
	playerScorpionHistory add: (PlayerPosition at: 1 withLaps: 0 withNumberOfSquaresTravelled: 0).
	playerRaidenHistory := OrderedCollection new.
	playerRaidenHistory add: (PlayerPosition at: 1 withLaps: 0 withNumberOfSquaresTravelled: 0).
	playerJuanmaHistory := OrderedCollection new.
	playerJuanmaHistory add: (PlayerPosition at: 1 withLaps: 0 withNumberOfSquaresTravelled:0 ).
	squares := (1 to: 8) collect: [ :n | SquareWithoutEffect initialized ].
	board := Board definedSquares: squares.
	diceEightFaces := Dice faces: 8 obtainingValuesFrom: (FixedNumberSource providing: #(1 2 3 4 5 6 7 8)).
	diceSixFaces := Dice faces: 6 obtainingValuesFrom: (FixedNumberSource providing: #(1 2 3 4 5 6)).
	collectionOfDices := OrderedCollection new.
	collectionOfDices
		add: diceSixFaces;
		add: diceEightFaces.
	collectionOfPlayers := OrderedCollection new.
	playerRaidenCards := OrderedCollection new.
	playerScorpionCards := OrderedCollection new.
	playerJuanMaCards := OrderedCollection new.
	playerJuanMaCards add: (self aCollectionOfGameCards removeAt:5 ); add:(self aCollectionOfGameCards removeAt:6).
	playerRaidenCards add: (self aCollectionOfGameCards removeFirst ); add:(self aCollectionOfGameCards removeAt:2).
	playerScorpionCards  add: (self aCollectionOfGameCards removeAt:3 ); add:(self aCollectionOfGameCards removeAt:4).
	
	playerScorpion := Player named: 'Scorpion' withCards: playerScorpionCards  andPositionHistory: playerScorpionHistory.
	playerRaiden := Player named: 'Raiden' withCards: playerRaidenCards andPositionHistory: playerRaidenHistory.
	playerJuanma := Player named: 'Juanma' withCards: playerJuanMaCards andPositionHistory: playerJuanmaHistory.
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
	game nextTurnFor: playerRaiden.
	self should: [ game nextTurnFor: playerRaiden ] raise: GameFailed.
	game nextTurnFor: playerJuanma.
	