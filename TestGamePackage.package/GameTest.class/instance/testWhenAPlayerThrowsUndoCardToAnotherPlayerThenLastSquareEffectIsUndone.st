cards tests
testWhenAPlayerThrowsUndoCardToAnotherPlayerThenLastSquareEffectIsUndone
"Ejemplo 1"
	| squares board diceSixFaces collectionOfDices collectionOfplayers playerScorpion playerRaiden laps game cardsPlayerScorpion cardsPlayerRaiden gameDeckCard cardsToAffectPlayer playerScorpionHistory playerRaidenHistory |
	playerScorpionHistory := OrderedCollection new.
	playerScorpionHistory add: (PlayerPosition at: 1 withLaps: 0).
	playerRaidenHistory := OrderedCollection new.
	playerRaidenHistory add: (PlayerPosition at: 1 withLaps: 0).
	squares := (1 to: 8) collect: [ :n | SquareWithoutEffect onPosition: n ].
	squares at: 3 put: (SquareSpeedUp onPosition: 3).
	board := Board definedSquares: squares.
	diceSixFaces := Dice faces: 6 obtainingValuesFrom: (FixedNumberSource providing: #(1 2 3 4 5 6)).
	collectionOfDices := OrderedCollection new.
	collectionOfDices add: diceSixFaces.
	collectionOfplayers := OrderedCollection new.
	cardsPlayerScorpion := OrderedCollection new.
	cardsPlayerRaiden := OrderedCollection new.
	cardsToAffectPlayer := CardUndo named: 'CardUndo1'.
	cardsPlayerScorpion
		add: cardsToAffectPlayer;
		add: (CardUndo named: 'CardUndo2');
		add: (CardDamping named: 'CardDamping1').
	cardsPlayerRaiden
		add: (CardPotentiation named: 'CardPotentiation1');
		add: (CardPotentiation named: 'CardPotentiation2').
	playerScorpion := Player named: 'Scorpion' withCards: cardsPlayerScorpion andPositionHistory: playerScorpionHistory.
	playerRaiden := Player named: 'Raiden' withCards: cardsPlayerRaiden andPositionHistory: playerRaidenHistory.
	laps := 1.
	collectionOfplayers add: playerScorpion.
	collectionOfplayers add: playerRaiden.
	gameDeckCard := OrderedCollection new.
	gameDeckCard
		add: (CardUndo named: 'CardUndo2');
		add: (CardSpeed named: 'CardSpeed1').
	game := Game
		playedBy: collectionOfplayers
		on: board
		throwing: collectionOfDices
		winningWhenCompleting: laps
		withACardDeck: gameDeckCard.
	self assert: playerScorpion currentPosition equals: 1.
	game nextTurnFor: playerScorpion.
	self assert: playerScorpion currentPosition equals: 2.
	game nextTurnFor: playerRaiden.
	self assert: playerRaiden currentPosition equals: 7.
	playerScorpion affectAPlayer: playerRaiden withAnInstantCard: cardsToAffectPlayer into: game.
	"self assert: playerScorpion instantCardsToBePlayed size equals: 2."
	self assert: playerRaiden currentPosition equals: 2