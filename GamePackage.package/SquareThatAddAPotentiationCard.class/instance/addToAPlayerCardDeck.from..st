adding
addToAPlayerCardDeck: aPlayer from: aGame
| aCard |
aCard := aGame removeACardFromDeck: CardPotentiation.
aPlayer addACardToDeck: aCard.