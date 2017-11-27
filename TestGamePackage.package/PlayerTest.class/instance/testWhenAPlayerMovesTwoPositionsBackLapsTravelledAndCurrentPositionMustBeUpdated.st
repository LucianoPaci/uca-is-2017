tests
testWhenAPlayerMovesTwoPositionsBackLapsTravelledAndCurrentPositionMustBeUpdated
	| playerPepeHistory playerPepeDeck playerPepe |
	playerPepeHistory := OrderedCollection new.
	playerPepeHistory add: (PlayerPosition at: 1 withLaps: 0).
	playerPepeDeck := OrderedCollection new.
	playerPepeDeck add: (CardCancellation named: 'CardCancellation1').
	playerPepe := Player named: 'Pepe' withCards: playerPepeDeck andPositionHistory: playerPepeHistory.
	self assert: (playerPepe previousNPositions: 1) squareNumber equals: 1.
	self assert: (playerPepe previousNPositions: 1) lap equals: 0.
	playerPepe changePosition: 3 andLapsTo: 0.
	self assert: playerPepe currentPosition equals: 3.
	self assert: playerPepe lapsTravelled equals: 0.
	playerPepe changePosition: (playerPepe previousNPositions: 2) squareNumber andLapsTo: (playerPepe previousNPositions: 2) lap.
	self assert: playerPepe currentPosition equals: 1.
	self assert: playerPepe lapsTravelled equals: 0