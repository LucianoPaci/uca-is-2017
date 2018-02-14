tests
testWhenCancellationCardIsThrownAtPermanentCardWithSeveralProtectionCardsThenOneProtectecionCardMustBeRemoved
	| playerScorpionHistory playerRaidenHistory squares board diceEightFaces diceSixFaces collectionOfDices collectionOfPlayers playerScorpionDeck playerRaidenDeck cardToAffectPlayer playerScorpion playerRaiden laps gameDeck game cancellationCard protectionCards|
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
	protectionCards add: (CardProtection  named: 'CardProtection1');
	add: (CardProtection  named: 'CardProtection2');
	add: (CardProtection  named: 'CardProtection3').
	
	playerScorpionDeck
		add: (CardDamping named: 'CardDamping1');
		add: (CardDamping named: 'CardDamping2').
	cardToAffectPlayer := (CardSpeed named: 'CardSpeed2').
	playerRaidenDeck
		add: cardToAffectPlayer;
		add: (CardOverloading named: 'CardOverloading1 ').
	playerScorpion := Player named: 'Scorpion' withCards: playerScorpionDeck andPositionHistory: playerScorpionHistory.
	
	playerScorpion addProtectionCards: protectionCards  toAPermanentCard: (playerScorpion cards first) .
	
	playerRaiden := Player named: 'Raiden' withCards: playerRaidenDeck andPositionHistory: playerRaidenHistory.
	
	laps := 1.
	collectionOfPlayers add: playerScorpion.
	collectionOfPlayers add: playerRaiden.
	gameDeck := OrderedCollection new.
	
	gameDeck
		add: (CardPotentiation named: 'CardPotentiation1');
		add: (CardPotentiation named: 'CardPotentiation2').
	game := Game
		playedBy: collectionOfPlayers
		on: board
		throwing: collectionOfDices
		winningWhenCompleting: laps
		withACardDeck: gameDeck.
		
	game nextTurnFor: playerScorpion.
	game nextTurnFor: playerRaiden.
	game affect: playerScorpion withAPermanentCard: (playerScorpion cards first) of: playerScorpion.
	cancellationCard := CardCancellation named: 'CardCancellation1'.
	playerRaiden addACardToDeck: cancellationCard.
	self assert: playerRaiden cards size equals: 3.
	self assert: playerScorpion permanentCardsToBePlayed size equals: 1.
	self assert: playerScorpion permanentCardsToBePlayed first protectionCards size equals: 3.
	game
		affect: playerScorpion permanentCardsToBePlayed first
		from: playerScorpion
		using: cancellationCard
		of: playerRaiden.
	self assert: playerScorpion permanentCardsToBePlayed first protectionCards size equals: 2.
	self assert: playerScorpion instantCardsToBePlayed size equals: 0.
	self assert: playerScorpion cards size equals: 1.
	self assert: playerScorpion permanentCardsToBePlayed size equals: 1.
	game nextTurnFor: playerScorpion.
	self assert: playerScorpion permanentCardsToBePlayed size equals: 1.
	self assert: playerScorpion instantCardsToBePlayed size equals: 0