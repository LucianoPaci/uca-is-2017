as yet unclassified
provokesAnEffectIntoAGame: aGame with: anObject
	| aPlayer |
	aPlayer := aGame previousTurnPlayer.
	(aGame previousTurnPlayer) changePosition: aPlayer previousPosition