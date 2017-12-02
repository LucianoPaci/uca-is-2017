tests
testWhenAPlayerIsCreatedWithACardDeckWithASizeNotEqualsTo2
	| playerHistory playerDeck player |
	playerHistory := OrderedCollection new.
	playerHistory add: (PlayerPosition at: 1 withLaps: 0 withNumberOfSquaresTravelled:0).
	playerDeck := OrderedCollection new.
	playerDeck
		add: (CardSpeed named: 'CardSpeed1').
	self should: [ player := Player named:  'juanMa' withCards: playerDeck andPositionHistory: playerHistory ] raise: Error.