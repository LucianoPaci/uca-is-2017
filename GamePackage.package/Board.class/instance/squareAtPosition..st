accessing
squareAtPosition: aPosition
	| indexOfPlayerCollection |
	indexOfPlayerCollection := aPosition.
	^ squares copy
		detect: [ :square | indexOfPlayerCollection = square position ]
		ifNone: [ Error
				signal: ('No se encontro casillero para la posicion <1p>' expandMacrosWith: aPosition) ]