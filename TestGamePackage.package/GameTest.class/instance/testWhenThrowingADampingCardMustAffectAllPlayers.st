tests
testWhenThrowingADampingCardMustAffectAllPlayers
	| squares board diceEightFaces diceSixFaces collectionOfDices collectionOfPlayers playerScorpion playerRaiden laps game cardToAffectPlayer playerScorpionDeck playerRaidenDeck gameDeck playerJuanmaDeck playerJuanma playerScorpionHistory playerRaidenHistory playerJuanmaHistory |
	playerScorpionHistory := OrderedCollection new.
	playerScorpionHistory add: (PlayerPosition at: 1 withLaps: 0).
	playerRaidenHistory := OrderedCollection new.
	playerRaidenHistory add: (PlayerPosition at: 1 withLaps: 0).
	playerJuanmaHistory := OrderedCollection new.
	playerJuanmaHistory add: (PlayerPosition at: 1 withLaps: 0).
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
	playerJuanmaDeck := OrderedCollection new.
	cardToAffectPlayer := CardDamping named: 'CardDamping2'.
	playerRaidenDeck
		add: cardToAffectPlayer;
		add: (CardOverloading named: 'CardOverloading1').
	playerScorpionDeck
		add: (CardDamping named: 'CardDamping1');
		add: (CardOverloading named: 'CardOverloading2').
	playerJuanmaDeck
		add: (CardSpeed named: 'CardSpeed1');
		add: (CardSpeed named: 'CardSpeed2').
	playerScorpion := Player named: 'Scorpion' withCards: playerScorpionDeck andPositionHistory: playerScorpionHistory.
	playerRaiden := Player named: 'Raiden' withCards: playerRaidenDeck andPositionHistory: playerRaidenHistory.
	playerJuanma := Player named: 'Juanma' withCards: playerJuanmaDeck andPositionHistory: playerJuanmaHistory.
	laps := 1.
	collectionOfPlayers add: playerScorpion.
	collectionOfPlayers add: playerRaiden.
	collectionOfPlayers add: playerJuanma.
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
	game nextTurnFor: playerScorpion.
	self assert: playerScorpion numberOfPermanentCardsToBePlayed equals: 0.
	self assert: playerRaiden numberOfPermanentCardsToBePlayed equals: 0.
	self assert: playerJuanma numberOfPermanentCardsToBePlayed equals: 0.
	playerRaiden affect: playerScorpion withAPermanentCard: cardToAffectPlayer into: game.
	self assert: playerRaiden numberOfCardsInDeck equals: 1.
	self assert: playerScorpion numberOfPermanentCardsToBePlayed equals: 1.
	self assert: playerRaiden numberOfPermanentCardsToBePlayed equals: 1.
	self assert: playerJuanma numberOfPermanentCardsToBePlayed equals: 1