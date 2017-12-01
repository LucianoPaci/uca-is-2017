removing
removeACardFromDeck: aCard
cardsDeck  indexOf: aCard ifAbsent: [GameFailed signal: 'No se encuentran cartas disponibles en la baraja del juego'].
cardsDeck remove: aCard.
