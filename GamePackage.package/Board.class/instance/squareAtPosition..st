as yet unclassified
squareAtPosition: aPosition
^squares detect: [:square | square position = aPosition ] ifNone: [ Error signal: ('No se encontro casillero para la posicion <s1>' expandMacrosWith: aPosition )]