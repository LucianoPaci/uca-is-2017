tests
testWhenPlayingAGameInOrder
	| squares board diceEightFaces diceSixFaces collectionOfDices collectionOfplayers playerScorpion playerJuanMa laps game playerRaiden  |
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
	playerScorpion := Player named: 'Scorpion'.
	playerRaiden := Player named: 'Raiden'.
	playerJuanMa := Player named: 'JuanMa'.
	laps := 1.
	collectionOfplayers add: playerScorpion.
	collectionOfplayers add: playerRaiden.
	collectionOfplayers add: playerJuanMa.
	game := Game
		definedPlayers: collectionOfplayers
		definedBoard: board
		definedDices: collectionOfDices
		definedAmountOfLaps: laps.
	self assert: game expectedPlayer equals: playerScorpion.
	game nextTurnFor: playerScorpion.
	self assert: game expectedPlayer equals: playerRaiden.
	game nextTurnFor: playerRaiden.
	self assert: game expectedPlayer equals: playerJuanMa.
	game nextTurnFor: playerJuanMa.
	self assert: game expectedPlayer equals: playerScorpion .
	game nextTurnFor: playerScorpion.
	self assert: game expectedPlayer equals: playerRaiden