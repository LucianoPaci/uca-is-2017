use of cards
assert: aPlayer CanAffect: aCard with: aCancellationCard
	(cards) indexOf: aCancellationCard ifAbsent: [GameFailed signal: 'La carta no se encuentra en la mano del jugador'].
	self assert: aPlayer Has: aCard ToBeAffectedBy: aCancellationCard.
		
			 