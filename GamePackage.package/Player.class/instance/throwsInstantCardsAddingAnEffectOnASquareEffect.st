as yet unclassified
throwsInstantCardsAddingAnEffectOnASquareEffect
	^ instantCardsToBePlayed  inject: 1 into: [ :product :each | product * each addAnEffectOverASquare ]