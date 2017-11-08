as yet unclassified
throwsCardsProducingAnEffectOnADiceRoll
^((permanentCardsToBePlayedAddedByAnotherPlayer)inject: 0 into: [ :sum :each | sum + (each addAnEffectOnADiceRoll )]) +
	((permanentCardsToBePlayed)inject: 0 into: [ :sum :each | sum + (each addAnEffectOnADiceRoll  )]).