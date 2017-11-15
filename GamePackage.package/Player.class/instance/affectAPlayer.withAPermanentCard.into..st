use of cards
affectAPlayer: aPlayer withAPermanentCard: aCard into: aGame
	| cardToBeAdded |
	(aGame wrongTurnFor: self)
	ifTrue:[PlayerNotAllowedToThrowACardError signal: 'El jugador no puede jugar cartas, ya que no es su turno']
	ifFalse:[
					 (cardToBeAdded:=((self cards) select: [ :each | self  aCard:aCard isEqualTo:  each ])) isEmpty
	
						ifTrue:[PermanentCardIsNotInPlayerDeckError signal: 'La carta no se encuentra en la mano del jugador']
						ifFalse: [aCard addToAPlayer: aPlayer fromAGame: aGame.
									self cards remove: aCard]
				]