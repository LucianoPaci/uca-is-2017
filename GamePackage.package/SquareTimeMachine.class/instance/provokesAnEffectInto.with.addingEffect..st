affecting
provokesAnEffectInto: aGame with: aPlayer addingEffect: someEffect
 aPlayer changePosition: ((aPlayer previousNPositions:1) * someEffect) ceiling andLapsTo: (aPlayer previousNLaps:1).
