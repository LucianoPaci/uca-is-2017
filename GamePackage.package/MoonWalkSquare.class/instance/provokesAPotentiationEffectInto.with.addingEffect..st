affecting
provokesAPotentiationEffectInto:  aGame with: aPlayer addingEffect: permanentCardEffects
(aGame players reject: [:player | player = aPlayer ])
do: [:player | aGame move: player positions: (effect * permanentCardEffects) ceiling]