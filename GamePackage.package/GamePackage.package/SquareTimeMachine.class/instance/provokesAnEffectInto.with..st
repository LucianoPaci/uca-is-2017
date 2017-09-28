as yet unclassified
provokesAnEffectInto: aGame with: anObject
	| aPlayer |
	aPlayer := aGame previousTurnPlayer.
	(aGame previousTurnPlayer) changePosition: aPlayer previousPosition