playing
testSuccessfulGameCreationWithSeveralDicesAndPlayers
	| player1 player2 board dice1 dice2 game laps players dices squareAtomicBomb squareWornHole squares  player1History  player2History |
	player1History := OrderedCollection new.
	player1History add: (PlayerPosition at: 1 withLaps: 0).
	player2History := OrderedCollection new.
	player2History add: (PlayerPosition at: 1 withLaps: 0).
	player1 := Player named: 'Scorpion' withCards: (self aCollectionOfGameCards )removeFirst andPositionHistory: player1History.  
	player2 := Player named: 'Raiden' withCards: (self aCollectionOfGameCards )removeFirst andPositionHistory: player2History.
	squareAtomicBomb := AtomicBombSquare initialize.
	squareWornHole := SquareWormHole initialize.
	squares := OrderedCollection new.
	squares add: squareWornHole.
	squares add: squareAtomicBomb.
	board := Board definedSquares: squares.
	dice1 := Dice faces: 6.
	dice2 := Dice faces: 9.
	laps := 1.
	players := OrderedCollection new.
	players add: player1.
	dices := OrderedCollection new.
	players add: player2.
	dices
		add: dice1;
		add: dice2.
	game := Game
		playedBy: players
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