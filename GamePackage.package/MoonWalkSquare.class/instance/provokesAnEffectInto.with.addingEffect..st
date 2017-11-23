affecting
provokesAnEffectInto: aGame with: aPlayer addingEffect: someEffect
|  upRoundedEffectCalculation |
upRoundedEffectCalculation := (effect * someEffect) ceiling.

aGame provokesAnEffect: upRoundedEffectCalculation intoEveryPlayerExcept: aPlayer.