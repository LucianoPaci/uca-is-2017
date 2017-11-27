use of cards
throwsPermanentCardsAddingAnEffectOnASquareEffect
	^ permanentCardsToBePlayed copy
		inject: 1
		into: [ :product :each | product * each addAnEffectOverASquare ]