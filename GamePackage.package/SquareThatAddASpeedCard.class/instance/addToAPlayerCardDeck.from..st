adding
addToAPlayerCardDeck: aPlayer from: aGame
| aCard |
aCard := aGame removeACardFromDeck: CardSpeed.
aPlayer addACardToDeck: aCard.