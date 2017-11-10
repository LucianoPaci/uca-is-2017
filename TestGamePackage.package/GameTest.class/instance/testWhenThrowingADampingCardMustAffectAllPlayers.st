tests
testWhenThrowingADampingCardMustAffectAllPlayers
| squares board diceEightFaces diceSixFaces collectionOfDices collectionOfplayers playerScorpion playerRaiden  laps game cardsToAffectPlayer cardsPlayerScorpion cardsPlayerRaiden gameDeckCard cardsPlayerJuanMa playerJuanMa |
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
	cardsPlayerJuanMa  := OrderedCollection new.
	cardsToAffectPlayer := CardDamping  named: 'CardDamping2'.
	cardsPlayerRaiden add: cardsToAffectPlayer;add: (CardOverloading named: 'CardOverloading1') .
	cardsPlayerScorpion add: (CardDamping named: 'CardDamping1');add:(CardUndo named: 'CardUndo1') .
	cardsPlayerJuanMa add:(CardUndo named: 'CardUndo2'); add:(CardUndo named: 'CardUndo3').
	playerScorpion := Player named: 'Scorpion' withCards: cardsPlayerScorpion.
	playerRaiden := Player named: 'Raiden' withCards: cardsPlayerRaiden.
	playerJuanMa := Player named: 'JuanMa' withCards: cardsPlayerJuanMa.
	laps := 1.
	collectionOfplayers add: playerScorpion.
	collectionOfplayers add: playerRaiden.
	collectionOfplayers add: playerJuanMa.
	gameDeckCard:= OrderedCollection new.
	gameDeckCard add: (CardUndo named: 'CardUndo5');add: (CardSpeed named: 'CardSpeed2') .
	game := Game
		playedBy: collectionOfplayers on: board throwing: collectionOfDices  winningWhenCompleting: laps 	withACardDeck: gameDeckCard.
	game nextTurnFor: playerScorpion.
	self assert: playerScorpion permanentCardsToBePlayed size equals:0.
	self assert: playerRaiden permanentCardsToBePlayed size equals:0.
	self assert: playerJuanMa permanentCardsToBePlayed size equals:0.
	playerRaiden affectAPlayer: playerScorpion withACard: cardsToAffectPlayer   into: game. 
	self assert: playerRaiden cards size equals: 1.
	self assert: playerScorpion permanentCardsToBePlayed size equals: 1.
	self assert: playerRaiden permanentCardsToBePlayed size equals: 1.
	self assert: playerJuanMa permanentCardsToBePlayed size equals: 1.
