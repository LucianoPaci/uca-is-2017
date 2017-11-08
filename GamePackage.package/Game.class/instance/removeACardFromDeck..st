removing
removeACardFromDeck: aKindOfCard

((cardsDeck  select: [:each | each isMemberOf: aKindOfCard ]) isEmpty )

ifTrue:  [NoCardForAKindOfInGameCardError signal: 'No se encuentran cartas disponibles en la baraja del juego']
ifFalse: [^( (cardsDeck  select: [:each | each isMemberOf: aKindOfCard ]) removeFirst )] 