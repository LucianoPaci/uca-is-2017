affecting
provokesAnEffectInto: aGame with: aPlayer

|aPlayerAtPosition |

(1 to: aGame numberOfPlayers) 

do:  [ :index | aPlayerAtPosition:= (aGame players  at: index).
	(aPlayer~=aPlayerAtPosition ) ifTrue:[ aGame move: aPlayerAtPosition positions:self effect.	]
	  ]
		
					