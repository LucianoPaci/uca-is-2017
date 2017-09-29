tests
testDiceCreationWithDefinedAmountOfFaces
	| dice |
	dice := Dice faces: 6.
	self assert: dice amountOfFaces equals: 6