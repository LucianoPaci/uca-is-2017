instance creation
assertFacesShouldBeGreaterThanZero: aNumberOfFaces
	aNumberOfFaces <=0
	ifTrue:[Error signal:' The dice can not be with instanciated with 0 or less faces']