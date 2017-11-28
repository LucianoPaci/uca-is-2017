tests
testWhenAPlayerAffectsAnotherPlayerWithACardTheCardIsRemovedFromFirstPlayerCardDeck
	| squares board diceEightFaces diceSixFaces collectionOfDices collectionOfPlayers playerScorpion playerRaiden laps game cardToAffectPlayer playerScorpionDeck playerRaidenDeck gameDeck playerScorpionHistory playerRaidenHistory |
	playerScorpionHistory := OrderedCollection new.
	playerScorpionHistory add: (PlayerPosition at: 1 withLaps: 0).
	playerRaidenHistory := OrderedCollection new.
	playerRaidenHistory add: (PlayerPosition at: 1 withLaps: 0).
	squares := (1 to: 8) collect: [ :n | SquareWithoutEffect onPosition: n ].
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
	playerScorpionDeck
		add: (CardDamping named: 'CardDamping1');
		add: (CardDamping named: 'CardDamping2').
	cardToAffectPlayer := CardSpeed named: 'CardSpeed1'.
	playerRaidenDeck
		add: cardToAffectPlayer;
		add: (CardOverloading named: 'CardOverloading1').
	playerScorpion := Player named: 'Scorpion' withCards: playerScorpionDeck andPositionHistory: playerScorpionHistory.
	playerRaiden := Player named: 'Raiden' withCards: playerRaidenDeck andPositionHistory: playerRaidenHistory.
	laps := 1.
	collectionOfPlayers add: playerScorpion.
	collectionOfPlayers add: playerRaiden.
	gameDeck := OrderedCollection new.
	gameDeck
		add: (CardSpeed named: 'CardSpeed3');
		add: (CardSpeed named: 'CardSpeed2').
	game := Game
		playedBy: collectionOfPlayers
		on: board
		throwing: collectionOfDices
		winningWhenCompleting: laps
		withACardDeck: gameDeck.
	game nextTurnFor: playerScorpion.
	self assert: playerRaiden cards size equals: 2.
	game affect: playerScorpion withAPermanentCard: cardToAffectPlayer of: playerRaiden.
	self assert: playerRaiden cards size equals: 1