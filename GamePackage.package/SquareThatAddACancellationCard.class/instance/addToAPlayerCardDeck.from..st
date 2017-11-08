adding
addToAPlayerCardDeck: aPlayer from: aGame
| aCard |
aCard := aGame removeACardFromDeck: CardCancellation.
aPlayer cards add: aCard.
