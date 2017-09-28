instantiation
assertShouldNotBeEmpty: aName

aName isEmpty 	
ifTrue: [ Error signal: 'The name should not be empty' ]