use of cards
affectAPlayer: aPlayer withAPermanentCard: aCard into: aGame
	| cardToBeAdded |
	(aGame wrongTurnFor: self)
	ifTrue:[GameFailed signal: 'El jugador no puede jugar cartas, ya que no es su turno']
	ifFalse:[
					 (cardToBeAdded:=((cards) select: [ :each | self  aCard:aCard isEqualTo:  each ])) isEmpty
	
						ifTrue:[GameFailed signal: 'La carta no se encuentra en la mano del jugador']
						ifFalse: [aCard addToAPlayer: aPlayer fromAGame: aGame.
									cards remove: aCard]
				]