addingEffect
add: aCard to: aPlayer andRemoveFrom: anotherPlayer
	aCard addToAPlayer: aPlayer fromAGame: self.
	^ anotherPlayer removeACardFromDeck: aCard