as yet unclassified
provokesAnEffectIntoAGame: aGame with: anObject

| aPlayer aPlayerAtPosition |
aPlayer:= aGame previousTurnPlayer.

(1 to: aGame numberOfPlayers) 

do:  [ 
	
		:index | 
		
		aPlayerAtPosition:= (aGame players  at: index) .
		(aPlayer ~= aPlayerAtPosition) ifTrue: [ aGame moveToBeginning: aPlayerAtPosition] 
		
	  ]
		
					