affecting
provokesAnEffectInto: aGame with: aPlayer addingEffect: someEffect
 aPlayer changePosition: (aPlayer previousPosition * someEffect) ceiling.
 aPlayer modifyLaps: aPlayer previousLap 