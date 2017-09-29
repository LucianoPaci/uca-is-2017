instance creation
faces: aNumberOfFaces obtainingValuesFrom: aNumberProvider
	self assertFacesShouldBeGreaterThanZero: aNumberOfFaces.
	^ self new intializeSized: aNumberOfFaces initializeValues: aNumberProvider.