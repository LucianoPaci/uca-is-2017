playing
testSuccessfulGameCreationWithSeveralDicesAndPlayers
	| playerScorpion playerRaiden board diceSixFaces diceNineFaces game laps collectionOfPlayers dices squareAtomicBomb squareWormHole squares playerScorpionHistory playerRaidenHistory |
	playerScorpionHistory := OrderedCollection new.
	playerScorpionHistory add: (PlayerPosition at: 1 withLaps: 0).
	playerRaidenHistory := OrderedCollection new.
	playerRaidenHistory add: (PlayerPosition at: 1 withLaps: 0).
	playerScorpion := Player named: 'Scorpion' withCards: self aCollectionOfGameCards removeFirst andPositionHistory: playerScorpionHistory.
	playerRaiden := Player named: 'Raiden' withCards: (self aCollectionOfGameCards removeAt: 2) andPositionHistory: playerRaidenHistory.
	squareAtomicBomb := AtomicBombSquare initialize.
	squareWormHole := SquareWormHole initialize.
	squares := OrderedCollection new.
	squares add: squareWormHole.
	squares add: squareAtomicBomb.
	board := Board definedSquares: squares.
	diceSixFaces := Dice faces: 6.
	diceNineFaces := Dice faces: 9.
	laps := 1.
	collectionOfPlayers := OrderedCollection new.
	collectionOfPlayers add: playerScorpion.
	dices := OrderedCollection new.
	collectionOfPlayers add: playerRaiden.
	dices
		add: diceSixFaces;
		add: diceNineFaces.
	game := Game
		playedBy: collectionOfPlayers
		on: board
		throwing: dices
		winningWhenCompleting: laps
		withACardDeck: self aCollectionOfGameCards.
	self
		assert: game players size equals: 2;
		assert: game dices size equals: 2;
		assert: game board squares size equals: 2;
		assert: game board equals: board;
		assert: game laps equals: laps