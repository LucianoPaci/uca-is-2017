instance creation
faces: aNumberOfFaces
	self assertFacesShouldBeGreaterThanZero: aNumberOfFaces.
	^ self new intializeSized: aNumberOfFaces