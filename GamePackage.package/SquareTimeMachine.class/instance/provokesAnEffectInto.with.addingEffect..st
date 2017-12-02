affecting
provokesAnEffectInto: aGame with: aPlayer addingEffect: someEffect
aPlayer changePosition: ((aPlayer getPositionAt: (aPlayer positions size -1)) squareNumber * someEffect) lapsTo: (aPlayer getPositionAt: (aPlayer positions size -1)) lap
andNumberOfSquaresTravelledTo: (aPlayer getPositionAt: (aPlayer positions size -1)) numberOfSquaresTravelled.



