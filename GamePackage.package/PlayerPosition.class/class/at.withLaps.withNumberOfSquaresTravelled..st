accessing
at: aSquareNumber withLaps: anAmountOfLaps withNumberOfSquaresTravelled:aNumberOfSquaresTravelled
	^ self new
 	initializePosition: aSquareNumber 
	initializeLaps: anAmountOfLaps
	initializeNumberOfSquaresTravelled: aNumberOfSquaresTravelled.