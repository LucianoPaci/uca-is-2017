as yet unclassified
throwsInstantCardsProducingAnEffectOnADiceRoll
	^ instantCardsToBePlayed  inject: 0 into: [ :sum :each | sum + each addAnEffectOnADiceRoll ]