affecting
provokesAnEffectInto: aGame with: aPlayer addingEffect: someEffect
 aPlayer changePosition: ((aPlayer previousNPositions:1) squareNumber * someEffect) ceiling andLapsTo: (aPlayer previousNPositions:1) lap.
