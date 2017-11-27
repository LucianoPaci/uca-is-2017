tests
testWhenACancellationCardIsThrownAPermanentCardMustBeRemovedFromAPlayer
	| playerScorpionHistory playerRaidenHistory squares board diceEightFaces diceSixFaces collectionOfDices collectionOfPlayers playerScorpionDeck playerRaidenDeck cardToAffectPlayer playerScorpion playerRaiden laps gameDeck game cancellationCard |
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
		add: (CardCancellation named: 'CardCancellation2').
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
		add: (CardPotentiation named: 'CardPotentiation1');
		add: (CardSpeed named: 'CardSpeed2').
	game := Game
		playedBy: collectionOfPlayers
		on: board
		throwing: collectionOfDices
		winningWhenCompleting: laps
		withACardDeck: gameDeck.
	game nextTurnFor: playerScorpion.
	self assert: playerRaiden numberOfCardsInDeck equals: 2.
	playerRaiden affect: playerScorpion withAPermanentCard: cardToAffectPlayer into: game.
	self assert: playerRaiden numberOfCardsInDeck equals: 1.
	cancellationCard := CardCancellation named: 'CardCancellation1'.
	playerRaiden addACardToDeck: cancellationCard.
	self assert: playerRaiden numberOfCardsInDeck equals: 2.
	self assert: playerScorpion numberOfCardsInDeck equals: 2.
	self assert: playerScorpion numberOfPermanentCardsToBePlayed equals: 1.
	playerRaiden
		affect: cardToAffectPlayer
		from: playerScorpion
		using: cancellationCard
		into: game.
	self assert: playerScorpion numberOfInstantCardsToBePlayed equals: 1.
	self assert: playerRaiden numberOfCardsInDeck equals: 1.
	self assert: playerScorpion numberOfCardsInDeck equals: 2.
	self assert: playerScorpion numberOfPermanentCardsToBePlayed equals: 1.
	game nextTurnFor: playerRaiden.
	game nextTurnFor: playerScorpion.
	self assert: playerScorpion numberOfPermanentCardsToBePlayed equals: 0.
	self assert: playerScorpion numberOfInstantCardsToBePlayed equals: 0