as yet unclassified
provokesAnEffectInto: aGame with: aPlayer

(1 to: aGame numberOfPlayers) do: [ :index | aGame moveToBeginning: (aGame players  at: index)  ].