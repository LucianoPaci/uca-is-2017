as yet unclassified
throwsCardsAddingAnEffectOnASquareEffect
^((permanentCardsToBePlayedAddedByAnotherPlayer)inject: 1 into: [ :product :each | product * (each addAnEffectOverASquare )]) *
	((permanentCardsToBePlayed)inject: 1 into: [ :product :each | product * (each  addAnEffectOverASquare)]).