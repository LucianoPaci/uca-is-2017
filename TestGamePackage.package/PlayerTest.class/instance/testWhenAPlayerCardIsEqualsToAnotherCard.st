tests
testWhenAPlayerCardIsEqualsToAnotherCard
	| playerScorpion card playerScorpionDeck playerScorpionHistory |
	playerScorpionDeck := OrderedCollection new.
	card := CardDamping named: 'CardDamping1'.
	playerScorpionDeck add: card.
	playerScorpionHistory := OrderedCollection new.
	playerScorpionHistory add: (PlayerPosition at: 1 withLaps: 0).
	playerScorpion := Player named: 'Scorpion' withCards: playerScorpionDeck andPositionHistory: playerScorpionHistory.
	self assert: (card isEqualTo: card) equals: true