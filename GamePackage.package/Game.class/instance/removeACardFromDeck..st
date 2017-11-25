removing
removeACardFromDeck: aCard
^(cardsDeck  remove: [:each | each isEqualTo:  aCard ] ifAbsent: (GameFailed signal: 'No se encuentran cartas disponibles en la baraja del juego') )
