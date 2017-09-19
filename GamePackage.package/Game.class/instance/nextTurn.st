behavior
nextTurn
	| currentPlayer amountOfMoves |
	currentPlayer := player at: indexOfPlayer.
	amountOfMoves := 0.
	
	1 to: dice size do: [ :index | amountOfMoves := amountOfMoves + (dice at: index) diceValue ].
	
	self moveForward: currentPlayer positions: amountOfMoves intoABoard: board.
	
	indexOfPlayer - self playedBy == 0
		ifTrue: [ indexOfPlayer := 1 ]
		ifFalse: [ indexOfPlayer := indexOfPlayer + 1 ].
	self winner: currentPlayer