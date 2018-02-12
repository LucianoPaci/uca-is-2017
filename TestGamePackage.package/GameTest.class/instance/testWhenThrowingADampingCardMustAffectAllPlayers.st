cards tests
testWhenThrowingADampingCardMustAffectAllPlayers
	| squares board diceEightFaces diceSixFaces collectionOfDices collectionOfPlayers playerScorpion playerRaiden laps game cardToAffectPlayer playerScorpionDeck playerRaidenDeck gameDeck playerJuanmaDeck playerJuanma playerScorpionHistory playerRaidenHistory playerJuanmaHistory |
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
	self assert: playerScorpion permanentCardsToBePlayed size equals: 0.
	self assert: playerRaiden permanentCardsToBePlayed size equals: 0.
	self assert: playerJuanma permanentCardsToBePlayed size equals: 0.
	game affect: playerScorpion withAPermanentCard: cardToAffectPlayer of: playerRaiden.
	self assert: playerRaiden cards size equals: 1.
	self assert: playerScorpion permanentCardsToBePlayed size equals: 1.
	self assert: playerRaiden permanentCardsToBePlayed size equals: 1.
	self assert: playerJuanma permanentCardsToBePlayed size equals: 1