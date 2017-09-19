behavior
valueMustBeInGivenRange: aValue
	(aValue > amountOfFaces or:aValue <=0)
	ifTrue: [ Error signal: 'Value not valid' ]