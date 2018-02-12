tests
testWhenAProtectionCardIsProtectingAPermanentCardThenPermanentCardIsNotRemoved
	| playerScorpionHistory playerRaidenHistory squares board diceEightFaces diceSixFaces collectionOfDices collectionOfPlayers playerScorpionDeck playerRaidenDeck cardToAffectPlayer playerScorpion playerRaiden laps gameDeck game  protectionCard protectionCards |
	playerScorpionHistory := OrderedCollection new.
	playerScorpionHistory add: (PlayerPosition at: 1 withLaps: 0 withNumberOfSquaresTravelled: 0).
	playerRaidenHistory := OrderedCollection new.
	playerRaidenHistory add: (PlayerPosition at: 1 withLaps: 0 withNumberOfSquaresTravelled: 0).
	squares := (1 to: 8) collect: [ :n | SquareWithoutEffect initialized ].
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
	protectionCards := OrderedCollection new.
	protectionCard := CardProtection named: 'CardProtection1'.
	protectionCards add: protectionCard.
	playerScorpionDeck
		add: (CardDamping named: 'CardDamping1');
		add: (CardSpeed named: 'CardSpeed1' protectedBy: protectionCards).
	cardToAffectPlayer := CardCancellation named: 'CardCancellation1'.
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
		add: (CardPotentiation named: 'CardPotentiation1');
		add: (CardSpeed named: 'CardSpeed2').
	game := Game
		playedBy: collectionOfPlayers
		on: board
		throwing: collectionOfDices
		winningWhenCompleting: laps
		withACardDeck: gameDeck.
	game nextTurnFor: playerScorpion.
	self assert: playerRaiden cards size equals: 2.
	game affect: playerScorpion withAnInstantCard: cardToAffectPlayer of: playerRaiden.
	self assert: playerRaiden cards size equals: 1.
	self assert: playerScorpion cards size equals: 2