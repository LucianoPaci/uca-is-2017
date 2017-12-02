instantiation
assertShouldNotBeEmpty: aName
aName isEmpty 	
ifTrue: [ Error signal: 'El nombre del jugador no puede estar vacio' ]