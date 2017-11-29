affecting
provokesAnEffectInto: aGame with: aPlayer addingEffect: someEffect
aPlayer changePosition: ((aPlayer getPositionAt: (aPlayer positions size -1)) squareNumber * someEffect) andLapsTo: (aPlayer getPositionAt: (aPlayer positions size -1)) lap.



