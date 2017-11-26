use of cards
throwsPermamentCardsProducingAnEffectOnADiceRoll
	^ permanentCardsToBePlayed copy
		inject: 0
		into: [ :sum :each | sum + each addAnEffectOnADiceRoll ]