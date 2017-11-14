cards tests
testWhenPlayerAffectsWithACardAnotherPlayerNotOnHisTurnAnErrorMessageIsThrown
| squares board diceEightFaces diceSixFaces collectionOfDices collectionOfplayers playerScorpion playerRaiden playerJuanMa laps game cardsToAffectPlayer cardsPlayerScorpion cardsPlayerRaiden cardsPlayerJuanMa playerScorpionHistory playerRaidenHistory playerJuanMaHistory |

	playerScorpionHistory := OrderedCollection new.
	playerScorpionHistory add: (PlayerPosition at: 1 withLaps: 0).
	playerRaidenHistory := OrderedCollection new.
	playerRaidenHistory add: (PlayerPosition at: 1 withLaps: 0).
	playerJuanMaHistory := OrderedCollection new.
	playerJuanMaHistory add: (PlayerPosition at: 1 withLaps: 0).
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
	cardsPlayerJuanMa := OrderedCollection new.
	cardsPlayerScorpion add: self aCollectionOfGameCards removeFirst;add: self aCollectionOfGameCards removeFirst.
	cardsPlayerRaiden add: self aCollectionOfGameCards removeFirst;add: self aCollectionOfGameCards removeFirst.
	cardsPlayerJuanMa add: self aCollectionOfGameCards removeFirst;add: self aCollectionOfGameCards removeFirst.
	playerScorpion := Player named: 'Scorpion' withCards: cardsPlayerScorpion andPositionHistory: playerScorpionHistory.
	playerRaiden := Player named: 'Raiden' withCards: cardsPlayerRaiden andPositionHistory: playerRaidenHistory.
	playerJuanMa := Player named: 'JuanMa' withCards: cardsPlayerJuanMa andPositionHistory: playerJuanMaHistory .
	laps := 1.
	collectionOfplayers add: playerScorpion.
	collectionOfplayers add: playerRaiden.
	collectionOfplayers add: playerJuanMa.
	game := Game
		playedBy: collectionOfplayers on: board throwing: collectionOfDices  winningWhenCompleting: laps 	withACardDeck: self aCollectionOfGameCards.
	game nextTurnFor: playerScorpion.
	cardsToAffectPlayer := playerScorpion cards removeFirst.
	self should: [playerScorpion affectAPlayer: playerRaiden withAPermanentCard: cardsToAffectPlayer into: game] raise: PlayerNotAllowedToThrowACardError.
	 
	
