use of cards
affect: aCard from: aPlayer using: aCancellationCard into: aGame
	(cards) indexOf: aCancellationCard ifAbsent: [GameFailed signal: 'La carta no se encuentra en la mano del jugador'].
	self assert: aPlayer has: aCard toBeAffectedBy: aCancellationCard.