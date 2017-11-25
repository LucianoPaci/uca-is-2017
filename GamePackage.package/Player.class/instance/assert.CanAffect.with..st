use of cards
assert: aPlayer CanAffect: aCard with: aCancellationCard
	(cards select: [ :each | aCancellationCard isEqualTo: each ])
		isNotEmpty
		ifTrue:
			[ self assert: aPlayer Has: aCard ToBeAffectedBy: aCancellationCard ]
		ifFalse:
			[ GameFailed signal: 'La carta no se encuentra en la mano del jugador' ]