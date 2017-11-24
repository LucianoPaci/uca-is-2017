cards tests
testWhenACancellationCardIsThrownAPermanentCardMustBeRemovedFromAPlayer
	
	| playerScorpionHistory playerRaidenHistory squares board diceEightFaces diceSixFaces collectionOfDices collectionOfplayers cardsPlayerScorpion cardsPlayerRaiden cardsToAffectPlayer playerScorpion playerRaiden laps gameDeckCard game cancellationCard |
	playerScorpionHistory := OrderedCollection new.
	playerScorpionHistory add: (PlayerPosition at: 1 withLaps: 0).
	playerRaidenHistory := OrderedCollection new.
	playerRaidenHistory add: (PlayerPosition at: 1 withLaps: 0).
	
	squares:= (1 to: 8) collect: [:n | SquareWithoutEffect onPosition: n ].
	board := Board definedSquares: squares.
	diceEightFaces := Dice
		faces: 8
		obtainingValuesFrom: (FixedNumberSource providing: #(1 2 3 4 5 6 7 8)).
	diceSixFaces := Dice
		faces: 6
		obtainingValuesFrom: (FixedNumberSource providing: #(1 2 3 4 5 6)).
	collectionOfDices := OrderedCollection new.
	collectionOfDices
		add: diceSixFaces;
		add: diceEightFaces.
	collectionOfplayers := OrderedCollection new.
	cardsPlayerScorpion := OrderedCollection new.
	cardsPlayerRaiden := OrderedCollection new.
	cardsPlayerScorpion add: (CardDamping named: 'CardDamping1');add:(CardCancellation  named: 'CardCancellation2') .
	cardsToAffectPlayer := CardSpeed named: 'CardSpeed1'.
	cardsPlayerRaiden add: cardsToAffectPlayer;add: (CardOverloading named: 'CardOverloading1') .
	playerScorpion := Player named: 'Scorpion' withCards: cardsPlayerScorpion andPositionHistory: playerScorpionHistory.
	playerRaiden := Player named: 'Raiden' withCards: cardsPlayerRaiden andPositionHistory: playerRaidenHistory .
	laps := 1.
	collectionOfplayers add: playerScorpion.
	collectionOfplayers add: playerRaiden.
	gameDeckCard:= OrderedCollection new.
	gameDeckCard add: (CardPotentiation  named: 'CardPotentiation1');add: (CardSpeed named: 'CardSpeed2') .
	game := Game
		playedBy: collectionOfplayers on: board throwing: collectionOfDices  winningWhenCompleting: laps 	withACardDeck: gameDeckCard.
	game nextTurnFor: playerScorpion.
	self assert: playerRaiden  numberOfCardsInDeck equals:2.
	playerRaiden affectAPlayer: playerScorpion withAPermanentCard: cardsToAffectPlayer   into: game. 
	self assert: playerRaiden numberOfCardsInDeck  equals: 1.
	cancellationCard := CardCancellation named: 'CardCancellation1'.
	playerRaiden addACardToDeck: cancellationCard.
	self assert: playerRaiden numberOfCardsInDeck equals: 2.
	self assert: playerScorpion numberOfCardsInDeck equals: 2.
	self assert: playerScorpion numberOfPermanentCardsToBePlayed equals: 1.
	playerRaiden affectACard: cardsToAffectPlayer ofAPlayer: playerScorpion withACancellationCard: cancellationCard into: game.
	self assert: playerScorpion numberOfInstantCardsToBePlayed equals:1.
	self assert: playerRaiden numberOfCardsInDeck equals: 1.
	self assert: playerScorpion numberOfCardsInDeck equals: 2.
	self assert: playerScorpion numberOfPermanentCardsToBePlayed  equals:1.
	game nextTurnFor: playerRaiden.
	game nextTurnFor: playerScorpion.
	self assert: playerScorpion numberOfPermanentCardsToBePlayed equals:0.
	self assert: playerScorpion numberOfInstantCardsToBePlayed equals: 0.
