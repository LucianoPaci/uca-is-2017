as yet unclassified
squareAtPosition: aPosition
	^ squares detect: [ :square | aPosition = square position ] ifNone: [  Error
				signal: ('No se encontro casillero para la posicion <1p>' expandMacrosWith: aPosition )  ]