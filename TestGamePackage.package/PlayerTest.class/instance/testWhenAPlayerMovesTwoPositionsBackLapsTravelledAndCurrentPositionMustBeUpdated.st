tests
testWhenAPlayerMovesTwoPositionsBackLapsTravelledAndCurrentPositionMustBeUpdated
	| playerPepeHistory playerPepeDeck playerPepe |
	playerPepeHistory := OrderedCollection new.
	playerPepeHistory add: (PlayerPosition at: 1 withLaps: 0 withNumberOfSquaresTravelled:0).
	playerPepeDeck := OrderedCollection new.
	playerPepeDeck add: (CardCancellation named: 'CardCancellation1');
						add: (CardSpeed named: 'CardSpeed1').
	playerPepe := Player named: 'Pepe' withCards: playerPepeDeck andPositionHistory: playerPepeHistory.
	self assert: (playerPepe getPositionAt:  1) squareNumber equals: 1.
	self assert: (playerPepe getPositionAt: 1) lap equals: 0.
	playerPepe changePosition: 3 lapsTo:0 andNumberOfSquaresTravelledTo:0.
	self assert: (playerPepe getPositionAt:2) squareNumber equals: 3.
	self assert: (playerPepe getPositionAt:2) lap equals: 0.
	playerPepe changePosition: (playerPepe getPositionAt:  1) squareNumber lapsTo: (playerPepe getPositionAt:  1) lap andNumberOfSquaresTravelledTo: (playerPepe getPositionAt: 1) numberOfSquaresTravelled.
	self assert: (playerPepe getPositionAt:3) squareNumber  equals: 1.
	self assert: (playerPepe getPositionAt:3) lap equals: 0