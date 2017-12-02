tests
testWhenAPlayerIsCreatedWithAnEmptyName
	| playerHistory playerDeck player |
	playerHistory := OrderedCollection new.
	playerHistory add: (PlayerPosition at: 1 withLaps: 0 withNumberOfSquaresTravelled:0).
	playerDeck := OrderedCollection new.
	playerDeck
		add: (CardSpeed named: 'CardSpeed1');
		add: (CardOverloading named: 'CardOverloading1').
	self should: [ player := Player named:  '' withCards: playerDeck andPositionHistory: playerHistory ] raise: Error.
