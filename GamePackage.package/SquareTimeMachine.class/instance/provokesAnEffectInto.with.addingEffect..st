affecting
provokesAnEffectInto: aGame with: aPlayer addingEffect: someEffect
 aPlayer changePosition: (aPlayer previousPosition * someEffect) ceiling andLapsTo: aPlayer previousLap.
