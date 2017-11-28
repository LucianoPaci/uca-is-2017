as yet unclassified
throwsPermanentCardsAddingAnEffectOnASquareEffectTo: aPlayer
	^ ( aPlayer permanentCardsToBePlayed) 
		inject: 1
		into: [ :product :each | product * each addAnEffectOverASquare ]