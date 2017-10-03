as yet unclassified
squareAtPosition: aPosition
	^ squares
		at: aPosition
		ifAbsent: [ Error
				signal: ('No se encontro casillero para la posicion <1p>' expandMacrosWith: aPosition ) ]