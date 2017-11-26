removing
removeACardFromDeck: aCard
^(cardsDeck  remove: aCard  ifAbsent: (GameFailed signal: 'No se encuentran cartas disponibles en la baraja del juego')).
