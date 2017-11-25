removing
removeACardFromDeck: aCard

((cardsDeck  select: [:each | each = aCard ]) isEmpty )

ifTrue:  [GameFailed signal: 'No se encuentran cartas disponibles en la baraja del juego']
ifFalse: [^( (cardsDeck  select: [:each | each = aCard ]) removeFirst )] 