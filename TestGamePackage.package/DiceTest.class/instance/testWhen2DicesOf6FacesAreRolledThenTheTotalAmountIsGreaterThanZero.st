tests
testWhen2DicesOf6FacesAreRolledThenTheTotalAmountIsGreaterThanZero
	| dices dice1 dice2 totalRoll |
	dices := OrderedCollection new.
	dice1 := Dice faces: 6.
	dice2 := Dice faces: 6.
	dices
		add: dice1;
		add: dice2.
	totalRoll := dices sumNumbers: [ :dice | dice roll ].
	self assert: totalRoll > 0