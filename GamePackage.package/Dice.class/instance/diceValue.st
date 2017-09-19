accesing
diceValue
	| aux |
	aux := value.
	value := value+1.
	value > amountOfFaces
		ifTrue: [ value := 1 ].
	^ aux