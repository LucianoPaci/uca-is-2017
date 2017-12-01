use of cards
throwsPermamentCardsProducingAnEffectOnADiceRollTo: aPlayer	
	^ (aPlayer permanentCardsToBePlayed) 
		inject: 0
		into: [ :sum :each | sum + each addAnEffectOnADiceRoll ]