tests
testWhenACardIsNotEqualToAnotherCard
	| cardDamping cardCancellation |
	cardDamping := CardDamping named: 'CardDamping1'.
	cardCancellation := CardCancellation named: 'CardCancellation1'.
	self assert: (cardDamping == cardCancellation) equals: false.
	self assert: (cardCancellation == cardDamping ) equals: false.