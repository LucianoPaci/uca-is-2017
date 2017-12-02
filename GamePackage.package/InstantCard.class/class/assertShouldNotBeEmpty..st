asserting
assertShouldNotBeEmpty: aName
aName isEmpty 	
ifTrue: [ Error signal: 'El nombre de la carta no puede estar vacio' ]