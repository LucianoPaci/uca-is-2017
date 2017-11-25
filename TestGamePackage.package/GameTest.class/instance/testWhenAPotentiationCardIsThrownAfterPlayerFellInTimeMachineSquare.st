cards tests
testWhenAPotentiationCardIsThrownAfterPlayerFellInTimeMachineSquare
     | player1History player2History squares board diceOneFace collectionOfDices collectionOfplayers cardsPlayer1 cardsToAffectPlayer player1 cardsPlayer2 player2 laps gameDeckCard game |
player1History := OrderedCollection new.
    player1History add: (PlayerPosition at: 1 withLaps: 0).
	 player2History := OrderedCollection new.
	 player2History add: (PlayerPosition at: 1 withLaps:0).
    squares:= (1 to: 16) collect: [:n | SquareWithoutEffect onPosition: n ].
    board := Board definedSquares: squares.
    squares at: 4 put: (SquareTimeMachine  onPosition: 4).
    diceOneFace := Dice faces: 1 obtainingValuesFrom: (FixedNumberSource providing: #(1 1 1 1 1 1)).
    collectionOfDices := OrderedCollection new.
    collectionOfDices add: diceOneFace.
    collectionOfplayers := OrderedCollection new.
    cardsPlayer1 := OrderedCollection new.
    cardsToAffectPlayer := CardPotentiation  named: 'CardPotentiation1'.
    cardsPlayer1 add: cardsToAffectPlayer;add: (CardOverloading named: 'CardOverloading1').
    player1 := Player named: 'Player1' withCards: cardsPlayer1 andPositionHistory: player1History.
  	 cardsPlayer2 := OrderedCollection new.
	 cardsPlayer2 add: (CardSpeed named: 'CardSpeed1').  
	 player2 := Player named: 'player2' withCards: cardsPlayer2   andPositionHistory: player2History. 
	 laps := 1.
    collectionOfplayers add: player1;add: player2.
    gameDeckCard:= OrderedCollection new.
    gameDeckCard add: (CardOverloading named: 'CardOverloading2');add: (CardSpeed named: 'CardSpeed2') .
    game := Game
        playedBy: collectionOfplayers on: board throwing: collectionOfDices  winningWhenCompleting: laps     withACardDeck: gameDeckCard.
    self assert: player1 numberOfCardsInDeck equals:2.
    self assert: player1 numberOfCardsInDeck equals:2.
    self assert: player2 currentPosition equals:1.
	 self assert: player1 currentPosition equals:1.
    game nextTurnFor: player1.
	 self assert: player2 currentPosition equals:1.
    self assert: player1 currentPosition equals:2.
	 game nextTurnFor: player2.
	 self assert: player1 currentPosition equals:2.
	 self assert: player2 currentPosition equals:2.
	 game nextTurnFor: player1.
	 self assert: player1 currentPosition equals:3.
	 self assert: player2 currentPosition equals:2.
	 game nextTurnFor: player2.
	 self assert: player2 currentPosition equals:3.
	 self assert: player1 currentPosition equals:3.
	 player1 affectAPlayer: player1 withAnInstantCard: cardsToAffectPlayer into: game.
	 game nextTurnFor: player1.
	 self assert: player1 currentPosition equals:3.
	 self assert: player1 numberOfInstantCardsToBePlayed equals:0.
	
	
	
	 