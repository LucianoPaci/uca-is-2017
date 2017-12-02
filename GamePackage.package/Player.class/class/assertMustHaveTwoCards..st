asserting
assertMustHaveTwoCards: aCollectionOfCards
aCollectionOfCards size ~=2	
ifTrue: [ Error signal: 'El mazo del jugador debe tener 2 cartas' ]