tests
testWhenAPlayerMovesTwooPositionsBackLapsTravelledAndCurrentPositionMustBeUpdated
| player1History player1Cards player1 |
player1History := OrderedCollection new.
player1History add: (PlayerPosition at: 1 withLaps: 0).
player1Cards := OrderedCollection new.
player1Cards add:(CardCancellation named: 'CardCancellation1').
player1 := Player named: 'Pepe' withCards: player1Cards   andPositionHistory: player1History.
self assert: (player1 previousNPositions:1) equals:1.
self assert: (player1 previousNLaps: 1) equals: 0.
player1 changePosition: 3 andLapsTo: 0.
self assert: (player1 currentPosition) equals: 3.
self assert: (player1 lapsTravelled ) equals: 0.
player1 changePosition: (player1 previousNPositions: 2) andLapsTo:  (player1 previousNLaps: 2).
self assert: (player1 currentPosition) equals:1.
self assert: (player1 lapsTravelled) equals:0. 