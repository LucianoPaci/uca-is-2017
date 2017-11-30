accessing
getPositionAt: anInteger
	^ (positions) at: anInteger ifAbsent: [GameFailed signal: 'La posicion no existe'].