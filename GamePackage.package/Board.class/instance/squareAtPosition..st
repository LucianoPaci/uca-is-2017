accessing
squareAtPosition: aPosition
	^ squares at: aPosition ifAbsent: [ GameFailed signal:'El casillero no se encuentra']