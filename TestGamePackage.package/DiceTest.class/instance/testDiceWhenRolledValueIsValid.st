tests
testDiceWhenRolledValueIsValid
	| dice diceValue |
	dice := Dice faces: 9.
	diceValue := dice roll.
	self assert: (diceValue between: 1 and: dice amountOfFaces )