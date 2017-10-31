tests
testSuccessfulGameCreationWithSeveralDicesAndPlayers
	| player1 player2 board dice1 dice2 game laps players dices squareAtomicBomb squareWornHole squares |
	player1 := Player named: 'Scorpion' withACardDeck: self aCollectionOfCards.
	player2 := Player named: 'Raiden' withACardDeck: self aCollectionOfCards.
	squareAtomicBomb:= AtomicBombSquare initialize.
	squareWornHole:= SquareWormHole initialize.
	squares:= OrderedCollection new.
	squares add: squareWornHole.
	squares add: squareAtomicBomb.
	board:= Board definedSquares: squares.
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
		winningWhenCompleting: laps.
	self
		assert: game players size  equals: 2;
		assert: game dices size  equals: 2;
		assert: game board squares size equals: 2;
		assert: game board equals: board;
		assert: game laps equals: laps