use of cards
throwsPermanentCardsProducingAnEffectOnADiceRollTo: aPlayer	
	^ (aPlayer permanentCardsToBePlayed) 
		inject: 0
		into: [ :sum :each | sum + each addAnEffectOnADiceRoll ]