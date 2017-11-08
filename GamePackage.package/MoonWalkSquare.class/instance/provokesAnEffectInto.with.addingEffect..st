affecting
provokesAnEffectInto: aGame with: aPlayer addingEffect: someEffect

(aGame players reject: [:player | player = aPlayer ])
do: [:player | aGame move: player positions: (effect * someEffect) ceiling]