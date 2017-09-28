as yet unclassified
provokesAnEffectIntoAGame: aGame with: anObject

(1 to: aGame numberOfPlayers) do: [ :index | aGame moveToBeginning: (aGame players  at: index)  ].