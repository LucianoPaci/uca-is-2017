squares tests
testWhenAPlayerFallsInASquareThatAddACancellationCardANewCardOfThatKindMustBeAddedToThisPlayerCardDeck
| player game dice board squares  collectionOfPlayerCards playerHistory |
	playerHistory := OrderedCollection new.
	playerHistory add: (PlayerPosition at: 1 withLaps: 0).
	collectionOfPlayerCards:= OrderedCollection new.
	collectionOfPlayerCards add: (self aCollectionOfGameCards )removeFirst ; add: (self aCollectionOfGameCards )removeFirst.
	player := Player named: 'Johny Maidana' withCards: collectionOfPlayerCards andPositionHistory: playerHistory. 
	squares := (1 to: 3) collect: [ :n | SquareWithoutEffect onPosition: n ].
	squares at: 1 put: (SquareThatAddACancellationCard  onPosition: 1).
	squares at: 3 put: (SquareThatAddACancellationCard  onPosition: 3).
	board := Board definedSquares: squares.
	dice := Dice faces: 6 obtainingValuesFrom: (FixedNumberSource providing: #(1 2 3 4 5 6)).
	game := Game
		playedBy: (OrderedCollection with: player)
		on: board
		throwing: (OrderedCollection with: dice)
		winningWhenCompleting: 1
		withACardDeck: self aCollectionOfGameCards.
		
	self assert: player cards size equals:2.
	game nextTurnFor: player.
	self assert: player cards size equals:2.
	game nextTurnFor: player.
	self assert: player cards size equals:3.
	game nextTurnFor: player.
	self assert: player cards size equals:4.