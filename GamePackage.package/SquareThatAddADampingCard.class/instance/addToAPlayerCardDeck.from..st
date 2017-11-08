adding
addToAPlayerCardDeck: aPlayer from: aGame
| aCard |
aCard := aGame removeACardFromDeck: CardDamping.
aPlayer cards add: aCard.