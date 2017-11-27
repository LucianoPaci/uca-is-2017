use of cards
throwsPermamentCardsProducingAnEffectOnADiceRoll
	^ permanentCardsToBePlayed 
		inject: 0
		into: [ :sum :each | sum + each addAnEffectOnADiceRoll ]