affecting
provokesAnEffectInto: aGame with: aPlayer

(aGame players reject: [:player | player = aPlayer ])
do: [:player | aGame move: player positions: effect ]