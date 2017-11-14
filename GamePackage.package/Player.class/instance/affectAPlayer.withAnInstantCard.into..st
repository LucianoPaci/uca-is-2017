as yet unclassified
affectAPlayer: aPlayer withAnInstantCard: aCard into: aGame
	| cardToBeAdded |
	(cardToBeAdded := self cards select: [ :each | self aCard: aCard isEqualTo: each ]) isEmpty
		ifTrue: [ InstantCardIsNotInPlayerDeckError signal: 'La carta instantanea no se encuentra en la mano del jugador' ]
		ifFalse: [ aCard addToAPlayer: aPlayer fromAGame: aGame ]
			"aca ya tengo la carta instantanea guardada, momentaneamente, en mi mazo. No debe guardarse, pero sirve tenerla como referencia"
			aCard: cardToBeAdded isEqualTo: CardUndo
			ifTrue: [ aPlayer ]
			"copiar elemento anterior de la collection, con posicion y vueltas tal cual como está"
			self cards remove: aCard